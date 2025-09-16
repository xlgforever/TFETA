module cmac_model(/*autoarg*/
   // Outputs
   qsfp0_mac_tx_axis_tready, qsfp0_rx_axis_tdata_int,
   qsfp0_rx_axis_tkeep_int, qsfp0_rx_axis_tlast_int,
   qsfp0_rx_axis_tuser_int, qsfp0_rx_axis_tvalid_int,
   qsfp0_rx_clk_int, qsfp0_rx_rst_int, qsfp0_tx_clk_int,
   qsfp0_tx_rst_int, qsfp1_mac_tx_axis_tready,
   qsfp1_rx_axis_tdata_int, qsfp1_rx_axis_tkeep_int,
   qsfp1_rx_axis_tlast_int, qsfp1_rx_axis_tuser_int,
   qsfp1_rx_axis_tvalid_int, qsfp1_rx_clk_int, qsfp1_rx_rst_int,
   qsfp1_tx_clk_int, qsfp1_tx_rst_int,
   // Inputs
   qsfp0_mac_tx_axis_tdata, qsfp0_mac_tx_axis_tkeep,
   qsfp0_mac_tx_axis_tlast, qsfp0_mac_tx_axis_tuser,
   qsfp0_mac_tx_axis_tvalid, qsfp1_mac_tx_axis_tdata,
   qsfp1_mac_tx_axis_tkeep, qsfp1_mac_tx_axis_tlast,
   qsfp1_mac_tx_axis_tuser, qsfp1_mac_tx_axis_tvalid
   );


input [511:0]		qsfp0_mac_tx_axis_tdata;// From u0_qsfp0_cmac_pad_inst of cmac_pad.v
input [63:0]		qsfp0_mac_tx_axis_tkeep;// From u0_qsfp0_cmac_pad_inst of cmac_pad.v
input			qsfp0_mac_tx_axis_tlast;// From u0_qsfp0_cmac_pad_inst of cmac_pad.v
input			qsfp0_mac_tx_axis_tuser;// From u0_qsfp0_cmac_pad_inst of cmac_pad.v
input			qsfp0_mac_tx_axis_tvalid;// From u0_qsfp0_cmac_pad_inst of cmac_pad.v

input [511:0]		qsfp1_mac_tx_axis_tdata;// From u1_qsfp1_cmac_pad_inst of cmac_pad.v
input [63:0]		qsfp1_mac_tx_axis_tkeep;// From u1_qsfp1_cmac_pad_inst of cmac_pad.v
input			qsfp1_mac_tx_axis_tlast;// From u1_qsfp1_cmac_pad_inst of cmac_pad.v
input			qsfp1_mac_tx_axis_tuser;// From u1_qsfp1_cmac_pad_inst of cmac_pad.v
input			qsfp1_mac_tx_axis_tvalid;// From u1_qsfp1_cmac_pad_inst of cmac_pad.v

output reg  			qsfp0_mac_tx_axis_tready;// To u0_qsfp0_cmac_pad_inst of cmac_pad.v
output wire  [511:0]		qsfp0_rx_axis_tdata_int;// To u3_cmac_rx of cmac_rx.v
output wire  [63:0]		qsfp0_rx_axis_tkeep_int;// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp0_rx_axis_tlast_int;// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp0_rx_axis_tuser_int;// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp0_rx_axis_tvalid_int;// To u3_cmac_rx of cmac_rx.v

output wire 			qsfp0_rx_clk_int;	// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp0_rx_rst_int;	// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp0_tx_clk_int;	// To u0_qsfp0_cmac_pad_inst of cmac_pad.v, ...
output wire 			qsfp0_tx_rst_int;	// To u0_qsfp0_cmac_pad_inst of cmac_pad.v, ...

output reg 			qsfp1_mac_tx_axis_tready;// To u1_qsfp1_cmac_pad_inst of cmac_pad.v
output wire  [511:0]		qsfp1_rx_axis_tdata_int;// To u3_cmac_rx of cmac_rx.v
output wire  [63:0]		qsfp1_rx_axis_tkeep_int;// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp1_rx_axis_tlast_int;// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp1_rx_axis_tuser_int;// To u3_cmac_rx of cmac_rx.v
output wire 			qsfp1_rx_axis_tvalid_int;// To u3_cmac_rx of cmac_rx.v

output			qsfp1_rx_clk_int;	// To u3_cmac_rx of cmac_rx.v
output			qsfp1_rx_rst_int;	// To u3_cmac_rx of cmac_rx.v
output			qsfp1_tx_clk_int;	// To u1_qsfp1_cmac_pad_inst of cmac_pad.v, ...
output			qsfp1_tx_rst_int;	// To u1_qsfp1_cmac_pad_inst of cmac_pad.v, ...



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
wire			qsfp0_rx_clk_int;	// To u3_cmac_rx of cmac_rx.v
wire			qsfp0_rx_rst_int;	// To u3_cmac_rx of cmac_rx.v
wire			qsfp0_tx_clk_int;	// To u0_qsfp0_cmac_pad_inst of cmac_pad.v, ...
wire			qsfp0_tx_rst_int;	// To u0_qsfp0_cmac_pad_inst of cmac_pad.v, ...
wire			qsfp1_rx_clk_int;	// To u3_cmac_rx of cmac_rx.v
wire			qsfp1_rx_rst_int;	// To u3_cmac_rx of cmac_rx.v
wire			qsfp1_tx_clk_int;	// To u1_qsfp1_cmac_pad_inst of cmac_pad.v, ...

clk_gen #(.DELAY(1.5)) u_rclk0_clk_gen(qsfp0_rx_clk_int);
clk_gen #(.DELAY(1.5)) u_tclk0_clk_gen(qsfp0_tx_clk_int);
clk_gen #(.DELAY(1.5)) u_rclk1_clk_gen(qsfp1_rx_clk_int);
clk_gen #(.DELAY(1.5)) u_tclk1_clk_gen(qsfp1_tx_clk_int);

rst_gen   u_r0_rst_gen(.rst_p(qsfp0_rx_rst_int));
rst_gen   u_t0_rst_gen(.rst_p(qsfp0_tx_rst_int));
rst_gen   u_r1_rst_gen(.rst_p(qsfp1_rx_rst_int));
rst_gen   u_t1_rst_gen(.rst_p(qsfp1_tx_rst_int));



//reg            qsfp0_mac_tx_axis_tready ;
always @(posedge qsfp0_tx_clk_int or posedge qsfp0_tx_rst_int ) begin
  if ( qsfp0_tx_rst_int ) begin
    qsfp0_mac_tx_axis_tready <= 'd0;
  end 
  else begin
    qsfp0_mac_tx_axis_tready <= 1'b1;
    //qsfp0_mac_tx_axis_tready <= $random;
    //qsfp0_mac_tx_axis_tready <= ~qsfp0_mac_tx_axis_tready;
  end
end



//assign  	qsfp0_mac_tx_axis_tready   =  1'b1  ;

assign  	qsfp0_rx_axis_tdata_int    =   qsfp0_mac_tx_axis_tdata  ;
assign  	qsfp0_rx_axis_tkeep_int    =   qsfp0_mac_tx_axis_tkeep  ;
assign  	qsfp0_rx_axis_tlast_int    =   qsfp0_mac_tx_axis_tlast  ;
assign  	qsfp0_rx_axis_tuser_int    =   qsfp0_mac_tx_axis_tuser  ;
assign  	qsfp0_rx_axis_tvalid_int   =   qsfp0_mac_tx_axis_tvalid  &&  qsfp0_mac_tx_axis_tready;

//assign  	qsfp1_mac_tx_axis_tready   =  1'b1  ;
always @(posedge qsfp1_tx_clk_int or posedge qsfp1_tx_rst_int ) begin
  if ( qsfp1_tx_rst_int ) begin
    qsfp1_mac_tx_axis_tready <= 'd0;
  end 
  else begin
    qsfp1_mac_tx_axis_tready <= 1'b1;
    //qsfp1_mac_tx_axis_tready <= $random;
    //qsfp1_mac_tx_axis_tready <= ~qsfp1_mac_tx_axis_tready;
  end
end



assign  	qsfp1_rx_axis_tdata_int    =   qsfp1_mac_tx_axis_tdata  ;
assign  	qsfp1_rx_axis_tkeep_int    =   qsfp1_mac_tx_axis_tkeep  ;
assign  	qsfp1_rx_axis_tlast_int    =   qsfp1_mac_tx_axis_tlast  ;
assign  	qsfp1_rx_axis_tuser_int    =   qsfp1_mac_tx_axis_tuser  ;
assign  	qsfp1_rx_axis_tvalid_int   =   qsfp1_mac_tx_axis_tvalid && qsfp1_mac_tx_axis_tready;




endmodule




