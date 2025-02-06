/*

Copyright (c) 2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * AXI4 register
 */
module axi_register_dly #
(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 32,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 8,
    // Propagate awuser signal
    parameter AWUSER_ENABLE = 0,
    // Width of awuser signal
    parameter AWUSER_WIDTH = 1,
    // Propagate wuser signal
    parameter WUSER_ENABLE = 0,
    // Width of wuser signal
    parameter WUSER_WIDTH = 1,
    // Propagate buser signal
    parameter BUSER_ENABLE = 0,
    // Width of buser signal
    parameter BUSER_WIDTH = 1,
    // Propagate aruser signal
    parameter ARUSER_ENABLE = 0,
    // Width of aruser signal
    parameter ARUSER_WIDTH = 1,
    // Propagate ruser signal
    parameter RUSER_ENABLE = 0,
    // Width of ruser signal
    parameter RUSER_WIDTH = 1,
    // AW channel register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter AW_REG_TYPE = 1,
    // W channel register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter W_REG_TYPE = 2,
    // B channel register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter B_REG_TYPE = 1,
    // AR channel register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter AR_REG_TYPE = 1,
    // R channel register type
    // 0 to bypass, 1 for simple buffer, 2 for skid buffer
    parameter R_REG_TYPE = 2,

    parameter DELAY_CNT = 8 
)
(
    input  wire                     clk,
    input  wire                     rst,

    /*
     * AXI slave interface
     */
    input  wire [ID_WIDTH-1:0]      s_axi_awid,
    input  wire [ADDR_WIDTH-1:0]    s_axi_awaddr,
    input  wire [7:0]               s_axi_awlen,
    input  wire [2:0]               s_axi_awsize,
    input  wire [1:0]               s_axi_awburst,
    input  wire                     s_axi_awlock,
    input  wire [3:0]               s_axi_awcache,
    input  wire [2:0]               s_axi_awprot,
    input  wire [3:0]               s_axi_awqos,
    input  wire [3:0]               s_axi_awregion,
    input  wire [AWUSER_WIDTH-1:0]  s_axi_awuser,
    input  wire                     s_axi_awvalid,
    output wire                     s_axi_awready,
    input  wire [DATA_WIDTH-1:0]    s_axi_wdata,
    input  wire [STRB_WIDTH-1:0]    s_axi_wstrb,
    input  wire                     s_axi_wlast,
    input  wire [WUSER_WIDTH-1:0]   s_axi_wuser,
    input  wire                     s_axi_wvalid,
    output wire                     s_axi_wready,
    output wire [ID_WIDTH-1:0]      s_axi_bid,
    output wire [1:0]               s_axi_bresp,
    output wire [BUSER_WIDTH-1:0]   s_axi_buser,
    output wire                     s_axi_bvalid,
    input  wire                     s_axi_bready,
    input  wire [ID_WIDTH-1:0]      s_axi_arid,
    input  wire [ADDR_WIDTH-1:0]    s_axi_araddr,
    input  wire [7:0]               s_axi_arlen,
    input  wire [2:0]               s_axi_arsize,
    input  wire [1:0]               s_axi_arburst,
    input  wire                     s_axi_arlock,
    input  wire [3:0]               s_axi_arcache,
    input  wire [2:0]               s_axi_arprot,
    input  wire [3:0]               s_axi_arqos,
    input  wire [3:0]               s_axi_arregion,
    input  wire [ARUSER_WIDTH-1:0]  s_axi_aruser,
    input  wire                     s_axi_arvalid,
    output wire                     s_axi_arready,
    output wire [ID_WIDTH-1:0]      s_axi_rid,
    output wire [DATA_WIDTH-1:0]    s_axi_rdata,
    output wire [1:0]               s_axi_rresp,
    output wire                     s_axi_rlast,
    output wire [RUSER_WIDTH-1:0]   s_axi_ruser,
    output wire                     s_axi_rvalid,
    input  wire                     s_axi_rready,

    /*
     * AXI master interface
     */
    output wire [ID_WIDTH-1:0]      m_axi_awid,
    output wire [ADDR_WIDTH-1:0]    m_axi_awaddr,
    output wire [7:0]               m_axi_awlen,
    output wire [2:0]               m_axi_awsize,
    output wire [1:0]               m_axi_awburst,
    output wire                     m_axi_awlock,
    output wire [3:0]               m_axi_awcache,
    output wire [2:0]               m_axi_awprot,
    output wire [3:0]               m_axi_awqos,
    output wire [3:0]               m_axi_awregion,
    output wire [AWUSER_WIDTH-1:0]  m_axi_awuser,
    output wire                     m_axi_awvalid,
    input  wire                     m_axi_awready,
    output wire [DATA_WIDTH-1:0]    m_axi_wdata,
    output wire [STRB_WIDTH-1:0]    m_axi_wstrb,
    output wire                     m_axi_wlast,
    output wire [WUSER_WIDTH-1:0]   m_axi_wuser,
    output wire                     m_axi_wvalid,
    input  wire                     m_axi_wready,
    input  wire [ID_WIDTH-1:0]      m_axi_bid,
    input  wire [1:0]               m_axi_bresp,
    input  wire [BUSER_WIDTH-1:0]   m_axi_buser,
    input  wire                     m_axi_bvalid,
    output wire                     m_axi_bready,
    output wire [ID_WIDTH-1:0]      m_axi_arid,
    output wire [ADDR_WIDTH-1:0]    m_axi_araddr,
    output wire [7:0]               m_axi_arlen,
    output wire [2:0]               m_axi_arsize,
    output wire [1:0]               m_axi_arburst,
    output wire                     m_axi_arlock,
    output wire [3:0]               m_axi_arcache,
    output wire [2:0]               m_axi_arprot,
    output wire [3:0]               m_axi_arqos,
    output wire [3:0]               m_axi_arregion,
    output wire [ARUSER_WIDTH-1:0]  m_axi_aruser,
    output wire                     m_axi_arvalid,
    input  wire                     m_axi_arready,
    input  wire [ID_WIDTH-1:0]      m_axi_rid,
    input  wire [DATA_WIDTH-1:0]    m_axi_rdata,
    input  wire [1:0]               m_axi_rresp,
    input  wire                     m_axi_rlast,
    input  wire [RUSER_WIDTH-1:0]   m_axi_ruser,
    input  wire                     m_axi_rvalid,
    output wire                     m_axi_rready
);

    wire [ID_WIDTH-1:0]      gm_axi_awid[DELAY_CNT+1];
    wire [ADDR_WIDTH-1:0]    gm_axi_awaddr[DELAY_CNT+1];
    wire [7:0]               gm_axi_awlen[DELAY_CNT+1];
    wire [2:0]               gm_axi_awsize[DELAY_CNT+1];
    wire [1:0]               gm_axi_awburst[DELAY_CNT+1];
    wire                     gm_axi_awlock[DELAY_CNT+1];
    wire [3:0]               gm_axi_awcache[DELAY_CNT+1];
    wire [2:0]               gm_axi_awprot[DELAY_CNT+1];
    wire [3:0]               gm_axi_awqos[DELAY_CNT+1];
    wire [3:0]               gm_axi_awregion[DELAY_CNT+1];
    wire [AWUSER_WIDTH-1:0]  gm_axi_awuser[DELAY_CNT+1];
    wire                     gm_axi_awvalid[DELAY_CNT+1];
    wire                     gm_axi_awready[DELAY_CNT+1];
    wire [DATA_WIDTH-1:0]    gm_axi_wdata[DELAY_CNT+1];
    wire [STRB_WIDTH-1:0]    gm_axi_wstrb[DELAY_CNT+1];
    wire                     gm_axi_wlast[DELAY_CNT+1];
    wire [WUSER_WIDTH-1:0]   gm_axi_wuser[DELAY_CNT+1];
    wire                     gm_axi_wvalid[DELAY_CNT+1];
    wire                     gm_axi_wready[DELAY_CNT+1];
    wire [ID_WIDTH-1:0]      gm_axi_bid[DELAY_CNT+1];
    wire [1:0]               gm_axi_bresp[DELAY_CNT+1];
    wire [BUSER_WIDTH-1:0]   gm_axi_buser[DELAY_CNT+1];
    wire                     gm_axi_bvalid[DELAY_CNT+1];
    wire                     gm_axi_bready[DELAY_CNT+1];
    wire [ID_WIDTH-1:0]      gm_axi_arid[DELAY_CNT+1];
    wire [ADDR_WIDTH-1:0]    gm_axi_araddr[DELAY_CNT+1];
    wire [7:0]               gm_axi_arlen[DELAY_CNT+1];
    wire [2:0]               gm_axi_arsize[DELAY_CNT+1];
    wire [1:0]               gm_axi_arburst[DELAY_CNT+1];
    wire                     gm_axi_arlock[DELAY_CNT+1];
    wire [3:0]               gm_axi_arcache[DELAY_CNT+1];
    wire [2:0]               gm_axi_arprot[DELAY_CNT+1];
    wire [3:0]               gm_axi_arqos[DELAY_CNT+1];
    wire [3:0]               gm_axi_arregion[DELAY_CNT+1];
    wire [ARUSER_WIDTH-1:0]  gm_axi_aruser[DELAY_CNT+1];
    wire                     gm_axi_arvalid[DELAY_CNT+1];
    wire                     gm_axi_arready[DELAY_CNT+1];
    wire [ID_WIDTH-1:0]      gm_axi_rid[DELAY_CNT+1];
    wire [DATA_WIDTH-1:0]    gm_axi_rdata[DELAY_CNT+1];
    wire [1:0]               gm_axi_rresp[DELAY_CNT+1];
    wire                     gm_axi_rlast[DELAY_CNT+1];
    wire [RUSER_WIDTH-1:0]   gm_axi_ruser[DELAY_CNT+1];
    wire                     gm_axi_rvalid[DELAY_CNT+1];
    wire                     gm_axi_rready[DELAY_CNT+1];

/* axi_register  AUTO_TEMPLATE (
	.s_axi_\(.*\) 		(gm_axi_\1[i]),
	.m_axi_\(.*\) 		(gm_axi_\1[i+1]),
  );
*/

  genvar i;
  generate
    for (i = 0; i < DELAY_CNT ; i = i + 1) begin
 axi_register #( 
/*AUTOINSTPARAM*/
		// Parameters
		.DATA_WIDTH		(DATA_WIDTH),
		.ADDR_WIDTH		(ADDR_WIDTH),
		.STRB_WIDTH		(STRB_WIDTH),
		.ID_WIDTH		(ID_WIDTH),
		.AWUSER_ENABLE		(AWUSER_ENABLE),
		.AWUSER_WIDTH		(AWUSER_WIDTH),
		.WUSER_ENABLE		(WUSER_ENABLE),
		.WUSER_WIDTH		(WUSER_WIDTH),
		.BUSER_ENABLE		(BUSER_ENABLE),
		.BUSER_WIDTH		(BUSER_WIDTH),
		.ARUSER_ENABLE		(ARUSER_ENABLE),
		.ARUSER_WIDTH		(ARUSER_WIDTH),
		.RUSER_ENABLE		(RUSER_ENABLE),
		.RUSER_WIDTH		(RUSER_WIDTH),
		.AW_REG_TYPE		(AW_REG_TYPE),
		.W_REG_TYPE		(W_REG_TYPE),
		.B_REG_TYPE		(B_REG_TYPE),
		.AR_REG_TYPE		(AR_REG_TYPE),
		.R_REG_TYPE		(R_REG_TYPE)) u01_register(
   /*autoinst*/
								   // Outputs
								   .s_axi_awready	(gm_axi_awready[i]), // Templated
								   .s_axi_wready	(gm_axi_wready[i]), // Templated
								   .s_axi_bid		(gm_axi_bid[i]), // Templated
								   .s_axi_bresp		(gm_axi_bresp[i]), // Templated
								   .s_axi_buser		(gm_axi_buser[i]), // Templated
								   .s_axi_bvalid	(gm_axi_bvalid[i]), // Templated
								   .s_axi_arready	(gm_axi_arready[i]), // Templated
								   .s_axi_rid		(gm_axi_rid[i]), // Templated
								   .s_axi_rdata		(gm_axi_rdata[i]), // Templated
								   .s_axi_rresp		(gm_axi_rresp[i]), // Templated
								   .s_axi_rlast		(gm_axi_rlast[i]), // Templated
								   .s_axi_ruser		(gm_axi_ruser[i]), // Templated
								   .s_axi_rvalid	(gm_axi_rvalid[i]), // Templated
								   .m_axi_awid		(gm_axi_awid[i+1]), // Templated
								   .m_axi_awaddr	(gm_axi_awaddr[i+1]), // Templated
								   .m_axi_awlen		(gm_axi_awlen[i+1]), // Templated
								   .m_axi_awsize	(gm_axi_awsize[i+1]), // Templated
								   .m_axi_awburst	(gm_axi_awburst[i+1]), // Templated
								   .m_axi_awlock	(gm_axi_awlock[i+1]), // Templated
								   .m_axi_awcache	(gm_axi_awcache[i+1]), // Templated
								   .m_axi_awprot	(gm_axi_awprot[i+1]), // Templated
								   .m_axi_awqos		(gm_axi_awqos[i+1]), // Templated
								   .m_axi_awregion	(gm_axi_awregion[i+1]), // Templated
								   .m_axi_awuser	(gm_axi_awuser[i+1]), // Templated
								   .m_axi_awvalid	(gm_axi_awvalid[i+1]), // Templated
								   .m_axi_wdata		(gm_axi_wdata[i+1]), // Templated
								   .m_axi_wstrb		(gm_axi_wstrb[i+1]), // Templated
								   .m_axi_wlast		(gm_axi_wlast[i+1]), // Templated
								   .m_axi_wuser		(gm_axi_wuser[i+1]), // Templated
								   .m_axi_wvalid	(gm_axi_wvalid[i+1]), // Templated
								   .m_axi_bready	(gm_axi_bready[i+1]), // Templated
								   .m_axi_arid		(gm_axi_arid[i+1]), // Templated
								   .m_axi_araddr	(gm_axi_araddr[i+1]), // Templated
								   .m_axi_arlen		(gm_axi_arlen[i+1]), // Templated
								   .m_axi_arsize	(gm_axi_arsize[i+1]), // Templated
								   .m_axi_arburst	(gm_axi_arburst[i+1]), // Templated
								   .m_axi_arlock	(gm_axi_arlock[i+1]), // Templated
								   .m_axi_arcache	(gm_axi_arcache[i+1]), // Templated
								   .m_axi_arprot	(gm_axi_arprot[i+1]), // Templated
								   .m_axi_arqos		(gm_axi_arqos[i+1]), // Templated
								   .m_axi_arregion	(gm_axi_arregion[i+1]), // Templated
								   .m_axi_aruser	(gm_axi_aruser[i+1]), // Templated
								   .m_axi_arvalid	(gm_axi_arvalid[i+1]), // Templated
								   .m_axi_rready	(gm_axi_rready[i+1]), // Templated
								   // Inputs
								   .clk			(clk),
								   .rst			(rst),
								   .s_axi_awid		(gm_axi_awid[i]), // Templated
								   .s_axi_awaddr	(gm_axi_awaddr[i]), // Templated
								   .s_axi_awlen		(gm_axi_awlen[i]), // Templated
								   .s_axi_awsize	(gm_axi_awsize[i]), // Templated
								   .s_axi_awburst	(gm_axi_awburst[i]), // Templated
								   .s_axi_awlock	(gm_axi_awlock[i]), // Templated
								   .s_axi_awcache	(gm_axi_awcache[i]), // Templated
								   .s_axi_awprot	(gm_axi_awprot[i]), // Templated
								   .s_axi_awqos		(gm_axi_awqos[i]), // Templated
								   .s_axi_awregion	(gm_axi_awregion[i]), // Templated
								   .s_axi_awuser	(gm_axi_awuser[i]), // Templated
								   .s_axi_awvalid	(gm_axi_awvalid[i]), // Templated
								   .s_axi_wdata		(gm_axi_wdata[i]), // Templated
								   .s_axi_wstrb		(gm_axi_wstrb[i]), // Templated
								   .s_axi_wlast		(gm_axi_wlast[i]), // Templated
								   .s_axi_wuser		(gm_axi_wuser[i]), // Templated
								   .s_axi_wvalid	(gm_axi_wvalid[i]), // Templated
								   .s_axi_bready	(gm_axi_bready[i]), // Templated
								   .s_axi_arid		(gm_axi_arid[i]), // Templated
								   .s_axi_araddr	(gm_axi_araddr[i]), // Templated
								   .s_axi_arlen		(gm_axi_arlen[i]), // Templated
								   .s_axi_arsize	(gm_axi_arsize[i]), // Templated
								   .s_axi_arburst	(gm_axi_arburst[i]), // Templated
								   .s_axi_arlock	(gm_axi_arlock[i]), // Templated
								   .s_axi_arcache	(gm_axi_arcache[i]), // Templated
								   .s_axi_arprot	(gm_axi_arprot[i]), // Templated
								   .s_axi_arqos		(gm_axi_arqos[i]), // Templated
								   .s_axi_arregion	(gm_axi_arregion[i]), // Templated
								   .s_axi_aruser	(gm_axi_aruser[i]), // Templated
								   .s_axi_arvalid	(gm_axi_arvalid[i]), // Templated
								   .s_axi_rready	(gm_axi_rready[i]), // Templated
								   .m_axi_awready	(gm_axi_awready[i+1]), // Templated
								   .m_axi_wready	(gm_axi_wready[i+1]), // Templated
								   .m_axi_bid		(gm_axi_bid[i+1]), // Templated
								   .m_axi_bresp		(gm_axi_bresp[i+1]), // Templated
								   .m_axi_buser		(gm_axi_buser[i+1]), // Templated
								   .m_axi_bvalid	(gm_axi_bvalid[i+1]), // Templated
								   .m_axi_arready	(gm_axi_arready[i+1]), // Templated
								   .m_axi_rid		(gm_axi_rid[i+1]), // Templated
								   .m_axi_rdata		(gm_axi_rdata[i+1]), // Templated
								   .m_axi_rresp		(gm_axi_rresp[i+1]), // Templated
								   .m_axi_rlast		(gm_axi_rlast[i+1]), // Templated
								   .m_axi_ruser		(gm_axi_ruser[i+1]), // Templated
								   .m_axi_rvalid	(gm_axi_rvalid[i+1])); // Templated
    end
  endgenerate

     assign   gm_axi_awid[0]=    s_axi_awid;
     assign   gm_axi_awaddr[0]=  s_axi_awaddr;
     assign   gm_axi_awlen[0]=   s_axi_awlen;
     assign   gm_axi_awsize[0]=  s_axi_awsize;
     assign   gm_axi_awburst[0]= s_axi_awburst;
     assign   gm_axi_awlock[0]=  s_axi_awlock;
     assign   gm_axi_awcache[0]= s_axi_awcache;
     assign   gm_axi_awprot[0]=  s_axi_awprot;
     assign   gm_axi_awqos[0]=   s_axi_awqos;
     assign   gm_axi_awregion[0]=s_axi_awregion;
     assign   gm_axi_awuser[0]=  s_axi_awuser;
     assign   gm_axi_awvalid[0]= s_axi_awvalid;
     assign   gm_axi_wdata[0]=   s_axi_wdata;
     assign   gm_axi_wstrb[0]=   s_axi_wstrb;
     assign   gm_axi_wlast[0]=   s_axi_wlast;
     assign   gm_axi_wuser[0]=   s_axi_wuser;
     assign   gm_axi_wvalid[0]=  s_axi_wvalid;
     assign   gm_axi_bready[0]=  s_axi_bready;
     assign   gm_axi_arid[0]=    s_axi_arid;
     assign   gm_axi_araddr[0]=  s_axi_araddr;
     assign   gm_axi_arlen[0]=   s_axi_arlen;
     assign   gm_axi_arsize[0]=  s_axi_arsize;
     assign   gm_axi_arburst[0]= s_axi_arburst;
     assign   gm_axi_arlock[0]=  s_axi_arlock;
     assign   gm_axi_arcache[0]= s_axi_arcache;
     assign   gm_axi_arprot[0]=  s_axi_arprot;
     assign   gm_axi_arqos[0]=   s_axi_arqos;
     assign   gm_axi_arregion[0]=s_axi_arregion;
     assign   gm_axi_aruser[0]=  s_axi_aruser;
     assign   gm_axi_arvalid[0]= s_axi_arvalid;
     assign   gm_axi_rready[0]=  s_axi_rready;

     assign   s_axi_awready= gm_axi_awready[0];
     assign   s_axi_wready=  gm_axi_wready[0];
     assign   s_axi_bid=     gm_axi_bid[0];
     assign   s_axi_bresp=   gm_axi_bresp[0];
     assign   s_axi_buser=   gm_axi_buser[0];
     assign   s_axi_bvalid=  gm_axi_bvalid[0];
     assign   s_axi_arready= gm_axi_arready[0];
     assign   s_axi_rid=     gm_axi_rid[0];
     assign   s_axi_rdata=   gm_axi_rdata[0];
     assign   s_axi_rresp=   gm_axi_rresp[0];
     assign   s_axi_rlast=   gm_axi_rlast[0];
     assign   s_axi_ruser=   gm_axi_ruser[0];
     assign   s_axi_rvalid=  gm_axi_rvalid[0];


     assign    m_axi_awid=    gm_axi_awid[DELAY_CNT];
     assign    m_axi_awaddr=  gm_axi_awaddr[DELAY_CNT];
     assign    m_axi_awlen=   gm_axi_awlen[DELAY_CNT];
     assign    m_axi_awsize=  gm_axi_awsize[DELAY_CNT];
     assign    m_axi_awburst= gm_axi_awburst[DELAY_CNT];
     assign    m_axi_awlock=  gm_axi_awlock[DELAY_CNT];
     assign    m_axi_awcache= gm_axi_awcache[DELAY_CNT];
     assign    m_axi_awprot=  gm_axi_awprot[DELAY_CNT];
     assign    m_axi_awqos=   gm_axi_awqos[DELAY_CNT];
     assign    m_axi_awregion=gm_axi_awregion[DELAY_CNT];
     assign    m_axi_awuser=  gm_axi_awuser[DELAY_CNT];
     assign    m_axi_awvalid= gm_axi_awvalid[DELAY_CNT];
     assign    m_axi_wdata=   gm_axi_wdata[DELAY_CNT];
     assign    m_axi_wstrb=   gm_axi_wstrb[DELAY_CNT];
     assign    m_axi_wlast=   gm_axi_wlast[DELAY_CNT];
     assign    m_axi_wuser=   gm_axi_wuser[DELAY_CNT];
     assign    m_axi_wvalid=  gm_axi_wvalid[DELAY_CNT];
     assign    m_axi_bready=  gm_axi_bready[DELAY_CNT];
     assign    m_axi_arid=    gm_axi_arid[DELAY_CNT];
     assign    m_axi_araddr=  gm_axi_araddr[DELAY_CNT];
     assign    m_axi_arlen=   gm_axi_arlen[DELAY_CNT];
     assign    m_axi_arsize=  gm_axi_arsize[DELAY_CNT];
     assign    m_axi_arburst= gm_axi_arburst[DELAY_CNT];
     assign    m_axi_arlock=  gm_axi_arlock[DELAY_CNT];
     assign    m_axi_arcache= gm_axi_arcache[DELAY_CNT];
     assign    m_axi_arprot=  gm_axi_arprot[DELAY_CNT];
     assign    m_axi_arqos=   gm_axi_arqos[DELAY_CNT];
     assign    m_axi_arregion=gm_axi_arregion[DELAY_CNT];
     assign    m_axi_aruser=  gm_axi_aruser[DELAY_CNT];
     assign    m_axi_arvalid= gm_axi_arvalid[DELAY_CNT];
     assign    m_axi_rready=  gm_axi_rready[DELAY_CNT];
                       
     assign    gm_axi_awready[DELAY_CNT]= m_axi_awready;    
     assign    gm_axi_wready[DELAY_CNT]=  m_axi_wready;
     assign    gm_axi_bid[DELAY_CNT]=     m_axi_bid;
     assign    gm_axi_bresp[DELAY_CNT]=   m_axi_bresp;
     assign    gm_axi_buser[DELAY_CNT]=   m_axi_buser;
     assign    gm_axi_bvalid[DELAY_CNT]=  m_axi_bvalid;
     assign    gm_axi_arready[DELAY_CNT]= m_axi_arready;
     assign    gm_axi_rid[DELAY_CNT]=     m_axi_rid;
     assign    gm_axi_rdata[DELAY_CNT]=   m_axi_rdata;
     assign    gm_axi_rresp[DELAY_CNT]=   m_axi_rresp;
     assign    gm_axi_rlast[DELAY_CNT]=   m_axi_rlast;
     assign    gm_axi_ruser[DELAY_CNT]=   m_axi_ruser;
     assign    gm_axi_rvalid[DELAY_CNT]=  m_axi_rvalid;


endmodule

`resetall
