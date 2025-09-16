`define U_DUT_TOP tb.u_top.u0_dut_top.u0_dut_top


module ini_mem (  /*autoarg*/);

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  parameter  ROWS         = 32;
  parameter  INPUT_LENGTH = 16;
  localparam DRATIO       = INPUT_LENGTH/8;

  integer fp_a, fp_b, fp_c,fp_t;

  integer                           i;

  reg     [                   63:0] all_line_count;

  reg     [(ROWS*INPUT_LENGTH)-1:0] rdata;
//  reg     [   (3*INPUT_LENGTH)-1:0] prdata;

  integer                           fp_params;
  integer SMATRIX_SIZE, MATRIX_SIZE;
  integer start_addr0, start_addr1, start_addr2;
  integer all_matrix_cnt, direct_mode;
  integer scanfi;


  reg     [(ROWS*INPUT_LENGTH)-1:0] rdata_inv;

  initial begin

    //fp_params = $fopen("params.txt","r");
    //scanfi=$fscanf(fp_params,"%d",  SMATRIX_SIZE   ) ;
    //scanfi=$fscanf(fp_params,"%d",   MATRIX_SIZE   ) ;
    //scanfi=$fscanf(fp_params,"%d",  start_addr0     ) ;
    //scanfi=$fscanf(fp_params,"%d",  start_addr1     ) ;
    //scanfi=$fscanf(fp_params,"%d",  start_addr2     ) ;
    //scanfi=$fscanf(fp_params,"%d",  all_matrix_cnt ) ;
    //scanfi=$fscanf(fp_params,"%d",  direct_mode    ) ;
    //$fclose(fp_params);
    start_addr0 = 0;
    start_addr1 = 0;
    start_addr2 = 0;

`ifdef LOAD_BIN
    `ifdef VM
        force  tb.u_top.u0_dut_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.params_vm_enable = 1 ;
    `endif
    $display("%m: ----  mem ini start    \n  ");
    all_line_count = 0;
    fp_a = $fopen("A_rtl.bin", "r");
    while (1) begin
      scanfi=$fscanf(fp_a, "%h", all_line_count);
      scanfi=$fscanf(fp_a, "%h", rdata);
      if ($feof(fp_a)) break;
      tb.u00_ram.mem[all_line_count+start_addr0/DRATIO/ROWS] = rdata;
      //all_line_count++;
    end
    $display("%m: ---- feature mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    all_line_count = 0;
    fp_b = $fopen("B_rtl.bin", "r");
    while (1) begin
      scanfi=$fscanf(fp_b, "%h", all_line_count);
      scanfi=$fscanf(fp_b, "%h", rdata);
      if ($feof(fp_b)) break;
      tb.u01_ram.mem[all_line_count+start_addr1/DRATIO/ROWS] = rdata;
      //all_line_count++;
    end
    $display("%m: ---- weight mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    all_line_count = 0;
    fp_c = $fopen("C_rtl.bin", "r");
    while (1) begin
      scanfi=$fscanf(fp_c, "%h", all_line_count);
      scanfi=$fscanf(fp_c, "%h", rdata);
      if ($feof(fp_c)) break;
      //tb.u01_ram.mem[all_line_count+start_addr2/2/ROWS + SMATRIX_SIZE*SMATRIX_SIZE*all_matrix_cnt/ROWS ]  = rdata  ;		
      tb.u02_ram.mem[all_line_count+start_addr2/DRATIO/ROWS] = rdata;
      //all_line_count++;
    end
    $display("%m: ---- bias mem ( %d ) ini done    \n  ", all_line_count * ROWS);
 
    all_line_count = 0;
    fp_t = $fopen("T_rtl.bin", "r");
    while (1) begin
      //scanfi=$fscanf(fp_t, "%h", all_line_count);
      scanfi=$fscanf(fp_t, "%h", rdata);
      if ($feof(fp_t)) break;
      if (rdata[7:0]===8'hxx) break;
      tb.u_top.u0_dut_top.u01_sram_top.u08_greg_sram.u_greg_sram.u_dpsram.mem[all_line_count] = rdata;
      all_line_count++;
    end

    $display("%m: ---- token mem ( %d ) ini done    \n  ", all_line_count * ROWS);
     

    $fclose(fp_a);
    $fclose(fp_b);
    $fclose(fp_c);
    $fclose(fp_t);

    force  `U_DUT_TOP.u2_dma_top.u2_dma_dmux_top.u_rdma_dmux.params_greg0_waddr[15:0] =   all_line_count ;
    force  `U_DUT_TOP.u9_greg_sram_rctrl.params_greg0_raddr[15:0] =   all_line_count - 1  ;
    force  `U_DUT_TOP.u0_CFG_TOP.u_MFUNC_TOP.params_greg0_force_en  = 1'd1 ; 

    force  `U_DUT_TOP.u1_decode_top.u_greg_top.greg[12] = all_line_count ;

    wait (~`U_DUT_TOP.u9_greg_sram_rctrl.rst);
     @(posedge  `U_DUT_TOP.u9_greg_sram_rctrl.clk  );
     @(posedge  `U_DUT_TOP.u9_greg_sram_rctrl.clk  );
    force  `U_DUT_TOP.u0_CFG_TOP.u_MFUNC_TOP.params_greg0_force_en  = 1'd0 ; 


`else
    $display("%m: ----  mem ini start    \n  ");
    all_line_count = 0;
    fp_a = $fopen("A.bin", "r");
    while (1) begin
      scanfi=$fread(  rdata , fp_a,  , ROWS*DRATIO   )  ;
      if ($feof(fp_a)) break;
      for (i = 0; i < ROWS*DRATIO; i = i + 1) begin
      	rdata_inv[(ROWS*DRATIO-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u00_ram.mem[all_line_count+start_addr0/DRATIO/ROWS] = rdata_inv;
      if (all_line_count<8)  begin
      $display("%m: ---- mem0:%h    \n  ", rdata_inv);
      end
      all_line_count++;
    end
    $display("%m: ---- A mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    all_line_count = 0;
    fp_b = $fopen("B.bin", "r");
    while (1) begin
      scanfi=$fread(  rdata , fp_b,  , ROWS*DRATIO   )  ;
      if ($feof(fp_b)) break;
      for (i = 0; i < ROWS*DRATIO; i = i + 1) begin
      	rdata_inv[(ROWS*DRATIO-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u01_ram.mem[all_line_count+start_addr1/DRATIO/ROWS] = rdata_inv;
      if (all_line_count<8)  begin
      $display("%m: ---- mem1:%h    \n  ", rdata_inv);
      end
      all_line_count++;
    end
    $display("%m: ---- B mem ( %d ) ini done    \n  ", all_line_count * ROWS);

    ////512*128*2*24/32
    //for(i=0;i<  512*128*2*24/32 ; i++  )
    //begin
    //    all_line_count--;
    //    tb.u01_ram.mem[all_line_count] = i%10 ; 
    //end

    all_line_count = 0;
    fp_c = $fopen("C.bin", "r");
    while (1) begin
      scanfi=$fread(  rdata , fp_c,  , ROWS*DRATIO   )  ;
      if ($feof(fp_c)) break;
      for (i = 0; i < ROWS*DRATIO; i = i + 1) begin
      	rdata_inv[(ROWS*DRATIO-i-1)*8+:8] =  rdata[i*8+:8];
      end
      tb.u02_ram.mem[all_line_count+start_addr2/DRATIO/ROWS] = rdata_inv;
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
    fp_a = $fopen("test_pic.bin", "r");
    all_line_count = 0;
    start_addr0 = 0;
    while (1) begin
      $fread(  rdata , fp_a,  , ROWS*2   )  ;
      //prdata     = 0 ;
      //rdata_inv = 0 ;
      //scanfi=$fread(  prdata , fp_a,  ,     )  ;
      if ($feof(fp_a)) break;
      for (i = 0; i < ROWS*2; i = i + 1) begin
       rdata_inv[(ROWS*2-i-1)*8+:8] =  rdata[i*8+:8];
      end
      //for (i = 0; i < 3*2; i = i + 1) begin
      // rdata_inv[(3*2-i-1)*8+:8] =  prdata[i*8+:8];
      //end
      tb.u00_ram.mem[all_line_count+start_addr0/DRATIO/ROWS] = rdata_inv;
      //if (all_line_count<8)  begin      
      $display("%m: ---- picture-%0d:%h    \n  ", all_line_count,rdata_inv);    
      //end
      all_line_count++;
    end
    //$display("Picture ini_done");
    $display("%m: ---- Picture ( %d ) ini done    \n  ", all_line_count * 3);

    $fclose(fp_a);


`endif


  end

endmodule


