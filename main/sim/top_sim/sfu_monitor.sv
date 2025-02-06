


`define U_DUT_TOP tb.u_top.u0_dut_top
`define U_SFU_TOP `U_DUT_TOP.u5_sfu_top


module sfu_monitor #(
    parameter INPUT_LENGTH = 16,
    parameter NUM_CH       = 32
) (
    // Intputs
    input logic clk,
    input logic rst,
    input logic [7:0] params_step_num  // From u_top of top.v
);


  wire err_flag;


`ifdef COMP


//  wire                    sfu_gather_valid = `U_SFU_TOP.sfu_gather_valid;
//  wire [NUM_CH-1:0][15:0] sfu_gather_data = `U_SFU_TOP.sfu_gather_data;
//
//
//  sub_mon_param #(
//      .FILE("./E.txt"),
//      .ELEMENT_NUM(NUM_CH),
//      .ELEMENT_WIDTH(16)
//  ) u00_ln_result_mon (
//      .clk (clk),
//      .rst (rst),
//      .ivld(sfu_gather_valid),
//      .din (sfu_gather_data),
//      .step_num  (params_step_num)
//  );
//


  wire           		  sfu_o_valid  =     `U_DUT_TOP.u6_sfu_out_top.m_sfu_axis_tvalid && `U_DUT_TOP.u6_sfu_out_top.m_sfu_axis_tready        ;
  wire [NUM_CH-1:0][15:0] sfu_o_data = `U_DUT_TOP.u6_sfu_out_top.m_sfu_axis_tdata;

  sub_mon_param #(
      .FILE("./E.txt"),
      .ELEMENT_NUM(NUM_CH),
      .ELEMENT_WIDTH(16)
  ) u01_ln_out_mon (
      .clk (clk),
      .rst (rst),
      .ivld(sfu_o_valid),
      .din (sfu_o_data),
      .step_num  (params_step_num)
  );



  //assign err_flag = u00_ln_result_mon.err_flag || u01_ln_out_mon.err_flag;
  assign err_flag   = u01_ln_out_mon.err_flag;


`else

  assign err_flag = 1'b0;


`endif


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //wire 			 sfu_layernorm_input_valid = tb.u_top.u2_dma_top.u2_dma_dmux_top.u_rdma_dmux.sfu_write_valid0_wire;
  //wire [NUM_CH-1:0][15:0]  sfu_layernorm_input_data  = tb.u_top.u2_dma_top.u2_dma_dmux_top.u_rdma_dmux.sfu_write_data0_wire;

  //sub_mon_param #(.FILE("./layernorm_input.txt"), .ELEMENT_NUM(NUM_CH), .ELEMENT_WIDTH(16)) u01_ln_input_mon (.clk(clk), .rst(rst), .ivld(sfu_layernorm_input_valid), .din(sfu_layernorm_input_data));




endmodule

