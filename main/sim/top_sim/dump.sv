`define U_DUT_TOP tb.u_top.u0_dut_top



module dump ();


`ifdef DUMP
  initial begin

    //#44_000_000 

    //wait (tb.finance_v2_top.u_own_top.u_sub_top.u_mirp_out_top.u_mdqp_mem_ctrl.mirp_sn_enable);

   // wait(  `U_DUT_TOP.u1_decode_top.u_decode.params_decode_repeat_ro[7:0] == 'd14  ) ;
   //wait(tb.u_monitor.params_step_num[7:0] == 'd37);
   //wait(tb.u_monitor.params_step_num[7:0] == 'd21);
   //wait(tb.u_top.u0_dut_top.u1_decode_top.u_decode.params_loop_cnt0_ro[15:0]=='d22);
   //wait(tb.u_monitor.params_step_num[7:0] == 'd16);
	//wait(tb.u_top.u0_dut_top.params_sfu_cal_mode[4:0] = 'd10);
    //#890_000;

    //$vcdpluson;
    //$vcdplusmemon;
    //$vcdplusglitchon;
    //$vcdplusflush;
    //#DUMP_ED ;
    //$finish ;
    //$vcdplusoff;


    $fsdbAutoSwitchDumpfile(1000, "mac.fsdb", 100);
    $fsdbDumpoff;

    $fsdbDumpSVA;
    $fsdbDumpMDA;
    $fsdbDumpMem;

    //$fsdbDumpvars(0,tb.tx_mon);
    //$fsdbDumpvars(1,tb.wrapper_filter_rx_top.filter_rx_top);
    //$fsdbDumpvars(1,tb.wrapper_filter_rx_top.filter_rx_top.filter_rx_fsm);
    //$fsdbDumpvars(0,tb_Vortex);
    $fsdbDumpvars(0, tb);
    $fsdbDumpon;
    //wait ( tb.tx_sys.tcp_frame_cnt[31:0]==32'd15000 );
    //wait ( tb_uart_axi.u_uart_driver.read_finish==1);
    //#1000_000_000 ;
    //#100_000;
    //$fsdbDumpoff;
    //wait(tb.u_top.u0_dut_top.u1_decode_top.u_decode.params_loop_cnt1_ro[15:0]=='d0);
    //wait(tb.u_top.u0_dut_top.u1_decode_top.u_decode.params_loop_cnt1_ro[15:0]=='d4);

    //wait (tb.u_top.u3_smatrix_top.smatrix_calc_done);
   wait(  tb.u_top.u0_dut_top.u1_decode_top.u_decode.params_loop_cnt0_ro[15:0] == 'd1  ) ;

    #1000_000;

    //wait(tb.u_monitor.params_step_num[7:0] == 'd22);
    $finish ;

  end

`endif






endmodule






