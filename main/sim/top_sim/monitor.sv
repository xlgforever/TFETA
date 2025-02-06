

`define U_SMATRIX_TOP tb.u_top.u0_dut_top.u3_smatrix_top

`define U_DUT_TOP tb.u_top.u0_dut_top


module monitor #(
    parameter INPUT_LENGTH = 16,
    parameter OUTPUT_LENGTH = 16,
    parameter ROWS    = 4,
    parameter COLUMNS = 4,
    parameter ID_WIDTH = $clog2(16),
    parameter DATA_FLOW = fpga_pkg::data_flow_e'(1),
    parameter MAC_DELAY = 9
    //parameter  int unsigned MATRIX_SIZE =  64   ,
    //parameter  int unsigned SMATRIX_SIZE =  128   

) (
    // Intputs
    input logic       clk,
    input logic       rst,
    input logic [7:0] params_step_num  // From u_top of top.v
);

  //wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din0                       =     tb.u_top.sfu_write_data0             ;	
  //wire   				vpu_din0_vld                     =     tb.u_top.sfu_write_valid0            ;	
  //wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din1                       =     tb.u_top.sfu_write_data1             ;	
  //wire   				vpu_din1_vld                     =     tb.u_top.sfu_write_valid1            ;	


  wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din0                       =     `U_DUT_TOP.u4_smatrix_out_top.u2_smatrix_orctrl.s_axis_tdata             ;
  wire                              vpu_din0_vld                   =     `U_DUT_TOP.u4_smatrix_out_top.u2_smatrix_orctrl.s_axis_tvalid            ;

`ifdef MULTI_CORE
  wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din1                       =     `U_DUT_TOP.u4_2_smatrix_out_top.u2_smatrix_orctrl.s_axis_tdata           ;	
  wire   			    vpu_din1_vld                   =     `U_DUT_TOP.u4_2_smatrix_out_top.u2_smatrix_orctrl.s_axis_tvalid          ;
  //wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din                        =     vpu_din0_vld ?   vpu_din0  : vpu_din1  ; 
  //wire                              vpu_din_vld                    =     vpu_din0_vld ||  vpu_din1_vld ;

  wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din                        =     vpu_din0  ; 
  wire                              vpu_din_vld                    =     vpu_din0_vld  ;

`else
  wire    [(ROWS*INPUT_LENGTH)-1:0] vpu_din                        =     vpu_din0  ; 
  wire                              vpu_din_vld                    =     vpu_din0_vld  ;
`endif


  wire params_transpose_en = `U_DUT_TOP.params_transpose_en[0:0];

  wire smatrix_last_out = `U_SMATRIX_TOP.smatrix_last_out;
  wire [ROWS-1:0][INPUT_LENGTH-1:0] smatrix_out = `U_SMATRIX_TOP.smatrix_out;
  wire smatrix_ovalid = `U_SMATRIX_TOP.smatrix_ovalid;
  wire smatrix_calc_done = `U_SMATRIX_TOP.smatrix_calc_done;





  logic [31:0] total_cnt;
  logic [31:0] round_cnt;
  logic [31:0] loop_cnt;
  //wire data_come = matrix_valid_o &&  |matrix_id_o ;
  wire data_come = smatrix_ovalid;

  integer fp_result, fp_result2, fp_result_c, fp_result2_c;
  integer fr ;
  logic   [ROWS-1:0][COLUMNS-1:0][OUTPUT_LENGTH-1:0] matrix_result_c_tmp;
  string                                             line;
  integer                                            all_line_count;
  integer                                            matrix_line_count;
  integer                                            matrix_count;
  logic   [    31:0]                                 round_max;

  real                                               run_cnt;

  logic   [    63:0]                                 desired_cycle_cnt;
  integer                                            transpose_en;
  integer                                            matrix_calc_all_cnt;
  integer                                            tie_calc_all_cnt;

  logic                                              compare_fail;

  integer                                            fp_params;
  integer SMATRIX_ROW, SMATRIX_COL1, SMATRIX_COL2, MATRIX_SIZE;
  integer start_addr0, start_addr1, start_addr2;
  integer all_matrix_cnt, direct_mode;
  real top1_value, top2_value, top3_value, top4_value, top5_value;

  real systolic_array_cnt;


  real time_cnt;

  reg run_flag;

  //reg  [19:0][63:0]   step_run_cnt ; 
  real step_run_cnt[64];



  real layer_normal_cnt;  //= step_run_cnt[0]  + step_run_cnt[10]  +   step_run_cnt[15] ;
  real softmax_cnt;  //= step_run_cnt[5]  + step_run_cnt[18]  ;
  real gelu_cnt;  //= step_run_cnt[12]                     ;
  real	matrix_cnt            ;//= step_run_cnt[1]  + step_run_cnt[2]  +  step_run_cnt[4] + step_run_cnt[6] + step_run_cnt[8] + step_run_cnt[11]  + step_run_cnt[13];
  real sfu_scalar_multi_cnt;  //= step_run_cnt[3];
  real sfu_matrix_add_cnt;  //      = step_run_cnt[9]  + step_run_cnt[14];
  real sfu_vec_multi_cnt;  //= step_run_cnt[16];
  real sfu_vec_add_cnt;  //= step_run_cnt[17];
  real sfu_sort_five_cnt;  //= step_run_cnt[19];

  real mas_all = 1023.0;
  real exp_all = 15.0;

  genvar i;
  generate
    for (i = 0; i < 64; i = i + 1) begin : step_monitor_cnt
      step_monitor #(
          .STEP_NUM(i)
      ) u_step_monitor (
          .step_run_cnt   (step_run_cnt[i]),
          .clk            (clk),
          .rst            (rst),
	  .dsp_rst        (1'b0),
          .run_flag       (run_flag),
          .params_step_num(params_step_num)
      );
    end

  endgenerate


always @(*) begin
`ifdef  VIT_LUT
        layer_normal_cnt = step_run_cnt[0] + step_run_cnt[10] + step_run_cnt[15];
        softmax_cnt = step_run_cnt[5] + step_run_cnt[18];
        gelu_cnt = step_run_cnt[12];
        matrix_cnt           = step_run_cnt[1]  + step_run_cnt[2]  +  step_run_cnt[4] + step_run_cnt[6] + step_run_cnt[8] + step_run_cnt[11]  + step_run_cnt[13];
        if (matrix_cnt == 0) matrix_cnt = 1;
        sfu_scalar_multi_cnt = step_run_cnt[3];
        sfu_matrix_add_cnt   = step_run_cnt[9] + step_run_cnt[14];
        sfu_vec_multi_cnt    = step_run_cnt[16];
        sfu_vec_add_cnt      = step_run_cnt[17];
        sfu_sort_five_cnt    = step_run_cnt[19];
`else
        layer_normal_cnt = step_run_cnt[0] +  step_run_cnt[28]  +  step_run_cnt[35]  ;
        softmax_cnt = step_run_cnt[22];
        gelu_cnt = step_run_cnt[31];
        matrix_cnt           = step_run_cnt[1]  + step_run_cnt[2] + step_run_cnt[3]   + step_run_cnt[19]  + step_run_cnt[21] + step_run_cnt[24]  + step_run_cnt[26]  + step_run_cnt[29]  + step_run_cnt[30] + step_run_cnt[33]  + step_run_cnt[36] ;
        if (matrix_cnt == 0) matrix_cnt = 1;
        sfu_scalar_multi_cnt = step_run_cnt[10] ;
        sfu_matrix_add_cnt   = step_run_cnt[15] + step_run_cnt[16] + step_run_cnt[27]   + step_run_cnt[34]   ;
        sfu_vec_multi_cnt    = step_run_cnt[11] + step_run_cnt[12] + step_run_cnt[13] + step_run_cnt[14] + step_run_cnt[32] ;
        sfu_vec_add_cnt      = 0;
        sfu_sort_five_cnt    = step_run_cnt[37];

`endif
end

  initial begin
    run_cnt = 0;
    //compare_fail = 0;

    total_cnt = 0;
    round_cnt = 0;
    loop_cnt = 0;

`ifdef SUB_TEST
    fp_params = $fopen("params.txt", "r");
    $fscanf(fp_params, "%d", SMATRIX_ROW);
    $fscanf(fp_params, "%d", MATRIX_SIZE);
    $fscanf(fp_params, "%d", start_addr0);
    $fscanf(fp_params, "%d", start_addr1);
    $fscanf(fp_params, "%d", start_addr2);
    $fscanf(fp_params, "%d", all_matrix_cnt);
    $fscanf(fp_params, "%d", direct_mode);
    $fscanf(fp_params, "%d", transpose_en);
    $fscanf(fp_params, "%d", desired_cycle_cnt);
    $fscanf(fp_params, "%d", matrix_calc_all_cnt);
    $fscanf(fp_params, "%d", tie_calc_all_cnt);
    $fscanf(fp_params, "%d", SMATRIX_COL1);
    $fscanf(fp_params, "%d", SMATRIX_COL2);
    $fclose(fp_params);


    matrix_line_count = SMATRIX_ROW * SMATRIX_COL2;
    all_line_count    = SMATRIX_ROW * SMATRIX_COL2 * all_matrix_cnt;
    matrix_count      = all_matrix_cnt;

    // open file
    fp_result_c       = $fopen("D.txt", "r");
    // read file
    for (integer i = 0; i < ROWS; i = i + 1) begin
      for (integer j = 0; j < COLUMNS; j = j + 1) begin
        $fscanf(fp_result_c, "%h", matrix_result_c_tmp[i][j]);
      end
    end

    //$display("%m: ---- run_cycle is %0d  ;  utilization is %f     %d   \n  " , run_cnt   , (  $pow(( ($sqrt(all_line_count)) /ROWS),3)   )   ,      $pow(   ($sqrt(all_line_count)) /ROWS   , 3 )   );

    round_max = $floor(all_line_count / ROWS / COLUMNS);
    //round_max = 2;

    check_result();

    $fclose(fp_result_c);

`endif

    #1_00;

    wait (`U_DUT_TOP.u0_CFG_TOP.u_MFUNC_TOP.params_decode_done_ro);
    $display(
        "%m: ---- run_time is %0d us ---- Case_run_cycle is %0d ;  systolic_cnt is %0d ;  matrix_mult_cycle is %0d ;  matrix_utilization is %f \n  ",
        time_cnt, run_cnt, systolic_array_cnt, systolic_array_cnt * ROWS,
        (systolic_array_cnt * ROWS * 100) / run_cnt);

`ifdef  VIT_LUT
   
    for (int i = 0; i <= 19; i++) begin
      $display("%m: ---- step_%0d  ---- run_cnt is %0d / %0d ;  utilization is %f \n  ", i,
               step_run_cnt[i], run_cnt, (step_run_cnt[i] * 100) / run_cnt);
    end

`else

    for (int i = 0; i <= 37; i++) begin
      $display("%m: ---- step_%0d  ---- run_cnt is %0d / %0d ;  utilization is %f \n  ", i,
               step_run_cnt[i], run_cnt, (step_run_cnt[i] * 100) / run_cnt);
    end

`endif

    $display("\n %m:    matrix_cnt               utilization is %f  ,  systolic_utilization is  %f , decode_addr is %0d  \n ",
            (matrix_cnt * 100) / run_cnt, (systolic_array_cnt * ROWS * 100) / matrix_cnt   ,  tb.u_top.u0_dut_top.u1_decode_top.u_decode.decode_read_addr[12:0] );
    $display("%m:    layer_normal_cnt         utilization is %f \n  ",
             (layer_normal_cnt * 100) / run_cnt);
    $display("%m:    softmax_cnt              utilization is %f \n  ",
             (softmax_cnt * 100) / run_cnt);
    $display("%m:    gelu_cnt                 utilization is %f \n  ", (gelu_cnt * 100) / run_cnt);
    $display("%m:    sfu_scalar_multi_cnt     utilization is %f \n  ",
             (sfu_scalar_multi_cnt * 100) / run_cnt);
    $display("%m:    sfu_matrix_add_cnt       utilization is %f \n  ",
             (sfu_matrix_add_cnt * 100) / run_cnt);
    $display("%m:    sfu_vec_multi_cnt        utilization is %f \n  ",
             (sfu_vec_multi_cnt * 100) / run_cnt);
    $display("%m:    sfu_vec_add_cnt          utilization is %f \n  ",
             (sfu_vec_add_cnt * 100) / run_cnt);
    $display("%m:    sfu_sort_five_cnt        utilization is %f \n  ",
             (sfu_sort_five_cnt * 100) / run_cnt);



    #1_0000;
    wait (tb.u_top.u0_dut_top.u7_uart_top.u_dbg_bridge.u_fifo_tx.count_q[8:0] == 'd0 ) ; 
    //`ifdef COMP

    $display("systolic_array_cnt = %0d ", systolic_array_cnt);

    fr = $fopen("./R.txt", "w");

    if ((compare_fail) || (tb.u_sfu_monitor.err_flag)) begin 
      $display("Sim_Fail !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      $fdisplay(fr, "%0d", 0) ; 
    end
    else begin
      $display("Sim_Pass !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

      $writememh("A_rtl.bin", tb.u00_ram.mem);
      $writememh("B_rtl.bin", tb.u01_ram.mem);
      $writememh("C_rtl.bin", tb.u02_ram.mem);
      $writememh("T_rtl.bin", tb.u_top.u08_greg_sram.u_greg_sram.u_dpsram.mem);
      $fdisplay(fr, "%0d", 1) ; 
    end
    $fclose(fr);

    //`endif
    $display("Top1 index is %d ",tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_00e[15:0]);
    top1_value = 2**(tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_00e[30-:5] - exp_all) * (1 + tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_00e[25-:10]/mas_all);
    $display("Top1 value is %f ",top1_value);

    $display("Top2 index is %d ",tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_00f[15:0]);
    top2_value = 2**(tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_00f[30-:5] - exp_all) * (1 + tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_00f[25-:10]/mas_all);
    $display("Top2 value is %f ",top2_value);

    $display("Top3 index is %d ",tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_010[15:0]);
    top3_value = 2**(tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_010[30-:5] - exp_all) * (1 + tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_010[25-:10]/mas_all);
    $display("Top3 value is %f ",top3_value);

    $display("Top4 index is %d ",tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_011[15:0]);
    top4_value = 2**(tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_011[30-:5] - exp_all) * (1 + tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_011[25-:10]/mas_all);
    $display("Top4 value is %f ",top4_value);
    
    $display("Top5 index is %d ",tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_012[15:0]);
    top5_value = 2**(tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_012[30-:5] - exp_all) * (1 + tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_012[25-:10]/mas_all);
    $display("Top5 value is %f ",top5_value);

    // time
    $display("Inference time in Simulation is %d ns",tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.reg_020[31:0]*4);
    $finish;
  end

  task check_result;
    forever begin
      @(posedge clk);
      if (round_cnt == round_max) begin
        //$display("%m: ---- run_time is %0d ms ---  run_cycle is %0d ---  Desired_cycle is %d ---  utilization is   %d %%   \n  " ,   time_cnt  ,run_cnt ,   desired_cycle_cnt                 ,      (desired_cycle_cnt*100   / (run_cnt))  );					
        //#1_0000
        break;
        //$finish;
      end
      if (data_come) begin
        total_cnt = total_cnt + 1;
        if (loop_cnt < ROWS) begin
          loop_cnt = loop_cnt + 1;
        end else begin
          loop_cnt = 1;
          //read new data
          for (integer i = 0; i < ROWS; i = i + 1) begin
            for (integer j = 0; j < COLUMNS; j = j + 1) begin
              $fscanf(fp_result_c, "%h", matrix_result_c_tmp[i][j]);
            end
          end
        end
`ifdef COMP
        // print the result
        if(smatrix_out !== matrix_result_c_tmp[total_cnt-1-round_cnt*ROWS]   &&    ~params_transpose_en  )begin
          //compare_fail = 1;
          $display("[%0d]Error: smatrix_out[%0d] = %h, matrix_result_c_tmp[%0d] = %h", total_cnt,
                   total_cnt - 1 - round_cnt * ROWS, smatrix_out, total_cnt - 1 - round_cnt * ROWS,
                   matrix_result_c_tmp[total_cnt-1-round_cnt*ROWS]);
          #20000
          $display(
              "Sim Fail !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
          );
          $finish;
        end
`endif
        round_cnt = $floor(total_cnt / ROWS);
      end
    end
  endtask


  //run_flag 
  always @(posedge clk) begin
    if (rst) begin
      run_flag <= 'd0;
    end  //else if (|`U_SMATRIX_TOP.params_write_start) begin
    else if (`U_DUT_TOP.u1_decode_top.u_decode.d_rd0_st) begin
      run_flag <= 'b1;
    end
  end

  //run_cnt
  always @(posedge clk) begin
    if (rst) begin
      run_cnt <= 'd0;
    end else if (run_flag) begin
      run_cnt <= run_cnt + 'd1;
    end
  end

  //`U_SMATRIX_TOP.u0_matrix_top.matrix_calc_done
  reg [15:0] matrix_calc_cnt;
  always @(posedge clk) begin
    if (rst) begin
      matrix_calc_cnt <= 'd0;
    end else if (`U_SMATRIX_TOP.u0_matrix_top.matrix_calc_done) begin
      matrix_calc_cnt <= matrix_calc_cnt + 'd1;
`ifdef SUB_TEST
      $display(
          "#########################################################matrix_calc_cnt = %0d, matrix_calc_all_cnt = %0d",
          matrix_calc_cnt + 1, matrix_calc_all_cnt);
`else
      //$display("#########################################################matrix_calc_cnt = %0d ",  matrix_calc_cnt + 1      ); 		
`endif

    end
  end

  //`U_SMATRIX_TOP.u0_matrix_top.matrix_last_out
  always @(posedge clk) begin
    if (rst) begin
      systolic_array_cnt <= 'd0;
    end
   else if (  `U_SMATRIX_TOP.u0_matrix_top.u0_sub_matrix_top.matrix_last_o  &&   `U_SMATRIX_TOP.u0_matrix_top.u0_sub_matrix_top.matrix_valid_o  ) begin
      systolic_array_cnt <= systolic_array_cnt + 'd1;
      //matrix_calc_all_cnt
`ifdef SUB_TEST
      $display("systolic_array_cnt = %0d, systolic_array_all_cnt = %0d", systolic_array_cnt + 1,
               tie_calc_all_cnt);
`else
      //$display("systolic_array_cnt = %0d ",  systolic_array_cnt + 1    ); 		
`endif
    end
  end




  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  logic [ROWS-1:0][INPUT_LENGTH-1:0] matrix_result_do;
//  integer fp_result_do;
//
//  initial begin
//    #10
//    // open file
//`ifdef TRANS
//    fp_result_do = $fopen(
//        "DI.txt", "r"
//    );
//`else
//    fp_result_do = $fopen(
//        "DO.txt", "r"
//    );
//`endif
//    //if (transpose_en)
//    //	fp_result_do = $fopen("DI.txt","r");		
//    //else
//    //	fp_result_do = $fopen("DO.txt","r");
//
//    // read file
//    for (integer i = 0; i < ROWS; i = i + 1) begin
//      $fscanf(fp_result_do, "%h", matrix_result_do[i]);
//    end
//
//  end
//  reg [31:0] vpu_din0_cnt;
//
//  always @(posedge clk) begin
//    if (rst) begin
//      vpu_din0_cnt <= 'd0;
//    end else if (vpu_din_vld) begin
//      vpu_din0_cnt <= vpu_din0_cnt + 'd1;
//`ifdef COMP
//      // print the result
//      if (vpu_din !== matrix_result_do) begin
//        compare_fail <= 1;
//        $display("[%0d]Error: smtrix_dma_out  = %h, matrix_result_do = %h", vpu_din0_cnt, vpu_din,
//                 matrix_result_do);
//        #20000
//        $display(
//            "Sim Fail !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
//        );
//        $finish;
//      end
//
//      #1
//      for (integer i = 0; i < ROWS; i = i + 1) begin
//        $fscanf(fp_result_do, "%h", matrix_result_do[i]);
//      end
//`endif
//
//    end
//  end

  sub_mon_param #(
      `ifdef TRANS
      	.FILE("./DI.txt"),
      `else
      	.FILE("./DO.txt"),
      `endif
      .ELEMENT_NUM(ROWS),
      .ELEMENT_WIDTH(16)
  ) u_data_mon (
      .clk (clk),
      .rst (rst),
      .ivld( vpu_din_vld  ),
      .din ( vpu_din      ),
      .step_num  (params_step_num)
  );

`ifdef VIT_LUT

assign   compare_fail =  u_data_mon.err_flag ;


`else

wire          token_din_vld =  tb.u_top.u0_dut_top.u2_dma_top.u2_dma_dmux_top.u_rdma_dmux.object_qw_index_ro_valid;
wire [31:0]   token_din     =  tb.u_top.u0_dut_top.u2_dma_top.u2_dma_dmux_top.u_rdma_dmux.params_object_qw_index_ro[31:0];
  sub_mon_param #(
      .FILE("./T.txt"),
      .ELEMENT_NUM(1),
      .ELEMENT_WIDTH(32)
  ) u_token_mon (
      .clk (clk),
      .rst (rst),
      .ivld( token_din_vld  ),
      .din ( token_din      ),
      .step_num  (params_step_num)      
  );

assign   compare_fail =  u_data_mon.err_flag ||  u_token_mon.err_flag ;

`endif


  initial begin
    time_cnt = 32'd0;
    forever
    #100_000 begin
      time_cnt = time_cnt + 100;
      $display(" now is %d-us ,  systolic_array_cnt  is %0d  ,  layer_cnt  is %0d    ", time_cnt,
               systolic_array_cnt, `U_DUT_TOP.u1_decode_top.params_loop_cnt0_ro[7:0]);
    end
  end


  //params_step_num
  reg [7:0] params_step_num_dly;
  always @(posedge clk) begin
    if (rst) begin
      params_step_num_dly <= 'd0;
    end else begin
      params_step_num_dly <= params_step_num;
      if (params_step_num == params_step_num_dly) begin
      end else begin

        $display("\n %m:    matrix_cnt               utilization is %f  ,  systolic_utilization is  %f  , step_num is %0d , decode_addr is %0d  \n ",
            (matrix_cnt * 100) / run_cnt, (systolic_array_cnt * ROWS * 100) / matrix_cnt   , params_step_num , tb.u_top.u0_dut_top.u1_decode_top.u_decode.decode_read_addr[12:0] );
        $display("%m:    layer_normal_cnt         utilization is %f \n  ",
                 (layer_normal_cnt * 100) / run_cnt);
        $display("%m:    softmax_cnt              utilization is %f \n  ",
                 (softmax_cnt * 100) / run_cnt);
        $display("%m:    gelu_cnt                 utilization is %f \n  ",
                 (gelu_cnt * 100) / run_cnt);
        $display("%m:    sfu_scalar_multi_cnt     utilization is %f \n  ",
                 (sfu_scalar_multi_cnt * 100) / run_cnt);
        $display("%m:    sfu_matrix_add_cnt       utilization is %f \n  ",
                 (sfu_matrix_add_cnt * 100) / run_cnt);
        $display("%m:    sfu_vec_multi_cnt        utilization is %f \n  ",
                 (sfu_vec_multi_cnt * 100) / run_cnt);
        $display("%m:    sfu_vec_add_cnt          utilization is %f \n  ",
                 (sfu_vec_add_cnt * 100) / run_cnt);
        $display("%m:    sfu_sort_five_cnt        utilization is %f \n  ",
                 (sfu_sort_five_cnt * 100) / run_cnt);


      end
    end
  end
endmodule

