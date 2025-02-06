module ini_mem (  /*autoarg*/);

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  parameter ROWS = 32;
  parameter INPUT_LENGTH = 16;


  integer fp_a, fp_b, fp_c,fp_t,fp_p;

  integer                           i;

  reg     [                   63:0] all_line_count;

  reg     [(ROWS*INPUT_LENGTH)-1:0] rdata;

  integer                           fp_params;
  integer SMATRIX_SIZE, MATRIX_SIZE;
  integer start_addr0, start_addr1, start_addr2;
  integer all_matrix_cnt, direct_mode;


  reg     [(ROWS*INPUT_LENGTH)-1:0] rdata_inv;

  initial begin

    //fp_params = $fopen("params.txt","r");
    //$fscanf(fp_params,"%d",  SMATRIX_SIZE   ) ;
    //$fscanf(fp_params,"%d",   MATRIX_SIZE   ) ;
    //$fscanf(fp_params,"%d",  start_addr0     ) ;
    //$fscanf(fp_params,"%d",  start_addr1     ) ;
    //$fscanf(fp_params,"%d",  start_addr2     ) ;
    //$fscanf(fp_params,"%d",  all_matrix_cnt ) ;
    //$fscanf(fp_params,"%d",  direct_mode    ) ;
    //$fclose(fp_params);
    start_addr0 = 0;
    start_addr1 = 0;
    start_addr2 = 0;

`ifdef LOAD_BIN
    $display("%m: ----  mem ini start    \n  ");
    all_line_count = 0;
    fp_a = $fopen("A_rtl.bin", "r");
    while (1) begin
      $fscanf(fp_a, "%h", all_line_count);
      $fscanf(fp_a, "%h", rdata);
      if ($feof(fp_a)) break;
      tb.u00_ram.mem[all_line_count+start_addr0/2/ROWS] = rdata;
      //all_line_count++;
    end
    $display("%m: ---- feature mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    all_line_count = 0;
    fp_b = $fopen("B_rtl.bin", "r");
    while (1) begin
      $fscanf(fp_b, "%h", all_line_count);
      $fscanf(fp_b, "%h", rdata);
      if ($feof(fp_b)) break;
      tb.u01_ram.mem[all_line_count+start_addr1/2/ROWS] = rdata;
      //all_line_count++;
    end
    $display("%m: ---- weight mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    all_line_count = 0;
    fp_c = $fopen("C_rtl.bin", "r");
    while (1) begin
      $fscanf(fp_c, "%h", all_line_count);
      $fscanf(fp_c, "%h", rdata);
      if ($feof(fp_c)) break;
      //tb.u01_ram.mem[all_line_count+start_addr2/2/ROWS + SMATRIX_SIZE*SMATRIX_SIZE*all_matrix_cnt/ROWS ]  = rdata  ;		
      tb.u02_ram.mem[all_line_count+start_addr2/2/ROWS] = rdata;
      //all_line_count++;
    end
    $display("%m: ---- bias mem ( %d ) ini done    \n  ", all_line_count * ROWS);
 
    all_line_count = 0;
    fp_t = $fopen("T_rtl.bin", "r");
    while (1) begin
      //$fscanf(fp_t, "%h", all_line_count);
      $fscanf(fp_t, "%h", rdata);
      if ($feof(fp_t)) break;
      if (rdata[7:0]===8'hxx) break;
      tb.u_top.u08_greg_sram.u_greg_sram.u_dpsram.mem[all_line_count] = rdata;
      all_line_count++;
    end

    $display("%m: ---- token mem ( %d ) ini done    \n  ", all_line_count * ROWS);
     

    $fclose(fp_a);
    $fclose(fp_b);
    $fclose(fp_c);
    $fclose(fp_t);

    force  tb.u_top.u0_dut_top.u2_dma_top.u2_dma_dmux_top.u_rdma_dmux.params_greg_waddr[15:0] =   all_line_count ;
    force  tb.u_top.u0_dut_top.u9_greg_sram_rctrl.params_greg_raddr[15:0] =   all_line_count - 1  ;
    force  tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.params_greg_force_en  = 1'd1 ; 

    force  tb.u_top.u0_dut_top.u1_decode_top.u_greg_top.greg[12] = all_line_count ;

    wait (~tb.u_top.u0_dut_top.u9_greg_sram_rctrl.rst);
     @(posedge  tb.u_top.u0_dut_top.u9_greg_sram_rctrl.clk  );
     @(posedge  tb.u_top.u0_dut_top.u9_greg_sram_rctrl.clk  );
    force  tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.params_greg_force_en  = 1'd0 ; 


`else
    $display("%m: ----  mem ini start    \n  ");
    all_line_count = 0;
    fp_a = $fopen("./A.bin", "r");
    while (1) begin
      $fread(  rdata , fp_a,  , ROWS*2   )  ;
      if ($feof(fp_a)) break;
      for (i = 0; i < ROWS*2; i = i + 1) begin
      	rdata_inv[(ROWS*2-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u00_ram.mem[all_line_count+start_addr0/2/ROWS] = rdata_inv;
      if (all_line_count<8)  begin
      $display("%m: ---- mem0:%h    \n  ", rdata_inv);
      end
      all_line_count++;
    end
    $display("%m: ---- A mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    all_line_count = 0;
    fp_b = $fopen("./B.bin", "r");
    while (1) begin
      $fread(  rdata , fp_b,  , ROWS*2   )  ;
      if ($feof(fp_b)) break;
      for (i = 0; i < ROWS*2; i = i + 1) begin
      	rdata_inv[(ROWS*2-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u01_ram.mem[all_line_count+start_addr1/2/ROWS] = rdata_inv;
      if (all_line_count<8)  begin
      $display("%m: ---- mem1:%h    \n  ", rdata_inv);
      end
      all_line_count++;
    end
    $display("%m: ---- B mem ( %d ) ini done    \n  ", all_line_count * ROWS);


    all_line_count = 0;
    fp_c = $fopen("./C.bin", "r");
    while (1) begin
      $fread(  rdata , fp_c,  , ROWS*2   )  ;
      if ($feof(fp_c)) break;
      for (i = 0; i < ROWS*2; i = i + 1) begin
      	rdata_inv[(ROWS*2-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u02_ram.mem[all_line_count+start_addr2/2/ROWS] = rdata_inv;
      if (all_line_count<8)  begin
      $display("%m: ---- mem2:%h    \n  ", rdata_inv);
      end
      all_line_count++;
    end
    $display("%m: ---- C mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    $fclose(fp_a);
    $fclose(fp_b);
    $fclose(fp_c);

    // download picture to ddr
    fp_p = $fopen("test_pic.bin", "r");
    all_line_count = 0;
    start_addr0 = 0;
    while (1) begin
      $fread(  rdata , fp_p,  , ROWS*2   )  ;
      if ($feof(fp_a)) break;
      for (i = 0; i < ROWS*2; i = i + 1) begin
      	rdata_inv[(ROWS*2-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u00_ram.mem[all_line_count+start_addr0/2/ROWS] = rdata_inv;
      all_line_count++;
    end
    $display("Picture ini_done");
`endif


  end

endmodule


