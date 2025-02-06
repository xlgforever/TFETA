


module axi_hbm(/*autoarg*/
   // Outputs
   m9_axi_wready, m9_axi_rvalid, m9_axi_rresp, m9_axi_rlast,
   m9_axi_rid, m9_axi_rdata, m9_axi_bvalid, m9_axi_bresp, m9_axi_bid,
   m9_axi_awready, m9_axi_arready, m8_axi_wready, m8_axi_rvalid,
   m8_axi_rresp, m8_axi_rlast, m8_axi_rid, m8_axi_rdata,
   m8_axi_bvalid, m8_axi_bresp, m8_axi_bid, m8_axi_awready,
   m8_axi_arready, m7_axi_wready, m7_axi_rvalid, m7_axi_rresp,
   m7_axi_rlast, m7_axi_rid, m7_axi_rdata, m7_axi_bvalid,
   m7_axi_bresp, m7_axi_bid, m7_axi_awready, m7_axi_arready,
   m6_axi_wready, m6_axi_rvalid, m6_axi_rresp, m6_axi_rlast,
   m6_axi_rid, m6_axi_rdata, m6_axi_bvalid, m6_axi_bresp, m6_axi_bid,
   m6_axi_awready, m6_axi_arready, m5_axi_wready, m5_axi_rvalid,
   m5_axi_rresp, m5_axi_rlast, m5_axi_rid, m5_axi_rdata,
   m5_axi_bvalid, m5_axi_bresp, m5_axi_bid, m5_axi_awready,
   m5_axi_arready, m4_axi_wready, m4_axi_rvalid, m4_axi_rresp,
   m4_axi_rlast, m4_axi_rid, m4_axi_rdata, m4_axi_bvalid,
   m4_axi_bresp, m4_axi_bid, m4_axi_awready, m4_axi_arready,
   m3_axi_wready, m3_axi_rvalid, m3_axi_rresp, m3_axi_rlast,
   m3_axi_rid, m3_axi_rdata, m3_axi_bvalid, m3_axi_bresp, m3_axi_bid,
   m3_axi_awready, m3_axi_arready, m31_axi_wready, m31_axi_rvalid,
   m31_axi_rresp, m31_axi_rlast, m31_axi_rid, m31_axi_rdata,
   m31_axi_bvalid, m31_axi_bresp, m31_axi_bid, m31_axi_awready,
   m31_axi_arready, m30_axi_wready, m30_axi_rvalid, m30_axi_rresp,
   m30_axi_rlast, m30_axi_rid, m30_axi_rdata, m30_axi_bvalid,
   m30_axi_bresp, m30_axi_bid, m30_axi_awready, m30_axi_arready,
   m2_axi_wready, m2_axi_rvalid, m2_axi_rresp, m2_axi_rlast,
   m2_axi_rid, m2_axi_rdata, m2_axi_bvalid, m2_axi_bresp, m2_axi_bid,
   m2_axi_awready, m2_axi_arready, m29_axi_wready, m29_axi_rvalid,
   m29_axi_rresp, m29_axi_rlast, m29_axi_rid, m29_axi_rdata,
   m29_axi_bvalid, m29_axi_bresp, m29_axi_bid, m29_axi_awready,
   m29_axi_arready, m28_axi_wready, m28_axi_rvalid, m28_axi_rresp,
   m28_axi_rlast, m28_axi_rid, m28_axi_rdata, m28_axi_bvalid,
   m28_axi_bresp, m28_axi_bid, m28_axi_awready, m28_axi_arready,
   m27_axi_wready, m27_axi_rvalid, m27_axi_rresp, m27_axi_rlast,
   m27_axi_rid, m27_axi_rdata, m27_axi_bvalid, m27_axi_bresp,
   m27_axi_bid, m27_axi_awready, m27_axi_arready, m26_axi_wready,
   m26_axi_rvalid, m26_axi_rresp, m26_axi_rlast, m26_axi_rid,
   m26_axi_rdata, m26_axi_bvalid, m26_axi_bresp, m26_axi_bid,
   m26_axi_awready, m26_axi_arready, m25_axi_wready, m25_axi_rvalid,
   m25_axi_rresp, m25_axi_rlast, m25_axi_rid, m25_axi_rdata,
   m25_axi_bvalid, m25_axi_bresp, m25_axi_bid, m25_axi_awready,
   m25_axi_arready, m24_axi_wready, m24_axi_rvalid, m24_axi_rresp,
   m24_axi_rlast, m24_axi_rid, m24_axi_rdata, m24_axi_bvalid,
   m24_axi_bresp, m24_axi_bid, m24_axi_awready, m24_axi_arready,
   m23_axi_wready, m23_axi_rvalid, m23_axi_rresp, m23_axi_rlast,
   m23_axi_rid, m23_axi_rdata, m23_axi_bvalid, m23_axi_bresp,
   m23_axi_bid, m23_axi_awready, m23_axi_arready, m22_axi_wready,
   m22_axi_rvalid, m22_axi_rresp, m22_axi_rlast, m22_axi_rid,
   m22_axi_rdata, m22_axi_bvalid, m22_axi_bresp, m22_axi_bid,
   m22_axi_awready, m22_axi_arready, m21_axi_wready, m21_axi_rvalid,
   m21_axi_rresp, m21_axi_rlast, m21_axi_rid, m21_axi_rdata,
   m21_axi_bvalid, m21_axi_bresp, m21_axi_bid, m21_axi_awready,
   m21_axi_arready, m20_axi_wready, m20_axi_rvalid, m20_axi_rresp,
   m20_axi_rlast, m20_axi_rid, m20_axi_rdata, m20_axi_bvalid,
   m20_axi_bresp, m20_axi_bid, m20_axi_awready, m20_axi_arready,
   m1_axi_wready, m1_axi_rvalid, m1_axi_rresp, m1_axi_rlast,
   m1_axi_rid, m1_axi_rdata, m1_axi_bvalid, m1_axi_bresp, m1_axi_bid,
   m1_axi_awready, m1_axi_arready, m19_axi_wready, m19_axi_rvalid,
   m19_axi_rresp, m19_axi_rlast, m19_axi_rid, m19_axi_rdata,
   m19_axi_bvalid, m19_axi_bresp, m19_axi_bid, m19_axi_awready,
   m19_axi_arready, m18_axi_wready, m18_axi_rvalid, m18_axi_rresp,
   m18_axi_rlast, m18_axi_rid, m18_axi_rdata, m18_axi_bvalid,
   m18_axi_bresp, m18_axi_bid, m18_axi_awready, m18_axi_arready,
   m17_axi_wready, m17_axi_rvalid, m17_axi_rresp, m17_axi_rlast,
   m17_axi_rid, m17_axi_rdata, m17_axi_bvalid, m17_axi_bresp,
   m17_axi_bid, m17_axi_awready, m17_axi_arready, m16_axi_wready,
   m16_axi_rvalid, m16_axi_rresp, m16_axi_rlast, m16_axi_rid,
   m16_axi_rdata, m16_axi_bvalid, m16_axi_bresp, m16_axi_bid,
   m16_axi_awready, m16_axi_arready, m15_axi_wready, m15_axi_rvalid,
   m15_axi_rresp, m15_axi_rlast, m15_axi_rid, m15_axi_rdata,
   m15_axi_bvalid, m15_axi_bresp, m15_axi_bid, m15_axi_awready,
   m15_axi_arready, m14_axi_wready, m14_axi_rvalid, m14_axi_rresp,
   m14_axi_rlast, m14_axi_rid, m14_axi_rdata, m14_axi_bvalid,
   m14_axi_bresp, m14_axi_bid, m14_axi_awready, m14_axi_arready,
   m13_axi_wready, m13_axi_rvalid, m13_axi_rresp, m13_axi_rlast,
   m13_axi_rid, m13_axi_rdata, m13_axi_bvalid, m13_axi_bresp,
   m13_axi_bid, m13_axi_awready, m13_axi_arready, m12_axi_wready,
   m12_axi_rvalid, m12_axi_rresp, m12_axi_rlast, m12_axi_rid,
   m12_axi_rdata, m12_axi_bvalid, m12_axi_bresp, m12_axi_bid,
   m12_axi_awready, m12_axi_arready, m11_axi_wready, m11_axi_rvalid,
   m11_axi_rresp, m11_axi_rlast, m11_axi_rid, m11_axi_rdata,
   m11_axi_bvalid, m11_axi_bresp, m11_axi_bid, m11_axi_awready,
   m11_axi_arready, m10_axi_wready, m10_axi_rvalid, m10_axi_rresp,
   m10_axi_rlast, m10_axi_rid, m10_axi_rdata, m10_axi_bvalid,
   m10_axi_bresp, m10_axi_bid, m10_axi_awready, m10_axi_arready,
   m0_axi_wready, m0_axi_rvalid, m0_axi_rresp, m0_axi_rlast,
   m0_axi_rid, m0_axi_rdata, m0_axi_bvalid, m0_axi_bresp, m0_axi_bid,
   m0_axi_awready, m0_axi_arready,
   // Inputs
   rst, m9_axi_wvalid, m9_axi_wstrb, m9_axi_wlast, m9_axi_wdata,
   m9_axi_rready, m9_axi_bready, m9_axi_awvalid, m9_axi_awsize,
   m9_axi_awprot, m9_axi_awlock, m9_axi_awlen, m9_axi_awid,
   m9_axi_awcache, m9_axi_awburst, m9_axi_awaddr, m9_axi_arvalid,
   m9_axi_arsize, m9_axi_arprot, m9_axi_arlock, m9_axi_arlen,
   m9_axi_arid, m9_axi_arcache, m9_axi_arburst, m9_axi_araddr,
   m8_axi_wvalid, m8_axi_wstrb, m8_axi_wlast, m8_axi_wdata,
   m8_axi_rready, m8_axi_bready, m8_axi_awvalid, m8_axi_awsize,
   m8_axi_awprot, m8_axi_awlock, m8_axi_awlen, m8_axi_awid,
   m8_axi_awcache, m8_axi_awburst, m8_axi_awaddr, m8_axi_arvalid,
   m8_axi_arsize, m8_axi_arprot, m8_axi_arlock, m8_axi_arlen,
   m8_axi_arid, m8_axi_arcache, m8_axi_arburst, m8_axi_araddr,
   m7_axi_wvalid, m7_axi_wstrb, m7_axi_wlast, m7_axi_wdata,
   m7_axi_rready, m7_axi_bready, m7_axi_awvalid, m7_axi_awsize,
   m7_axi_awprot, m7_axi_awlock, m7_axi_awlen, m7_axi_awid,
   m7_axi_awcache, m7_axi_awburst, m7_axi_awaddr, m7_axi_arvalid,
   m7_axi_arsize, m7_axi_arprot, m7_axi_arlock, m7_axi_arlen,
   m7_axi_arid, m7_axi_arcache, m7_axi_arburst, m7_axi_araddr,
   m6_axi_wvalid, m6_axi_wstrb, m6_axi_wlast, m6_axi_wdata,
   m6_axi_rready, m6_axi_bready, m6_axi_awvalid, m6_axi_awsize,
   m6_axi_awprot, m6_axi_awlock, m6_axi_awlen, m6_axi_awid,
   m6_axi_awcache, m6_axi_awburst, m6_axi_awaddr, m6_axi_arvalid,
   m6_axi_arsize, m6_axi_arprot, m6_axi_arlock, m6_axi_arlen,
   m6_axi_arid, m6_axi_arcache, m6_axi_arburst, m6_axi_araddr,
   m5_axi_wvalid, m5_axi_wstrb, m5_axi_wlast, m5_axi_wdata,
   m5_axi_rready, m5_axi_bready, m5_axi_awvalid, m5_axi_awsize,
   m5_axi_awprot, m5_axi_awlock, m5_axi_awlen, m5_axi_awid,
   m5_axi_awcache, m5_axi_awburst, m5_axi_awaddr, m5_axi_arvalid,
   m5_axi_arsize, m5_axi_arprot, m5_axi_arlock, m5_axi_arlen,
   m5_axi_arid, m5_axi_arcache, m5_axi_arburst, m5_axi_araddr,
   m4_axi_wvalid, m4_axi_wstrb, m4_axi_wlast, m4_axi_wdata,
   m4_axi_rready, m4_axi_bready, m4_axi_awvalid, m4_axi_awsize,
   m4_axi_awprot, m4_axi_awlock, m4_axi_awlen, m4_axi_awid,
   m4_axi_awcache, m4_axi_awburst, m4_axi_awaddr, m4_axi_arvalid,
   m4_axi_arsize, m4_axi_arprot, m4_axi_arlock, m4_axi_arlen,
   m4_axi_arid, m4_axi_arcache, m4_axi_arburst, m4_axi_araddr,
   m3_axi_wvalid, m3_axi_wstrb, m3_axi_wlast, m3_axi_wdata,
   m3_axi_rready, m3_axi_bready, m3_axi_awvalid, m3_axi_awsize,
   m3_axi_awprot, m3_axi_awlock, m3_axi_awlen, m3_axi_awid,
   m3_axi_awcache, m3_axi_awburst, m3_axi_awaddr, m3_axi_arvalid,
   m3_axi_arsize, m3_axi_arprot, m3_axi_arlock, m3_axi_arlen,
   m3_axi_arid, m3_axi_arcache, m3_axi_arburst, m3_axi_araddr,
   m31_axi_wvalid, m31_axi_wstrb, m31_axi_wlast, m31_axi_wdata,
   m31_axi_rready, m31_axi_bready, m31_axi_awvalid, m31_axi_awsize,
   m31_axi_awprot, m31_axi_awlock, m31_axi_awlen, m31_axi_awid,
   m31_axi_awcache, m31_axi_awburst, m31_axi_awaddr, m31_axi_arvalid,
   m31_axi_arsize, m31_axi_arprot, m31_axi_arlock, m31_axi_arlen,
   m31_axi_arid, m31_axi_arcache, m31_axi_arburst, m31_axi_araddr,
   m30_axi_wvalid, m30_axi_wstrb, m30_axi_wlast, m30_axi_wdata,
   m30_axi_rready, m30_axi_bready, m30_axi_awvalid, m30_axi_awsize,
   m30_axi_awprot, m30_axi_awlock, m30_axi_awlen, m30_axi_awid,
   m30_axi_awcache, m30_axi_awburst, m30_axi_awaddr, m30_axi_arvalid,
   m30_axi_arsize, m30_axi_arprot, m30_axi_arlock, m30_axi_arlen,
   m30_axi_arid, m30_axi_arcache, m30_axi_arburst, m30_axi_araddr,
   m2_axi_wvalid, m2_axi_wstrb, m2_axi_wlast, m2_axi_wdata,
   m2_axi_rready, m2_axi_bready, m2_axi_awvalid, m2_axi_awsize,
   m2_axi_awprot, m2_axi_awlock, m2_axi_awlen, m2_axi_awid,
   m2_axi_awcache, m2_axi_awburst, m2_axi_awaddr, m2_axi_arvalid,
   m2_axi_arsize, m2_axi_arprot, m2_axi_arlock, m2_axi_arlen,
   m2_axi_arid, m2_axi_arcache, m2_axi_arburst, m2_axi_araddr,
   m29_axi_wvalid, m29_axi_wstrb, m29_axi_wlast, m29_axi_wdata,
   m29_axi_rready, m29_axi_bready, m29_axi_awvalid, m29_axi_awsize,
   m29_axi_awprot, m29_axi_awlock, m29_axi_awlen, m29_axi_awid,
   m29_axi_awcache, m29_axi_awburst, m29_axi_awaddr, m29_axi_arvalid,
   m29_axi_arsize, m29_axi_arprot, m29_axi_arlock, m29_axi_arlen,
   m29_axi_arid, m29_axi_arcache, m29_axi_arburst, m29_axi_araddr,
   m28_axi_wvalid, m28_axi_wstrb, m28_axi_wlast, m28_axi_wdata,
   m28_axi_rready, m28_axi_bready, m28_axi_awvalid, m28_axi_awsize,
   m28_axi_awprot, m28_axi_awlock, m28_axi_awlen, m28_axi_awid,
   m28_axi_awcache, m28_axi_awburst, m28_axi_awaddr, m28_axi_arvalid,
   m28_axi_arsize, m28_axi_arprot, m28_axi_arlock, m28_axi_arlen,
   m28_axi_arid, m28_axi_arcache, m28_axi_arburst, m28_axi_araddr,
   m27_axi_wvalid, m27_axi_wstrb, m27_axi_wlast, m27_axi_wdata,
   m27_axi_rready, m27_axi_bready, m27_axi_awvalid, m27_axi_awsize,
   m27_axi_awprot, m27_axi_awlock, m27_axi_awlen, m27_axi_awid,
   m27_axi_awcache, m27_axi_awburst, m27_axi_awaddr, m27_axi_arvalid,
   m27_axi_arsize, m27_axi_arprot, m27_axi_arlock, m27_axi_arlen,
   m27_axi_arid, m27_axi_arcache, m27_axi_arburst, m27_axi_araddr,
   m26_axi_wvalid, m26_axi_wstrb, m26_axi_wlast, m26_axi_wdata,
   m26_axi_rready, m26_axi_bready, m26_axi_awvalid, m26_axi_awsize,
   m26_axi_awprot, m26_axi_awlock, m26_axi_awlen, m26_axi_awid,
   m26_axi_awcache, m26_axi_awburst, m26_axi_awaddr, m26_axi_arvalid,
   m26_axi_arsize, m26_axi_arprot, m26_axi_arlock, m26_axi_arlen,
   m26_axi_arid, m26_axi_arcache, m26_axi_arburst, m26_axi_araddr,
   m25_axi_wvalid, m25_axi_wstrb, m25_axi_wlast, m25_axi_wdata,
   m25_axi_rready, m25_axi_bready, m25_axi_awvalid, m25_axi_awsize,
   m25_axi_awprot, m25_axi_awlock, m25_axi_awlen, m25_axi_awid,
   m25_axi_awcache, m25_axi_awburst, m25_axi_awaddr, m25_axi_arvalid,
   m25_axi_arsize, m25_axi_arprot, m25_axi_arlock, m25_axi_arlen,
   m25_axi_arid, m25_axi_arcache, m25_axi_arburst, m25_axi_araddr,
   m24_axi_wvalid, m24_axi_wstrb, m24_axi_wlast, m24_axi_wdata,
   m24_axi_rready, m24_axi_bready, m24_axi_awvalid, m24_axi_awsize,
   m24_axi_awprot, m24_axi_awlock, m24_axi_awlen, m24_axi_awid,
   m24_axi_awcache, m24_axi_awburst, m24_axi_awaddr, m24_axi_arvalid,
   m24_axi_arsize, m24_axi_arprot, m24_axi_arlock, m24_axi_arlen,
   m24_axi_arid, m24_axi_arcache, m24_axi_arburst, m24_axi_araddr,
   m23_axi_wvalid, m23_axi_wstrb, m23_axi_wlast, m23_axi_wdata,
   m23_axi_rready, m23_axi_bready, m23_axi_awvalid, m23_axi_awsize,
   m23_axi_awprot, m23_axi_awlock, m23_axi_awlen, m23_axi_awid,
   m23_axi_awcache, m23_axi_awburst, m23_axi_awaddr, m23_axi_arvalid,
   m23_axi_arsize, m23_axi_arprot, m23_axi_arlock, m23_axi_arlen,
   m23_axi_arid, m23_axi_arcache, m23_axi_arburst, m23_axi_araddr,
   m22_axi_wvalid, m22_axi_wstrb, m22_axi_wlast, m22_axi_wdata,
   m22_axi_rready, m22_axi_bready, m22_axi_awvalid, m22_axi_awsize,
   m22_axi_awprot, m22_axi_awlock, m22_axi_awlen, m22_axi_awid,
   m22_axi_awcache, m22_axi_awburst, m22_axi_awaddr, m22_axi_arvalid,
   m22_axi_arsize, m22_axi_arprot, m22_axi_arlock, m22_axi_arlen,
   m22_axi_arid, m22_axi_arcache, m22_axi_arburst, m22_axi_araddr,
   m21_axi_wvalid, m21_axi_wstrb, m21_axi_wlast, m21_axi_wdata,
   m21_axi_rready, m21_axi_bready, m21_axi_awvalid, m21_axi_awsize,
   m21_axi_awprot, m21_axi_awlock, m21_axi_awlen, m21_axi_awid,
   m21_axi_awcache, m21_axi_awburst, m21_axi_awaddr, m21_axi_arvalid,
   m21_axi_arsize, m21_axi_arprot, m21_axi_arlock, m21_axi_arlen,
   m21_axi_arid, m21_axi_arcache, m21_axi_arburst, m21_axi_araddr,
   m20_axi_wvalid, m20_axi_wstrb, m20_axi_wlast, m20_axi_wdata,
   m20_axi_rready, m20_axi_bready, m20_axi_awvalid, m20_axi_awsize,
   m20_axi_awprot, m20_axi_awlock, m20_axi_awlen, m20_axi_awid,
   m20_axi_awcache, m20_axi_awburst, m20_axi_awaddr, m20_axi_arvalid,
   m20_axi_arsize, m20_axi_arprot, m20_axi_arlock, m20_axi_arlen,
   m20_axi_arid, m20_axi_arcache, m20_axi_arburst, m20_axi_araddr,
   m1_axi_wvalid, m1_axi_wstrb, m1_axi_wlast, m1_axi_wdata,
   m1_axi_rready, m1_axi_bready, m1_axi_awvalid, m1_axi_awsize,
   m1_axi_awprot, m1_axi_awlock, m1_axi_awlen, m1_axi_awid,
   m1_axi_awcache, m1_axi_awburst, m1_axi_awaddr, m1_axi_arvalid,
   m1_axi_arsize, m1_axi_arprot, m1_axi_arlock, m1_axi_arlen,
   m1_axi_arid, m1_axi_arcache, m1_axi_arburst, m1_axi_araddr,
   m19_axi_wvalid, m19_axi_wstrb, m19_axi_wlast, m19_axi_wdata,
   m19_axi_rready, m19_axi_bready, m19_axi_awvalid, m19_axi_awsize,
   m19_axi_awprot, m19_axi_awlock, m19_axi_awlen, m19_axi_awid,
   m19_axi_awcache, m19_axi_awburst, m19_axi_awaddr, m19_axi_arvalid,
   m19_axi_arsize, m19_axi_arprot, m19_axi_arlock, m19_axi_arlen,
   m19_axi_arid, m19_axi_arcache, m19_axi_arburst, m19_axi_araddr,
   m18_axi_wvalid, m18_axi_wstrb, m18_axi_wlast, m18_axi_wdata,
   m18_axi_rready, m18_axi_bready, m18_axi_awvalid, m18_axi_awsize,
   m18_axi_awprot, m18_axi_awlock, m18_axi_awlen, m18_axi_awid,
   m18_axi_awcache, m18_axi_awburst, m18_axi_awaddr, m18_axi_arvalid,
   m18_axi_arsize, m18_axi_arprot, m18_axi_arlock, m18_axi_arlen,
   m18_axi_arid, m18_axi_arcache, m18_axi_arburst, m18_axi_araddr,
   m17_axi_wvalid, m17_axi_wstrb, m17_axi_wlast, m17_axi_wdata,
   m17_axi_rready, m17_axi_bready, m17_axi_awvalid, m17_axi_awsize,
   m17_axi_awprot, m17_axi_awlock, m17_axi_awlen, m17_axi_awid,
   m17_axi_awcache, m17_axi_awburst, m17_axi_awaddr, m17_axi_arvalid,
   m17_axi_arsize, m17_axi_arprot, m17_axi_arlock, m17_axi_arlen,
   m17_axi_arid, m17_axi_arcache, m17_axi_arburst, m17_axi_araddr,
   m16_axi_wvalid, m16_axi_wstrb, m16_axi_wlast, m16_axi_wdata,
   m16_axi_rready, m16_axi_bready, m16_axi_awvalid, m16_axi_awsize,
   m16_axi_awprot, m16_axi_awlock, m16_axi_awlen, m16_axi_awid,
   m16_axi_awcache, m16_axi_awburst, m16_axi_awaddr, m16_axi_arvalid,
   m16_axi_arsize, m16_axi_arprot, m16_axi_arlock, m16_axi_arlen,
   m16_axi_arid, m16_axi_arcache, m16_axi_arburst, m16_axi_araddr,
   m15_axi_wvalid, m15_axi_wstrb, m15_axi_wlast, m15_axi_wdata,
   m15_axi_rready, m15_axi_bready, m15_axi_awvalid, m15_axi_awsize,
   m15_axi_awprot, m15_axi_awlock, m15_axi_awlen, m15_axi_awid,
   m15_axi_awcache, m15_axi_awburst, m15_axi_awaddr, m15_axi_arvalid,
   m15_axi_arsize, m15_axi_arprot, m15_axi_arlock, m15_axi_arlen,
   m15_axi_arid, m15_axi_arcache, m15_axi_arburst, m15_axi_araddr,
   m14_axi_wvalid, m14_axi_wstrb, m14_axi_wlast, m14_axi_wdata,
   m14_axi_rready, m14_axi_bready, m14_axi_awvalid, m14_axi_awsize,
   m14_axi_awprot, m14_axi_awlock, m14_axi_awlen, m14_axi_awid,
   m14_axi_awcache, m14_axi_awburst, m14_axi_awaddr, m14_axi_arvalid,
   m14_axi_arsize, m14_axi_arprot, m14_axi_arlock, m14_axi_arlen,
   m14_axi_arid, m14_axi_arcache, m14_axi_arburst, m14_axi_araddr,
   m13_axi_wvalid, m13_axi_wstrb, m13_axi_wlast, m13_axi_wdata,
   m13_axi_rready, m13_axi_bready, m13_axi_awvalid, m13_axi_awsize,
   m13_axi_awprot, m13_axi_awlock, m13_axi_awlen, m13_axi_awid,
   m13_axi_awcache, m13_axi_awburst, m13_axi_awaddr, m13_axi_arvalid,
   m13_axi_arsize, m13_axi_arprot, m13_axi_arlock, m13_axi_arlen,
   m13_axi_arid, m13_axi_arcache, m13_axi_arburst, m13_axi_araddr,
   m12_axi_wvalid, m12_axi_wstrb, m12_axi_wlast, m12_axi_wdata,
   m12_axi_rready, m12_axi_bready, m12_axi_awvalid, m12_axi_awsize,
   m12_axi_awprot, m12_axi_awlock, m12_axi_awlen, m12_axi_awid,
   m12_axi_awcache, m12_axi_awburst, m12_axi_awaddr, m12_axi_arvalid,
   m12_axi_arsize, m12_axi_arprot, m12_axi_arlock, m12_axi_arlen,
   m12_axi_arid, m12_axi_arcache, m12_axi_arburst, m12_axi_araddr,
   m11_axi_wvalid, m11_axi_wstrb, m11_axi_wlast, m11_axi_wdata,
   m11_axi_rready, m11_axi_bready, m11_axi_awvalid, m11_axi_awsize,
   m11_axi_awprot, m11_axi_awlock, m11_axi_awlen, m11_axi_awid,
   m11_axi_awcache, m11_axi_awburst, m11_axi_awaddr, m11_axi_arvalid,
   m11_axi_arsize, m11_axi_arprot, m11_axi_arlock, m11_axi_arlen,
   m11_axi_arid, m11_axi_arcache, m11_axi_arburst, m11_axi_araddr,
   m10_axi_wvalid, m10_axi_wstrb, m10_axi_wlast, m10_axi_wdata,
   m10_axi_rready, m10_axi_bready, m10_axi_awvalid, m10_axi_awsize,
   m10_axi_awprot, m10_axi_awlock, m10_axi_awlen, m10_axi_awid,
   m10_axi_awcache, m10_axi_awburst, m10_axi_awaddr, m10_axi_arvalid,
   m10_axi_arsize, m10_axi_arprot, m10_axi_arlock, m10_axi_arlen,
   m10_axi_arid, m10_axi_arcache, m10_axi_arburst, m10_axi_araddr,
   m0_axi_wvalid, m0_axi_wstrb, m0_axi_wlast, m0_axi_wdata,
   m0_axi_rready, m0_axi_bready, m0_axi_awvalid, m0_axi_awsize,
   m0_axi_awprot, m0_axi_awlock, m0_axi_awlen, m0_axi_awid,
   m0_axi_awcache, m0_axi_awburst, m0_axi_awaddr, m0_axi_arvalid,
   m0_axi_arsize, m0_axi_arprot, m0_axi_arlock, m0_axi_arlen,
   m0_axi_arid, m0_axi_arcache, m0_axi_arburst, m0_axi_araddr, clk
   );

   localparam S_COUNT = 8;
   localparam M_COUNT = 3;

   // Width of AXI data bus in bits
    parameter AXI_DATA_WIDTH =  512 ;

    // Width of AXI address bus in bits
    parameter AXI_ADDR_WIDTH = 64; //4g 32 ;  8g 33 ;  16g  34 ;  32g 35;  64g  36

    // Width of AXI wstrb (width of data bus in words)
    parameter AXI_STRB_WIDTH = (AXI_DATA_WIDTH/8);

    // Width of AXI ID signal
    parameter AXI_ID_WIDTH = 7;

    // Additional bits required for response routing
    parameter M_ID_WIDTH = AXI_ID_WIDTH+$clog2(S_COUNT);


localparam PIPELINE_OUTPUT = 0;

localparam VALID_ADDR_WIDTH = AXI_ADDR_WIDTH - $clog2(AXI_STRB_WIDTH);

parameter AXI_WORD_WIDTH = AXI_STRB_WIDTH;

parameter AXI_WORD_SIZE = AXI_DATA_WIDTH/AXI_WORD_WIDTH;


/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			clk;			// To u0_axi_hbm_sub of axi_hbm_sub.v, ...
input [AXI_ADDR_WIDTH-1:0] m0_axi_araddr;	// To u0_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m0_axi_arburst;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m0_axi_arcache;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m0_axi_arid;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m0_axi_arlen;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_arlock;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m0_axi_arprot;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m0_axi_arsize;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_arvalid;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m0_axi_awaddr;	// To u0_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m0_axi_awburst;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m0_axi_awcache;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m0_axi_awid;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m0_axi_awlen;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_awlock;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m0_axi_awprot;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m0_axi_awsize;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_awvalid;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_bready;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_rready;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m0_axi_wdata;	// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_wlast;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m0_axi_wstrb;	// To u0_axi_hbm_sub of axi_hbm_sub.v
input			m0_axi_wvalid;		// To u0_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m10_axi_araddr;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m10_axi_arburst;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m10_axi_arcache;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m10_axi_arid;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m10_axi_arlen;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_arlock;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m10_axi_arprot;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m10_axi_arsize;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_arvalid;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m10_axi_awaddr;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m10_axi_awburst;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m10_axi_awcache;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m10_axi_awid;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m10_axi_awlen;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_awlock;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m10_axi_awprot;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m10_axi_awsize;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_awvalid;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_bready;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_rready;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m10_axi_wdata;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_wlast;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m10_axi_wstrb;	// To u10_axi_hbm_sub of axi_hbm_sub.v
input			m10_axi_wvalid;		// To u10_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m11_axi_araddr;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m11_axi_arburst;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m11_axi_arcache;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m11_axi_arid;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m11_axi_arlen;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_arlock;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m11_axi_arprot;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m11_axi_arsize;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_arvalid;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m11_axi_awaddr;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m11_axi_awburst;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m11_axi_awcache;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m11_axi_awid;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m11_axi_awlen;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_awlock;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m11_axi_awprot;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m11_axi_awsize;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_awvalid;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_bready;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_rready;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m11_axi_wdata;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_wlast;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m11_axi_wstrb;	// To u11_axi_hbm_sub of axi_hbm_sub.v
input			m11_axi_wvalid;		// To u11_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m12_axi_araddr;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m12_axi_arburst;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m12_axi_arcache;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m12_axi_arid;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m12_axi_arlen;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_arlock;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m12_axi_arprot;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m12_axi_arsize;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_arvalid;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m12_axi_awaddr;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m12_axi_awburst;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m12_axi_awcache;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m12_axi_awid;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m12_axi_awlen;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_awlock;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m12_axi_awprot;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m12_axi_awsize;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_awvalid;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_bready;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_rready;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m12_axi_wdata;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_wlast;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m12_axi_wstrb;	// To u12_axi_hbm_sub of axi_hbm_sub.v
input			m12_axi_wvalid;		// To u12_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m13_axi_araddr;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m13_axi_arburst;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m13_axi_arcache;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m13_axi_arid;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m13_axi_arlen;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_arlock;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m13_axi_arprot;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m13_axi_arsize;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_arvalid;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m13_axi_awaddr;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m13_axi_awburst;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m13_axi_awcache;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m13_axi_awid;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m13_axi_awlen;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_awlock;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m13_axi_awprot;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m13_axi_awsize;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_awvalid;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_bready;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_rready;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m13_axi_wdata;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_wlast;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m13_axi_wstrb;	// To u13_axi_hbm_sub of axi_hbm_sub.v
input			m13_axi_wvalid;		// To u13_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m14_axi_araddr;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m14_axi_arburst;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m14_axi_arcache;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m14_axi_arid;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m14_axi_arlen;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_arlock;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m14_axi_arprot;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m14_axi_arsize;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_arvalid;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m14_axi_awaddr;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m14_axi_awburst;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m14_axi_awcache;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m14_axi_awid;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m14_axi_awlen;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_awlock;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m14_axi_awprot;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m14_axi_awsize;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_awvalid;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_bready;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_rready;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m14_axi_wdata;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_wlast;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m14_axi_wstrb;	// To u14_axi_hbm_sub of axi_hbm_sub.v
input			m14_axi_wvalid;		// To u14_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m15_axi_araddr;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m15_axi_arburst;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m15_axi_arcache;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m15_axi_arid;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m15_axi_arlen;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_arlock;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m15_axi_arprot;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m15_axi_arsize;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_arvalid;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m15_axi_awaddr;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m15_axi_awburst;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m15_axi_awcache;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m15_axi_awid;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m15_axi_awlen;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_awlock;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m15_axi_awprot;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m15_axi_awsize;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_awvalid;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_bready;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_rready;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m15_axi_wdata;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_wlast;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m15_axi_wstrb;	// To u15_axi_hbm_sub of axi_hbm_sub.v
input			m15_axi_wvalid;		// To u15_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m16_axi_araddr;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m16_axi_arburst;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m16_axi_arcache;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m16_axi_arid;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m16_axi_arlen;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_arlock;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m16_axi_arprot;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m16_axi_arsize;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_arvalid;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m16_axi_awaddr;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m16_axi_awburst;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m16_axi_awcache;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m16_axi_awid;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m16_axi_awlen;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_awlock;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m16_axi_awprot;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m16_axi_awsize;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_awvalid;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_bready;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_rready;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m16_axi_wdata;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_wlast;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m16_axi_wstrb;	// To u16_axi_hbm_sub of axi_hbm_sub.v
input			m16_axi_wvalid;		// To u16_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m17_axi_araddr;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m17_axi_arburst;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m17_axi_arcache;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m17_axi_arid;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m17_axi_arlen;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_arlock;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m17_axi_arprot;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m17_axi_arsize;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_arvalid;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m17_axi_awaddr;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m17_axi_awburst;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m17_axi_awcache;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m17_axi_awid;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m17_axi_awlen;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_awlock;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m17_axi_awprot;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m17_axi_awsize;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_awvalid;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_bready;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_rready;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m17_axi_wdata;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_wlast;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m17_axi_wstrb;	// To u17_axi_hbm_sub of axi_hbm_sub.v
input			m17_axi_wvalid;		// To u17_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m18_axi_araddr;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m18_axi_arburst;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m18_axi_arcache;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m18_axi_arid;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m18_axi_arlen;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_arlock;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m18_axi_arprot;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m18_axi_arsize;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_arvalid;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m18_axi_awaddr;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m18_axi_awburst;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m18_axi_awcache;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m18_axi_awid;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m18_axi_awlen;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_awlock;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m18_axi_awprot;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m18_axi_awsize;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_awvalid;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_bready;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_rready;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m18_axi_wdata;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_wlast;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m18_axi_wstrb;	// To u18_axi_hbm_sub of axi_hbm_sub.v
input			m18_axi_wvalid;		// To u18_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m19_axi_araddr;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m19_axi_arburst;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m19_axi_arcache;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m19_axi_arid;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m19_axi_arlen;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_arlock;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m19_axi_arprot;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m19_axi_arsize;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_arvalid;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m19_axi_awaddr;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m19_axi_awburst;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m19_axi_awcache;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m19_axi_awid;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m19_axi_awlen;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_awlock;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m19_axi_awprot;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m19_axi_awsize;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_awvalid;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_bready;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_rready;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m19_axi_wdata;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_wlast;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m19_axi_wstrb;	// To u19_axi_hbm_sub of axi_hbm_sub.v
input			m19_axi_wvalid;		// To u19_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m1_axi_araddr;	// To u1_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m1_axi_arburst;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m1_axi_arcache;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m1_axi_arid;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m1_axi_arlen;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_arlock;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m1_axi_arprot;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m1_axi_arsize;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_arvalid;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m1_axi_awaddr;	// To u1_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m1_axi_awburst;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m1_axi_awcache;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m1_axi_awid;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m1_axi_awlen;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_awlock;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m1_axi_awprot;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m1_axi_awsize;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_awvalid;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_bready;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_rready;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m1_axi_wdata;	// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_wlast;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m1_axi_wstrb;	// To u1_axi_hbm_sub of axi_hbm_sub.v
input			m1_axi_wvalid;		// To u1_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m20_axi_araddr;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m20_axi_arburst;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m20_axi_arcache;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m20_axi_arid;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m20_axi_arlen;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_arlock;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m20_axi_arprot;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m20_axi_arsize;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_arvalid;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m20_axi_awaddr;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m20_axi_awburst;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m20_axi_awcache;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m20_axi_awid;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m20_axi_awlen;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_awlock;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m20_axi_awprot;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m20_axi_awsize;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_awvalid;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_bready;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_rready;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m20_axi_wdata;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_wlast;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m20_axi_wstrb;	// To u20_axi_hbm_sub of axi_hbm_sub.v
input			m20_axi_wvalid;		// To u20_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m21_axi_araddr;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m21_axi_arburst;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m21_axi_arcache;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m21_axi_arid;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m21_axi_arlen;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_arlock;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m21_axi_arprot;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m21_axi_arsize;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_arvalid;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m21_axi_awaddr;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m21_axi_awburst;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m21_axi_awcache;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m21_axi_awid;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m21_axi_awlen;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_awlock;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m21_axi_awprot;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m21_axi_awsize;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_awvalid;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_bready;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_rready;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m21_axi_wdata;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_wlast;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m21_axi_wstrb;	// To u21_axi_hbm_sub of axi_hbm_sub.v
input			m21_axi_wvalid;		// To u21_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m22_axi_araddr;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m22_axi_arburst;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m22_axi_arcache;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m22_axi_arid;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m22_axi_arlen;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_arlock;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m22_axi_arprot;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m22_axi_arsize;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_arvalid;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m22_axi_awaddr;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m22_axi_awburst;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m22_axi_awcache;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m22_axi_awid;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m22_axi_awlen;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_awlock;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m22_axi_awprot;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m22_axi_awsize;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_awvalid;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_bready;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_rready;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m22_axi_wdata;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_wlast;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m22_axi_wstrb;	// To u22_axi_hbm_sub of axi_hbm_sub.v
input			m22_axi_wvalid;		// To u22_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m23_axi_araddr;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m23_axi_arburst;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m23_axi_arcache;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m23_axi_arid;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m23_axi_arlen;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_arlock;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m23_axi_arprot;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m23_axi_arsize;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_arvalid;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m23_axi_awaddr;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m23_axi_awburst;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m23_axi_awcache;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m23_axi_awid;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m23_axi_awlen;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_awlock;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m23_axi_awprot;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m23_axi_awsize;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_awvalid;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_bready;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_rready;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m23_axi_wdata;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_wlast;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m23_axi_wstrb;	// To u23_axi_hbm_sub of axi_hbm_sub.v
input			m23_axi_wvalid;		// To u23_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m24_axi_araddr;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m24_axi_arburst;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m24_axi_arcache;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m24_axi_arid;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m24_axi_arlen;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_arlock;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m24_axi_arprot;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m24_axi_arsize;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_arvalid;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m24_axi_awaddr;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m24_axi_awburst;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m24_axi_awcache;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m24_axi_awid;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m24_axi_awlen;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_awlock;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m24_axi_awprot;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m24_axi_awsize;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_awvalid;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_bready;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_rready;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m24_axi_wdata;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_wlast;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m24_axi_wstrb;	// To u24_axi_hbm_sub of axi_hbm_sub.v
input			m24_axi_wvalid;		// To u24_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m25_axi_araddr;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m25_axi_arburst;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m25_axi_arcache;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m25_axi_arid;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m25_axi_arlen;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_arlock;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m25_axi_arprot;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m25_axi_arsize;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_arvalid;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m25_axi_awaddr;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m25_axi_awburst;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m25_axi_awcache;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m25_axi_awid;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m25_axi_awlen;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_awlock;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m25_axi_awprot;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m25_axi_awsize;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_awvalid;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_bready;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_rready;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m25_axi_wdata;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_wlast;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m25_axi_wstrb;	// To u25_axi_hbm_sub of axi_hbm_sub.v
input			m25_axi_wvalid;		// To u25_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m26_axi_araddr;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m26_axi_arburst;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m26_axi_arcache;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m26_axi_arid;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m26_axi_arlen;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_arlock;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m26_axi_arprot;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m26_axi_arsize;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_arvalid;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m26_axi_awaddr;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m26_axi_awburst;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m26_axi_awcache;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m26_axi_awid;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m26_axi_awlen;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_awlock;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m26_axi_awprot;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m26_axi_awsize;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_awvalid;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_bready;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_rready;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m26_axi_wdata;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_wlast;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m26_axi_wstrb;	// To u26_axi_hbm_sub of axi_hbm_sub.v
input			m26_axi_wvalid;		// To u26_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m27_axi_araddr;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m27_axi_arburst;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m27_axi_arcache;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m27_axi_arid;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m27_axi_arlen;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_arlock;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m27_axi_arprot;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m27_axi_arsize;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_arvalid;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m27_axi_awaddr;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m27_axi_awburst;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m27_axi_awcache;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m27_axi_awid;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m27_axi_awlen;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_awlock;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m27_axi_awprot;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m27_axi_awsize;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_awvalid;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_bready;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_rready;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m27_axi_wdata;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_wlast;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m27_axi_wstrb;	// To u27_axi_hbm_sub of axi_hbm_sub.v
input			m27_axi_wvalid;		// To u27_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m28_axi_araddr;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m28_axi_arburst;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m28_axi_arcache;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m28_axi_arid;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m28_axi_arlen;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_arlock;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m28_axi_arprot;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m28_axi_arsize;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_arvalid;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m28_axi_awaddr;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m28_axi_awburst;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m28_axi_awcache;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m28_axi_awid;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m28_axi_awlen;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_awlock;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m28_axi_awprot;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m28_axi_awsize;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_awvalid;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_bready;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_rready;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m28_axi_wdata;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_wlast;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m28_axi_wstrb;	// To u28_axi_hbm_sub of axi_hbm_sub.v
input			m28_axi_wvalid;		// To u28_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m29_axi_araddr;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m29_axi_arburst;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m29_axi_arcache;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m29_axi_arid;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m29_axi_arlen;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_arlock;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m29_axi_arprot;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m29_axi_arsize;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_arvalid;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m29_axi_awaddr;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m29_axi_awburst;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m29_axi_awcache;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m29_axi_awid;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m29_axi_awlen;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_awlock;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m29_axi_awprot;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m29_axi_awsize;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_awvalid;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_bready;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_rready;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m29_axi_wdata;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_wlast;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m29_axi_wstrb;	// To u29_axi_hbm_sub of axi_hbm_sub.v
input			m29_axi_wvalid;		// To u29_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m2_axi_araddr;	// To u2_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m2_axi_arburst;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m2_axi_arcache;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m2_axi_arid;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m2_axi_arlen;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_arlock;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m2_axi_arprot;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m2_axi_arsize;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_arvalid;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m2_axi_awaddr;	// To u2_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m2_axi_awburst;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m2_axi_awcache;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m2_axi_awid;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m2_axi_awlen;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_awlock;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m2_axi_awprot;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m2_axi_awsize;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_awvalid;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_bready;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_rready;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m2_axi_wdata;	// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_wlast;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m2_axi_wstrb;	// To u2_axi_hbm_sub of axi_hbm_sub.v
input			m2_axi_wvalid;		// To u2_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m30_axi_araddr;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m30_axi_arburst;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m30_axi_arcache;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m30_axi_arid;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m30_axi_arlen;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_arlock;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m30_axi_arprot;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m30_axi_arsize;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_arvalid;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m30_axi_awaddr;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m30_axi_awburst;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m30_axi_awcache;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m30_axi_awid;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m30_axi_awlen;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_awlock;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m30_axi_awprot;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m30_axi_awsize;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_awvalid;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_bready;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_rready;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m30_axi_wdata;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_wlast;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m30_axi_wstrb;	// To u30_axi_hbm_sub of axi_hbm_sub.v
input			m30_axi_wvalid;		// To u30_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m31_axi_araddr;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m31_axi_arburst;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m31_axi_arcache;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m31_axi_arid;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m31_axi_arlen;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_arlock;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m31_axi_arprot;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m31_axi_arsize;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_arvalid;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m31_axi_awaddr;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m31_axi_awburst;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m31_axi_awcache;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m31_axi_awid;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m31_axi_awlen;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_awlock;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m31_axi_awprot;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m31_axi_awsize;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_awvalid;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_bready;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_rready;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m31_axi_wdata;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_wlast;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m31_axi_wstrb;	// To u31_axi_hbm_sub of axi_hbm_sub.v
input			m31_axi_wvalid;		// To u31_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m3_axi_araddr;	// To u3_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m3_axi_arburst;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m3_axi_arcache;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m3_axi_arid;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m3_axi_arlen;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_arlock;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m3_axi_arprot;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m3_axi_arsize;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_arvalid;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m3_axi_awaddr;	// To u3_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m3_axi_awburst;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m3_axi_awcache;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m3_axi_awid;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m3_axi_awlen;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_awlock;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m3_axi_awprot;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m3_axi_awsize;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_awvalid;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_bready;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_rready;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m3_axi_wdata;	// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_wlast;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m3_axi_wstrb;	// To u3_axi_hbm_sub of axi_hbm_sub.v
input			m3_axi_wvalid;		// To u3_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m4_axi_araddr;	// To u4_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m4_axi_arburst;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m4_axi_arcache;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m4_axi_arid;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m4_axi_arlen;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_arlock;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m4_axi_arprot;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m4_axi_arsize;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_arvalid;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m4_axi_awaddr;	// To u4_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m4_axi_awburst;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m4_axi_awcache;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m4_axi_awid;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m4_axi_awlen;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_awlock;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m4_axi_awprot;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m4_axi_awsize;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_awvalid;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_bready;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_rready;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m4_axi_wdata;	// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_wlast;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m4_axi_wstrb;	// To u4_axi_hbm_sub of axi_hbm_sub.v
input			m4_axi_wvalid;		// To u4_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m5_axi_araddr;	// To u5_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m5_axi_arburst;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m5_axi_arcache;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m5_axi_arid;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m5_axi_arlen;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_arlock;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m5_axi_arprot;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m5_axi_arsize;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_arvalid;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m5_axi_awaddr;	// To u5_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m5_axi_awburst;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m5_axi_awcache;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m5_axi_awid;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m5_axi_awlen;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_awlock;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m5_axi_awprot;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m5_axi_awsize;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_awvalid;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_bready;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_rready;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m5_axi_wdata;	// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_wlast;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m5_axi_wstrb;	// To u5_axi_hbm_sub of axi_hbm_sub.v
input			m5_axi_wvalid;		// To u5_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m6_axi_araddr;	// To u6_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m6_axi_arburst;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m6_axi_arcache;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m6_axi_arid;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m6_axi_arlen;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_arlock;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m6_axi_arprot;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m6_axi_arsize;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_arvalid;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m6_axi_awaddr;	// To u6_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m6_axi_awburst;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m6_axi_awcache;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m6_axi_awid;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m6_axi_awlen;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_awlock;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m6_axi_awprot;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m6_axi_awsize;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_awvalid;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_bready;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_rready;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m6_axi_wdata;	// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_wlast;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m6_axi_wstrb;	// To u6_axi_hbm_sub of axi_hbm_sub.v
input			m6_axi_wvalid;		// To u6_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m7_axi_araddr;	// To u7_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m7_axi_arburst;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m7_axi_arcache;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m7_axi_arid;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m7_axi_arlen;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_arlock;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m7_axi_arprot;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m7_axi_arsize;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_arvalid;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m7_axi_awaddr;	// To u7_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m7_axi_awburst;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m7_axi_awcache;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m7_axi_awid;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m7_axi_awlen;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_awlock;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m7_axi_awprot;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m7_axi_awsize;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_awvalid;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_bready;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_rready;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m7_axi_wdata;	// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_wlast;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m7_axi_wstrb;	// To u7_axi_hbm_sub of axi_hbm_sub.v
input			m7_axi_wvalid;		// To u7_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m8_axi_araddr;	// To u8_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m8_axi_arburst;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m8_axi_arcache;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m8_axi_arid;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m8_axi_arlen;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_arlock;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m8_axi_arprot;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m8_axi_arsize;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_arvalid;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m8_axi_awaddr;	// To u8_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m8_axi_awburst;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m8_axi_awcache;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m8_axi_awid;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m8_axi_awlen;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_awlock;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m8_axi_awprot;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m8_axi_awsize;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_awvalid;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_bready;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_rready;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m8_axi_wdata;	// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_wlast;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m8_axi_wstrb;	// To u8_axi_hbm_sub of axi_hbm_sub.v
input			m8_axi_wvalid;		// To u8_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m9_axi_araddr;	// To u9_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m9_axi_arburst;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m9_axi_arcache;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m9_axi_arid;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m9_axi_arlen;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_arlock;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m9_axi_arprot;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m9_axi_arsize;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_arvalid;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [AXI_ADDR_WIDTH-1:0] m9_axi_awaddr;	// To u9_axi_hbm_sub of axi_hbm_sub.v
input [1:0]		m9_axi_awburst;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [3:0]		m9_axi_awcache;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [M_ID_WIDTH-1:0]	m9_axi_awid;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [7:0]		m9_axi_awlen;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_awlock;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m9_axi_awprot;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [2:0]		m9_axi_awsize;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_awvalid;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_bready;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_rready;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [AXI_DATA_WIDTH-1:0] m9_axi_wdata;	// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_wlast;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input [AXI_STRB_WIDTH-1:0] m9_axi_wstrb;	// To u9_axi_hbm_sub of axi_hbm_sub.v
input			m9_axi_wvalid;		// To u9_axi_hbm_sub of axi_hbm_sub.v
input			rst;			// To u0_axi_hbm_sub of axi_hbm_sub.v, ...
// End of automatics
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			m0_axi_arready;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output			m0_axi_awready;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m0_axi_bid;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m0_axi_bresp;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output			m0_axi_bvalid;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m0_axi_rdata;	// From u0_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m0_axi_rid;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output			m0_axi_rlast;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m0_axi_rresp;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output			m0_axi_rvalid;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output			m0_axi_wready;		// From u0_axi_hbm_sub of axi_hbm_sub.v
output			m10_axi_arready;	// From u10_axi_hbm_sub of axi_hbm_sub.v
output			m10_axi_awready;	// From u10_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m10_axi_bid;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m10_axi_bresp;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output			m10_axi_bvalid;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m10_axi_rdata;	// From u10_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m10_axi_rid;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output			m10_axi_rlast;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m10_axi_rresp;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output			m10_axi_rvalid;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output			m10_axi_wready;		// From u10_axi_hbm_sub of axi_hbm_sub.v
output			m11_axi_arready;	// From u11_axi_hbm_sub of axi_hbm_sub.v
output			m11_axi_awready;	// From u11_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m11_axi_bid;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m11_axi_bresp;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output			m11_axi_bvalid;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m11_axi_rdata;	// From u11_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m11_axi_rid;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output			m11_axi_rlast;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m11_axi_rresp;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output			m11_axi_rvalid;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output			m11_axi_wready;		// From u11_axi_hbm_sub of axi_hbm_sub.v
output			m12_axi_arready;	// From u12_axi_hbm_sub of axi_hbm_sub.v
output			m12_axi_awready;	// From u12_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m12_axi_bid;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m12_axi_bresp;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output			m12_axi_bvalid;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m12_axi_rdata;	// From u12_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m12_axi_rid;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output			m12_axi_rlast;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m12_axi_rresp;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output			m12_axi_rvalid;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output			m12_axi_wready;		// From u12_axi_hbm_sub of axi_hbm_sub.v
output			m13_axi_arready;	// From u13_axi_hbm_sub of axi_hbm_sub.v
output			m13_axi_awready;	// From u13_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m13_axi_bid;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m13_axi_bresp;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output			m13_axi_bvalid;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m13_axi_rdata;	// From u13_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m13_axi_rid;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output			m13_axi_rlast;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m13_axi_rresp;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output			m13_axi_rvalid;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output			m13_axi_wready;		// From u13_axi_hbm_sub of axi_hbm_sub.v
output			m14_axi_arready;	// From u14_axi_hbm_sub of axi_hbm_sub.v
output			m14_axi_awready;	// From u14_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m14_axi_bid;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m14_axi_bresp;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output			m14_axi_bvalid;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m14_axi_rdata;	// From u14_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m14_axi_rid;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output			m14_axi_rlast;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m14_axi_rresp;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output			m14_axi_rvalid;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output			m14_axi_wready;		// From u14_axi_hbm_sub of axi_hbm_sub.v
output			m15_axi_arready;	// From u15_axi_hbm_sub of axi_hbm_sub.v
output			m15_axi_awready;	// From u15_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m15_axi_bid;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m15_axi_bresp;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output			m15_axi_bvalid;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m15_axi_rdata;	// From u15_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m15_axi_rid;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output			m15_axi_rlast;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m15_axi_rresp;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output			m15_axi_rvalid;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output			m15_axi_wready;		// From u15_axi_hbm_sub of axi_hbm_sub.v
output			m16_axi_arready;	// From u16_axi_hbm_sub of axi_hbm_sub.v
output			m16_axi_awready;	// From u16_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m16_axi_bid;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m16_axi_bresp;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output			m16_axi_bvalid;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m16_axi_rdata;	// From u16_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m16_axi_rid;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output			m16_axi_rlast;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m16_axi_rresp;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output			m16_axi_rvalid;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output			m16_axi_wready;		// From u16_axi_hbm_sub of axi_hbm_sub.v
output			m17_axi_arready;	// From u17_axi_hbm_sub of axi_hbm_sub.v
output			m17_axi_awready;	// From u17_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m17_axi_bid;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m17_axi_bresp;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output			m17_axi_bvalid;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m17_axi_rdata;	// From u17_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m17_axi_rid;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output			m17_axi_rlast;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m17_axi_rresp;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output			m17_axi_rvalid;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output			m17_axi_wready;		// From u17_axi_hbm_sub of axi_hbm_sub.v
output			m18_axi_arready;	// From u18_axi_hbm_sub of axi_hbm_sub.v
output			m18_axi_awready;	// From u18_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m18_axi_bid;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m18_axi_bresp;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output			m18_axi_bvalid;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m18_axi_rdata;	// From u18_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m18_axi_rid;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output			m18_axi_rlast;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m18_axi_rresp;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output			m18_axi_rvalid;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output			m18_axi_wready;		// From u18_axi_hbm_sub of axi_hbm_sub.v
output			m19_axi_arready;	// From u19_axi_hbm_sub of axi_hbm_sub.v
output			m19_axi_awready;	// From u19_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m19_axi_bid;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m19_axi_bresp;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output			m19_axi_bvalid;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m19_axi_rdata;	// From u19_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m19_axi_rid;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output			m19_axi_rlast;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m19_axi_rresp;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output			m19_axi_rvalid;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output			m19_axi_wready;		// From u19_axi_hbm_sub of axi_hbm_sub.v
output			m1_axi_arready;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output			m1_axi_awready;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m1_axi_bid;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m1_axi_bresp;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output			m1_axi_bvalid;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m1_axi_rdata;	// From u1_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m1_axi_rid;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output			m1_axi_rlast;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m1_axi_rresp;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output			m1_axi_rvalid;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output			m1_axi_wready;		// From u1_axi_hbm_sub of axi_hbm_sub.v
output			m20_axi_arready;	// From u20_axi_hbm_sub of axi_hbm_sub.v
output			m20_axi_awready;	// From u20_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m20_axi_bid;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m20_axi_bresp;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output			m20_axi_bvalid;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m20_axi_rdata;	// From u20_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m20_axi_rid;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output			m20_axi_rlast;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m20_axi_rresp;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output			m20_axi_rvalid;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output			m20_axi_wready;		// From u20_axi_hbm_sub of axi_hbm_sub.v
output			m21_axi_arready;	// From u21_axi_hbm_sub of axi_hbm_sub.v
output			m21_axi_awready;	// From u21_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m21_axi_bid;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m21_axi_bresp;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output			m21_axi_bvalid;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m21_axi_rdata;	// From u21_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m21_axi_rid;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output			m21_axi_rlast;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m21_axi_rresp;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output			m21_axi_rvalid;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output			m21_axi_wready;		// From u21_axi_hbm_sub of axi_hbm_sub.v
output			m22_axi_arready;	// From u22_axi_hbm_sub of axi_hbm_sub.v
output			m22_axi_awready;	// From u22_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m22_axi_bid;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m22_axi_bresp;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output			m22_axi_bvalid;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m22_axi_rdata;	// From u22_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m22_axi_rid;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output			m22_axi_rlast;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m22_axi_rresp;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output			m22_axi_rvalid;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output			m22_axi_wready;		// From u22_axi_hbm_sub of axi_hbm_sub.v
output			m23_axi_arready;	// From u23_axi_hbm_sub of axi_hbm_sub.v
output			m23_axi_awready;	// From u23_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m23_axi_bid;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m23_axi_bresp;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output			m23_axi_bvalid;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m23_axi_rdata;	// From u23_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m23_axi_rid;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output			m23_axi_rlast;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m23_axi_rresp;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output			m23_axi_rvalid;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output			m23_axi_wready;		// From u23_axi_hbm_sub of axi_hbm_sub.v
output			m24_axi_arready;	// From u24_axi_hbm_sub of axi_hbm_sub.v
output			m24_axi_awready;	// From u24_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m24_axi_bid;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m24_axi_bresp;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output			m24_axi_bvalid;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m24_axi_rdata;	// From u24_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m24_axi_rid;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output			m24_axi_rlast;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m24_axi_rresp;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output			m24_axi_rvalid;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output			m24_axi_wready;		// From u24_axi_hbm_sub of axi_hbm_sub.v
output			m25_axi_arready;	// From u25_axi_hbm_sub of axi_hbm_sub.v
output			m25_axi_awready;	// From u25_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m25_axi_bid;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m25_axi_bresp;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output			m25_axi_bvalid;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m25_axi_rdata;	// From u25_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m25_axi_rid;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output			m25_axi_rlast;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m25_axi_rresp;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output			m25_axi_rvalid;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output			m25_axi_wready;		// From u25_axi_hbm_sub of axi_hbm_sub.v
output			m26_axi_arready;	// From u26_axi_hbm_sub of axi_hbm_sub.v
output			m26_axi_awready;	// From u26_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m26_axi_bid;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m26_axi_bresp;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output			m26_axi_bvalid;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m26_axi_rdata;	// From u26_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m26_axi_rid;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output			m26_axi_rlast;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m26_axi_rresp;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output			m26_axi_rvalid;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output			m26_axi_wready;		// From u26_axi_hbm_sub of axi_hbm_sub.v
output			m27_axi_arready;	// From u27_axi_hbm_sub of axi_hbm_sub.v
output			m27_axi_awready;	// From u27_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m27_axi_bid;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m27_axi_bresp;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output			m27_axi_bvalid;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m27_axi_rdata;	// From u27_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m27_axi_rid;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output			m27_axi_rlast;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m27_axi_rresp;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output			m27_axi_rvalid;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output			m27_axi_wready;		// From u27_axi_hbm_sub of axi_hbm_sub.v
output			m28_axi_arready;	// From u28_axi_hbm_sub of axi_hbm_sub.v
output			m28_axi_awready;	// From u28_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m28_axi_bid;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m28_axi_bresp;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output			m28_axi_bvalid;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m28_axi_rdata;	// From u28_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m28_axi_rid;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output			m28_axi_rlast;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m28_axi_rresp;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output			m28_axi_rvalid;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output			m28_axi_wready;		// From u28_axi_hbm_sub of axi_hbm_sub.v
output			m29_axi_arready;	// From u29_axi_hbm_sub of axi_hbm_sub.v
output			m29_axi_awready;	// From u29_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m29_axi_bid;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m29_axi_bresp;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output			m29_axi_bvalid;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m29_axi_rdata;	// From u29_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m29_axi_rid;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output			m29_axi_rlast;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m29_axi_rresp;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output			m29_axi_rvalid;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output			m29_axi_wready;		// From u29_axi_hbm_sub of axi_hbm_sub.v
output			m2_axi_arready;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output			m2_axi_awready;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m2_axi_bid;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m2_axi_bresp;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output			m2_axi_bvalid;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m2_axi_rdata;	// From u2_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m2_axi_rid;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output			m2_axi_rlast;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m2_axi_rresp;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output			m2_axi_rvalid;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output			m2_axi_wready;		// From u2_axi_hbm_sub of axi_hbm_sub.v
output			m30_axi_arready;	// From u30_axi_hbm_sub of axi_hbm_sub.v
output			m30_axi_awready;	// From u30_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m30_axi_bid;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m30_axi_bresp;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output			m30_axi_bvalid;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m30_axi_rdata;	// From u30_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m30_axi_rid;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output			m30_axi_rlast;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m30_axi_rresp;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output			m30_axi_rvalid;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output			m30_axi_wready;		// From u30_axi_hbm_sub of axi_hbm_sub.v
output			m31_axi_arready;	// From u31_axi_hbm_sub of axi_hbm_sub.v
output			m31_axi_awready;	// From u31_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m31_axi_bid;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m31_axi_bresp;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output			m31_axi_bvalid;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m31_axi_rdata;	// From u31_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m31_axi_rid;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output			m31_axi_rlast;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m31_axi_rresp;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output			m31_axi_rvalid;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output			m31_axi_wready;		// From u31_axi_hbm_sub of axi_hbm_sub.v
output			m3_axi_arready;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output			m3_axi_awready;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m3_axi_bid;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m3_axi_bresp;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output			m3_axi_bvalid;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m3_axi_rdata;	// From u3_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m3_axi_rid;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output			m3_axi_rlast;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m3_axi_rresp;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output			m3_axi_rvalid;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output			m3_axi_wready;		// From u3_axi_hbm_sub of axi_hbm_sub.v
output			m4_axi_arready;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output			m4_axi_awready;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m4_axi_bid;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m4_axi_bresp;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output			m4_axi_bvalid;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m4_axi_rdata;	// From u4_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m4_axi_rid;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output			m4_axi_rlast;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m4_axi_rresp;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output			m4_axi_rvalid;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output			m4_axi_wready;		// From u4_axi_hbm_sub of axi_hbm_sub.v
output			m5_axi_arready;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output			m5_axi_awready;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m5_axi_bid;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m5_axi_bresp;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output			m5_axi_bvalid;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m5_axi_rdata;	// From u5_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m5_axi_rid;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output			m5_axi_rlast;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m5_axi_rresp;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output			m5_axi_rvalid;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output			m5_axi_wready;		// From u5_axi_hbm_sub of axi_hbm_sub.v
output			m6_axi_arready;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output			m6_axi_awready;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m6_axi_bid;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m6_axi_bresp;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output			m6_axi_bvalid;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m6_axi_rdata;	// From u6_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m6_axi_rid;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output			m6_axi_rlast;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m6_axi_rresp;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output			m6_axi_rvalid;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output			m6_axi_wready;		// From u6_axi_hbm_sub of axi_hbm_sub.v
output			m7_axi_arready;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output			m7_axi_awready;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m7_axi_bid;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m7_axi_bresp;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output			m7_axi_bvalid;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m7_axi_rdata;	// From u7_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m7_axi_rid;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output			m7_axi_rlast;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m7_axi_rresp;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output			m7_axi_rvalid;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output			m7_axi_wready;		// From u7_axi_hbm_sub of axi_hbm_sub.v
output			m8_axi_arready;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output			m8_axi_awready;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m8_axi_bid;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m8_axi_bresp;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output			m8_axi_bvalid;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m8_axi_rdata;	// From u8_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m8_axi_rid;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output			m8_axi_rlast;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m8_axi_rresp;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output			m8_axi_rvalid;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output			m8_axi_wready;		// From u8_axi_hbm_sub of axi_hbm_sub.v
output			m9_axi_arready;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output			m9_axi_awready;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m9_axi_bid;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m9_axi_bresp;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output			m9_axi_bvalid;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output [AXI_DATA_WIDTH-1:0] m9_axi_rdata;	// From u9_axi_hbm_sub of axi_hbm_sub.v
output [M_ID_WIDTH-1:0]	m9_axi_rid;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output			m9_axi_rlast;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output [1:0]		m9_axi_rresp;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output			m9_axi_rvalid;		// From u9_axi_hbm_sub of axi_hbm_sub.v
output			m9_axi_wready;		// From u9_axi_hbm_sub of axi_hbm_sub.v
// End of automatics
/*AUTOWIRE*/





/* axi_hbm_sub  AUTO_TEMPLATE "\([0-9]+\)"  (
	.s_axi_\(.*\) 		(m@_axi_\1[]),
 );
*/


`ifdef SIM
    bit [AXI_DATA_WIDTH-1:0] mem[bit[VALID_ADDR_WIDTH-1:0]];   
`else
    // (* RAM_STYLE="BLOCK" *)
    reg [AXI_DATA_WIDTH-1:0] mem[(2**VALID_ADDR_WIDTH)-1:0];
`endif

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u0_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m0_axi_awready), // Templated
									 .s_axi_wready		(m0_axi_wready), // Templated
									 .s_axi_bid		(m0_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m0_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m0_axi_bvalid), // Templated
									 .s_axi_arready		(m0_axi_arready), // Templated
									 .s_axi_rid		(m0_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m0_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m0_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m0_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m0_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m0_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m0_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m0_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m0_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m0_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m0_axi_awlock), // Templated
									 .s_axi_awcache		(m0_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m0_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m0_axi_awvalid), // Templated
									 .s_axi_wdata		(m0_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m0_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m0_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m0_axi_wvalid), // Templated
									 .s_axi_bready		(m0_axi_bready), // Templated
									 .s_axi_arid		(m0_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m0_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m0_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m0_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m0_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m0_axi_arlock), // Templated
									 .s_axi_arcache		(m0_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m0_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m0_axi_arvalid), // Templated
									 .s_axi_rready		(m0_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u1_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m1_axi_awready), // Templated
									 .s_axi_wready		(m1_axi_wready), // Templated
									 .s_axi_bid		(m1_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m1_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m1_axi_bvalid), // Templated
									 .s_axi_arready		(m1_axi_arready), // Templated
									 .s_axi_rid		(m1_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m1_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m1_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m1_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m1_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m1_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m1_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m1_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m1_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m1_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m1_axi_awlock), // Templated
									 .s_axi_awcache		(m1_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m1_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m1_axi_awvalid), // Templated
									 .s_axi_wdata		(m1_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m1_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m1_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m1_axi_wvalid), // Templated
									 .s_axi_bready		(m1_axi_bready), // Templated
									 .s_axi_arid		(m1_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m1_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m1_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m1_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m1_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m1_axi_arlock), // Templated
									 .s_axi_arcache		(m1_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m1_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m1_axi_arvalid), // Templated
									 .s_axi_rready		(m1_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u2_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m2_axi_awready), // Templated
									 .s_axi_wready		(m2_axi_wready), // Templated
									 .s_axi_bid		(m2_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m2_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m2_axi_bvalid), // Templated
									 .s_axi_arready		(m2_axi_arready), // Templated
									 .s_axi_rid		(m2_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m2_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m2_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m2_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m2_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m2_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m2_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m2_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m2_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m2_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m2_axi_awlock), // Templated
									 .s_axi_awcache		(m2_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m2_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m2_axi_awvalid), // Templated
									 .s_axi_wdata		(m2_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m2_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m2_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m2_axi_wvalid), // Templated
									 .s_axi_bready		(m2_axi_bready), // Templated
									 .s_axi_arid		(m2_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m2_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m2_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m2_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m2_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m2_axi_arlock), // Templated
									 .s_axi_arcache		(m2_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m2_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m2_axi_arvalid), // Templated
									 .s_axi_rready		(m2_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u3_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m3_axi_awready), // Templated
									 .s_axi_wready		(m3_axi_wready), // Templated
									 .s_axi_bid		(m3_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m3_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m3_axi_bvalid), // Templated
									 .s_axi_arready		(m3_axi_arready), // Templated
									 .s_axi_rid		(m3_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m3_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m3_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m3_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m3_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m3_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m3_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m3_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m3_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m3_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m3_axi_awlock), // Templated
									 .s_axi_awcache		(m3_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m3_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m3_axi_awvalid), // Templated
									 .s_axi_wdata		(m3_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m3_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m3_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m3_axi_wvalid), // Templated
									 .s_axi_bready		(m3_axi_bready), // Templated
									 .s_axi_arid		(m3_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m3_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m3_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m3_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m3_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m3_axi_arlock), // Templated
									 .s_axi_arcache		(m3_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m3_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m3_axi_arvalid), // Templated
									 .s_axi_rready		(m3_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u4_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m4_axi_awready), // Templated
									 .s_axi_wready		(m4_axi_wready), // Templated
									 .s_axi_bid		(m4_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m4_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m4_axi_bvalid), // Templated
									 .s_axi_arready		(m4_axi_arready), // Templated
									 .s_axi_rid		(m4_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m4_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m4_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m4_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m4_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m4_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m4_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m4_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m4_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m4_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m4_axi_awlock), // Templated
									 .s_axi_awcache		(m4_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m4_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m4_axi_awvalid), // Templated
									 .s_axi_wdata		(m4_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m4_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m4_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m4_axi_wvalid), // Templated
									 .s_axi_bready		(m4_axi_bready), // Templated
									 .s_axi_arid		(m4_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m4_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m4_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m4_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m4_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m4_axi_arlock), // Templated
									 .s_axi_arcache		(m4_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m4_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m4_axi_arvalid), // Templated
									 .s_axi_rready		(m4_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u5_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m5_axi_awready), // Templated
									 .s_axi_wready		(m5_axi_wready), // Templated
									 .s_axi_bid		(m5_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m5_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m5_axi_bvalid), // Templated
									 .s_axi_arready		(m5_axi_arready), // Templated
									 .s_axi_rid		(m5_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m5_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m5_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m5_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m5_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m5_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m5_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m5_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m5_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m5_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m5_axi_awlock), // Templated
									 .s_axi_awcache		(m5_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m5_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m5_axi_awvalid), // Templated
									 .s_axi_wdata		(m5_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m5_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m5_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m5_axi_wvalid), // Templated
									 .s_axi_bready		(m5_axi_bready), // Templated
									 .s_axi_arid		(m5_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m5_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m5_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m5_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m5_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m5_axi_arlock), // Templated
									 .s_axi_arcache		(m5_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m5_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m5_axi_arvalid), // Templated
									 .s_axi_rready		(m5_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u6_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m6_axi_awready), // Templated
									 .s_axi_wready		(m6_axi_wready), // Templated
									 .s_axi_bid		(m6_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m6_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m6_axi_bvalid), // Templated
									 .s_axi_arready		(m6_axi_arready), // Templated
									 .s_axi_rid		(m6_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m6_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m6_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m6_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m6_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m6_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m6_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m6_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m6_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m6_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m6_axi_awlock), // Templated
									 .s_axi_awcache		(m6_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m6_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m6_axi_awvalid), // Templated
									 .s_axi_wdata		(m6_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m6_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m6_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m6_axi_wvalid), // Templated
									 .s_axi_bready		(m6_axi_bready), // Templated
									 .s_axi_arid		(m6_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m6_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m6_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m6_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m6_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m6_axi_arlock), // Templated
									 .s_axi_arcache		(m6_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m6_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m6_axi_arvalid), // Templated
									 .s_axi_rready		(m6_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u7_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m7_axi_awready), // Templated
									 .s_axi_wready		(m7_axi_wready), // Templated
									 .s_axi_bid		(m7_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m7_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m7_axi_bvalid), // Templated
									 .s_axi_arready		(m7_axi_arready), // Templated
									 .s_axi_rid		(m7_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m7_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m7_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m7_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m7_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m7_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m7_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m7_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m7_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m7_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m7_axi_awlock), // Templated
									 .s_axi_awcache		(m7_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m7_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m7_axi_awvalid), // Templated
									 .s_axi_wdata		(m7_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m7_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m7_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m7_axi_wvalid), // Templated
									 .s_axi_bready		(m7_axi_bready), // Templated
									 .s_axi_arid		(m7_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m7_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m7_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m7_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m7_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m7_axi_arlock), // Templated
									 .s_axi_arcache		(m7_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m7_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m7_axi_arvalid), // Templated
									 .s_axi_rready		(m7_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u8_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m8_axi_awready), // Templated
									 .s_axi_wready		(m8_axi_wready), // Templated
									 .s_axi_bid		(m8_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m8_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m8_axi_bvalid), // Templated
									 .s_axi_arready		(m8_axi_arready), // Templated
									 .s_axi_rid		(m8_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m8_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m8_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m8_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m8_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m8_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m8_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m8_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m8_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m8_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m8_axi_awlock), // Templated
									 .s_axi_awcache		(m8_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m8_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m8_axi_awvalid), // Templated
									 .s_axi_wdata		(m8_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m8_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m8_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m8_axi_wvalid), // Templated
									 .s_axi_bready		(m8_axi_bready), // Templated
									 .s_axi_arid		(m8_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m8_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m8_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m8_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m8_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m8_axi_arlock), // Templated
									 .s_axi_arcache		(m8_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m8_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m8_axi_arvalid), // Templated
									 .s_axi_rready		(m8_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u9_axi_hbm_sub (  /*autoinst*/
									 // Outputs
									 .s_axi_awready		(m9_axi_awready), // Templated
									 .s_axi_wready		(m9_axi_wready), // Templated
									 .s_axi_bid		(m9_axi_bid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_bresp		(m9_axi_bresp[1:0]), // Templated
									 .s_axi_bvalid		(m9_axi_bvalid), // Templated
									 .s_axi_arready		(m9_axi_arready), // Templated
									 .s_axi_rid		(m9_axi_rid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_rdata		(m9_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_rresp		(m9_axi_rresp[1:0]), // Templated
									 .s_axi_rlast		(m9_axi_rlast),	 // Templated
									 .s_axi_rvalid		(m9_axi_rvalid), // Templated
									 // Inputs
									 .clk			(clk),
									 .rst			(rst),
									 .s_axi_awid		(m9_axi_awid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_awaddr		(m9_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_awlen		(m9_axi_awlen[7:0]), // Templated
									 .s_axi_awsize		(m9_axi_awsize[2:0]), // Templated
									 .s_axi_awburst		(m9_axi_awburst[1:0]), // Templated
									 .s_axi_awlock		(m9_axi_awlock), // Templated
									 .s_axi_awcache		(m9_axi_awcache[3:0]), // Templated
									 .s_axi_awprot		(m9_axi_awprot[2:0]), // Templated
									 .s_axi_awvalid		(m9_axi_awvalid), // Templated
									 .s_axi_wdata		(m9_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									 .s_axi_wstrb		(m9_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									 .s_axi_wlast		(m9_axi_wlast),	 // Templated
									 .s_axi_wvalid		(m9_axi_wvalid), // Templated
									 .s_axi_bready		(m9_axi_bready), // Templated
									 .s_axi_arid		(m9_axi_arid[M_ID_WIDTH-1:0]), // Templated
									 .s_axi_araddr		(m9_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									 .s_axi_arlen		(m9_axi_arlen[7:0]), // Templated
									 .s_axi_arsize		(m9_axi_arsize[2:0]), // Templated
									 .s_axi_arburst		(m9_axi_arburst[1:0]), // Templated
									 .s_axi_arlock		(m9_axi_arlock), // Templated
									 .s_axi_arcache		(m9_axi_arcache[3:0]), // Templated
									 .s_axi_arprot		(m9_axi_arprot[2:0]), // Templated
									 .s_axi_arvalid		(m9_axi_arvalid), // Templated
									 .s_axi_rready		(m9_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u10_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m10_axi_awready), // Templated
									  .s_axi_wready		(m10_axi_wready), // Templated
									  .s_axi_bid		(m10_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m10_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m10_axi_bvalid), // Templated
									  .s_axi_arready	(m10_axi_arready), // Templated
									  .s_axi_rid		(m10_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m10_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m10_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m10_axi_rlast), // Templated
									  .s_axi_rvalid		(m10_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m10_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m10_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m10_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m10_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m10_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m10_axi_awlock), // Templated
									  .s_axi_awcache	(m10_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m10_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m10_axi_awvalid), // Templated
									  .s_axi_wdata		(m10_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m10_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m10_axi_wlast), // Templated
									  .s_axi_wvalid		(m10_axi_wvalid), // Templated
									  .s_axi_bready		(m10_axi_bready), // Templated
									  .s_axi_arid		(m10_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m10_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m10_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m10_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m10_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m10_axi_arlock), // Templated
									  .s_axi_arcache	(m10_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m10_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m10_axi_arvalid), // Templated
									  .s_axi_rready		(m10_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u11_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m11_axi_awready), // Templated
									  .s_axi_wready		(m11_axi_wready), // Templated
									  .s_axi_bid		(m11_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m11_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m11_axi_bvalid), // Templated
									  .s_axi_arready	(m11_axi_arready), // Templated
									  .s_axi_rid		(m11_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m11_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m11_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m11_axi_rlast), // Templated
									  .s_axi_rvalid		(m11_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m11_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m11_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m11_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m11_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m11_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m11_axi_awlock), // Templated
									  .s_axi_awcache	(m11_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m11_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m11_axi_awvalid), // Templated
									  .s_axi_wdata		(m11_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m11_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m11_axi_wlast), // Templated
									  .s_axi_wvalid		(m11_axi_wvalid), // Templated
									  .s_axi_bready		(m11_axi_bready), // Templated
									  .s_axi_arid		(m11_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m11_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m11_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m11_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m11_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m11_axi_arlock), // Templated
									  .s_axi_arcache	(m11_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m11_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m11_axi_arvalid), // Templated
									  .s_axi_rready		(m11_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u12_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m12_axi_awready), // Templated
									  .s_axi_wready		(m12_axi_wready), // Templated
									  .s_axi_bid		(m12_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m12_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m12_axi_bvalid), // Templated
									  .s_axi_arready	(m12_axi_arready), // Templated
									  .s_axi_rid		(m12_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m12_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m12_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m12_axi_rlast), // Templated
									  .s_axi_rvalid		(m12_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m12_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m12_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m12_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m12_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m12_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m12_axi_awlock), // Templated
									  .s_axi_awcache	(m12_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m12_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m12_axi_awvalid), // Templated
									  .s_axi_wdata		(m12_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m12_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m12_axi_wlast), // Templated
									  .s_axi_wvalid		(m12_axi_wvalid), // Templated
									  .s_axi_bready		(m12_axi_bready), // Templated
									  .s_axi_arid		(m12_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m12_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m12_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m12_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m12_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m12_axi_arlock), // Templated
									  .s_axi_arcache	(m12_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m12_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m12_axi_arvalid), // Templated
									  .s_axi_rready		(m12_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u13_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m13_axi_awready), // Templated
									  .s_axi_wready		(m13_axi_wready), // Templated
									  .s_axi_bid		(m13_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m13_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m13_axi_bvalid), // Templated
									  .s_axi_arready	(m13_axi_arready), // Templated
									  .s_axi_rid		(m13_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m13_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m13_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m13_axi_rlast), // Templated
									  .s_axi_rvalid		(m13_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m13_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m13_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m13_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m13_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m13_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m13_axi_awlock), // Templated
									  .s_axi_awcache	(m13_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m13_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m13_axi_awvalid), // Templated
									  .s_axi_wdata		(m13_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m13_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m13_axi_wlast), // Templated
									  .s_axi_wvalid		(m13_axi_wvalid), // Templated
									  .s_axi_bready		(m13_axi_bready), // Templated
									  .s_axi_arid		(m13_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m13_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m13_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m13_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m13_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m13_axi_arlock), // Templated
									  .s_axi_arcache	(m13_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m13_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m13_axi_arvalid), // Templated
									  .s_axi_rready		(m13_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u14_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m14_axi_awready), // Templated
									  .s_axi_wready		(m14_axi_wready), // Templated
									  .s_axi_bid		(m14_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m14_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m14_axi_bvalid), // Templated
									  .s_axi_arready	(m14_axi_arready), // Templated
									  .s_axi_rid		(m14_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m14_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m14_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m14_axi_rlast), // Templated
									  .s_axi_rvalid		(m14_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m14_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m14_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m14_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m14_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m14_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m14_axi_awlock), // Templated
									  .s_axi_awcache	(m14_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m14_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m14_axi_awvalid), // Templated
									  .s_axi_wdata		(m14_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m14_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m14_axi_wlast), // Templated
									  .s_axi_wvalid		(m14_axi_wvalid), // Templated
									  .s_axi_bready		(m14_axi_bready), // Templated
									  .s_axi_arid		(m14_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m14_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m14_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m14_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m14_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m14_axi_arlock), // Templated
									  .s_axi_arcache	(m14_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m14_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m14_axi_arvalid), // Templated
									  .s_axi_rready		(m14_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u15_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m15_axi_awready), // Templated
									  .s_axi_wready		(m15_axi_wready), // Templated
									  .s_axi_bid		(m15_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m15_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m15_axi_bvalid), // Templated
									  .s_axi_arready	(m15_axi_arready), // Templated
									  .s_axi_rid		(m15_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m15_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m15_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m15_axi_rlast), // Templated
									  .s_axi_rvalid		(m15_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m15_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m15_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m15_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m15_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m15_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m15_axi_awlock), // Templated
									  .s_axi_awcache	(m15_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m15_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m15_axi_awvalid), // Templated
									  .s_axi_wdata		(m15_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m15_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m15_axi_wlast), // Templated
									  .s_axi_wvalid		(m15_axi_wvalid), // Templated
									  .s_axi_bready		(m15_axi_bready), // Templated
									  .s_axi_arid		(m15_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m15_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m15_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m15_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m15_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m15_axi_arlock), // Templated
									  .s_axi_arcache	(m15_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m15_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m15_axi_arvalid), // Templated
									  .s_axi_rready		(m15_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u16_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m16_axi_awready), // Templated
									  .s_axi_wready		(m16_axi_wready), // Templated
									  .s_axi_bid		(m16_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m16_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m16_axi_bvalid), // Templated
									  .s_axi_arready	(m16_axi_arready), // Templated
									  .s_axi_rid		(m16_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m16_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m16_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m16_axi_rlast), // Templated
									  .s_axi_rvalid		(m16_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m16_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m16_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m16_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m16_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m16_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m16_axi_awlock), // Templated
									  .s_axi_awcache	(m16_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m16_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m16_axi_awvalid), // Templated
									  .s_axi_wdata		(m16_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m16_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m16_axi_wlast), // Templated
									  .s_axi_wvalid		(m16_axi_wvalid), // Templated
									  .s_axi_bready		(m16_axi_bready), // Templated
									  .s_axi_arid		(m16_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m16_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m16_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m16_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m16_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m16_axi_arlock), // Templated
									  .s_axi_arcache	(m16_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m16_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m16_axi_arvalid), // Templated
									  .s_axi_rready		(m16_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u17_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m17_axi_awready), // Templated
									  .s_axi_wready		(m17_axi_wready), // Templated
									  .s_axi_bid		(m17_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m17_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m17_axi_bvalid), // Templated
									  .s_axi_arready	(m17_axi_arready), // Templated
									  .s_axi_rid		(m17_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m17_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m17_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m17_axi_rlast), // Templated
									  .s_axi_rvalid		(m17_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m17_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m17_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m17_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m17_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m17_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m17_axi_awlock), // Templated
									  .s_axi_awcache	(m17_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m17_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m17_axi_awvalid), // Templated
									  .s_axi_wdata		(m17_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m17_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m17_axi_wlast), // Templated
									  .s_axi_wvalid		(m17_axi_wvalid), // Templated
									  .s_axi_bready		(m17_axi_bready), // Templated
									  .s_axi_arid		(m17_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m17_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m17_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m17_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m17_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m17_axi_arlock), // Templated
									  .s_axi_arcache	(m17_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m17_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m17_axi_arvalid), // Templated
									  .s_axi_rready		(m17_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u18_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m18_axi_awready), // Templated
									  .s_axi_wready		(m18_axi_wready), // Templated
									  .s_axi_bid		(m18_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m18_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m18_axi_bvalid), // Templated
									  .s_axi_arready	(m18_axi_arready), // Templated
									  .s_axi_rid		(m18_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m18_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m18_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m18_axi_rlast), // Templated
									  .s_axi_rvalid		(m18_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m18_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m18_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m18_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m18_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m18_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m18_axi_awlock), // Templated
									  .s_axi_awcache	(m18_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m18_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m18_axi_awvalid), // Templated
									  .s_axi_wdata		(m18_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m18_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m18_axi_wlast), // Templated
									  .s_axi_wvalid		(m18_axi_wvalid), // Templated
									  .s_axi_bready		(m18_axi_bready), // Templated
									  .s_axi_arid		(m18_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m18_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m18_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m18_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m18_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m18_axi_arlock), // Templated
									  .s_axi_arcache	(m18_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m18_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m18_axi_arvalid), // Templated
									  .s_axi_rready		(m18_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u19_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m19_axi_awready), // Templated
									  .s_axi_wready		(m19_axi_wready), // Templated
									  .s_axi_bid		(m19_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m19_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m19_axi_bvalid), // Templated
									  .s_axi_arready	(m19_axi_arready), // Templated
									  .s_axi_rid		(m19_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m19_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m19_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m19_axi_rlast), // Templated
									  .s_axi_rvalid		(m19_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m19_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m19_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m19_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m19_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m19_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m19_axi_awlock), // Templated
									  .s_axi_awcache	(m19_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m19_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m19_axi_awvalid), // Templated
									  .s_axi_wdata		(m19_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m19_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m19_axi_wlast), // Templated
									  .s_axi_wvalid		(m19_axi_wvalid), // Templated
									  .s_axi_bready		(m19_axi_bready), // Templated
									  .s_axi_arid		(m19_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m19_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m19_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m19_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m19_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m19_axi_arlock), // Templated
									  .s_axi_arcache	(m19_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m19_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m19_axi_arvalid), // Templated
									  .s_axi_rready		(m19_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u20_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m20_axi_awready), // Templated
									  .s_axi_wready		(m20_axi_wready), // Templated
									  .s_axi_bid		(m20_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m20_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m20_axi_bvalid), // Templated
									  .s_axi_arready	(m20_axi_arready), // Templated
									  .s_axi_rid		(m20_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m20_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m20_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m20_axi_rlast), // Templated
									  .s_axi_rvalid		(m20_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m20_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m20_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m20_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m20_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m20_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m20_axi_awlock), // Templated
									  .s_axi_awcache	(m20_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m20_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m20_axi_awvalid), // Templated
									  .s_axi_wdata		(m20_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m20_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m20_axi_wlast), // Templated
									  .s_axi_wvalid		(m20_axi_wvalid), // Templated
									  .s_axi_bready		(m20_axi_bready), // Templated
									  .s_axi_arid		(m20_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m20_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m20_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m20_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m20_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m20_axi_arlock), // Templated
									  .s_axi_arcache	(m20_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m20_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m20_axi_arvalid), // Templated
									  .s_axi_rready		(m20_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u21_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m21_axi_awready), // Templated
									  .s_axi_wready		(m21_axi_wready), // Templated
									  .s_axi_bid		(m21_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m21_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m21_axi_bvalid), // Templated
									  .s_axi_arready	(m21_axi_arready), // Templated
									  .s_axi_rid		(m21_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m21_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m21_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m21_axi_rlast), // Templated
									  .s_axi_rvalid		(m21_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m21_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m21_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m21_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m21_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m21_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m21_axi_awlock), // Templated
									  .s_axi_awcache	(m21_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m21_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m21_axi_awvalid), // Templated
									  .s_axi_wdata		(m21_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m21_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m21_axi_wlast), // Templated
									  .s_axi_wvalid		(m21_axi_wvalid), // Templated
									  .s_axi_bready		(m21_axi_bready), // Templated
									  .s_axi_arid		(m21_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m21_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m21_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m21_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m21_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m21_axi_arlock), // Templated
									  .s_axi_arcache	(m21_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m21_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m21_axi_arvalid), // Templated
									  .s_axi_rready		(m21_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u22_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m22_axi_awready), // Templated
									  .s_axi_wready		(m22_axi_wready), // Templated
									  .s_axi_bid		(m22_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m22_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m22_axi_bvalid), // Templated
									  .s_axi_arready	(m22_axi_arready), // Templated
									  .s_axi_rid		(m22_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m22_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m22_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m22_axi_rlast), // Templated
									  .s_axi_rvalid		(m22_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m22_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m22_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m22_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m22_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m22_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m22_axi_awlock), // Templated
									  .s_axi_awcache	(m22_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m22_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m22_axi_awvalid), // Templated
									  .s_axi_wdata		(m22_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m22_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m22_axi_wlast), // Templated
									  .s_axi_wvalid		(m22_axi_wvalid), // Templated
									  .s_axi_bready		(m22_axi_bready), // Templated
									  .s_axi_arid		(m22_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m22_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m22_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m22_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m22_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m22_axi_arlock), // Templated
									  .s_axi_arcache	(m22_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m22_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m22_axi_arvalid), // Templated
									  .s_axi_rready		(m22_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u23_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m23_axi_awready), // Templated
									  .s_axi_wready		(m23_axi_wready), // Templated
									  .s_axi_bid		(m23_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m23_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m23_axi_bvalid), // Templated
									  .s_axi_arready	(m23_axi_arready), // Templated
									  .s_axi_rid		(m23_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m23_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m23_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m23_axi_rlast), // Templated
									  .s_axi_rvalid		(m23_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m23_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m23_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m23_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m23_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m23_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m23_axi_awlock), // Templated
									  .s_axi_awcache	(m23_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m23_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m23_axi_awvalid), // Templated
									  .s_axi_wdata		(m23_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m23_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m23_axi_wlast), // Templated
									  .s_axi_wvalid		(m23_axi_wvalid), // Templated
									  .s_axi_bready		(m23_axi_bready), // Templated
									  .s_axi_arid		(m23_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m23_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m23_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m23_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m23_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m23_axi_arlock), // Templated
									  .s_axi_arcache	(m23_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m23_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m23_axi_arvalid), // Templated
									  .s_axi_rready		(m23_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u24_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m24_axi_awready), // Templated
									  .s_axi_wready		(m24_axi_wready), // Templated
									  .s_axi_bid		(m24_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m24_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m24_axi_bvalid), // Templated
									  .s_axi_arready	(m24_axi_arready), // Templated
									  .s_axi_rid		(m24_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m24_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m24_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m24_axi_rlast), // Templated
									  .s_axi_rvalid		(m24_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m24_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m24_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m24_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m24_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m24_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m24_axi_awlock), // Templated
									  .s_axi_awcache	(m24_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m24_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m24_axi_awvalid), // Templated
									  .s_axi_wdata		(m24_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m24_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m24_axi_wlast), // Templated
									  .s_axi_wvalid		(m24_axi_wvalid), // Templated
									  .s_axi_bready		(m24_axi_bready), // Templated
									  .s_axi_arid		(m24_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m24_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m24_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m24_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m24_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m24_axi_arlock), // Templated
									  .s_axi_arcache	(m24_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m24_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m24_axi_arvalid), // Templated
									  .s_axi_rready		(m24_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u25_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m25_axi_awready), // Templated
									  .s_axi_wready		(m25_axi_wready), // Templated
									  .s_axi_bid		(m25_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m25_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m25_axi_bvalid), // Templated
									  .s_axi_arready	(m25_axi_arready), // Templated
									  .s_axi_rid		(m25_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m25_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m25_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m25_axi_rlast), // Templated
									  .s_axi_rvalid		(m25_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m25_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m25_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m25_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m25_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m25_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m25_axi_awlock), // Templated
									  .s_axi_awcache	(m25_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m25_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m25_axi_awvalid), // Templated
									  .s_axi_wdata		(m25_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m25_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m25_axi_wlast), // Templated
									  .s_axi_wvalid		(m25_axi_wvalid), // Templated
									  .s_axi_bready		(m25_axi_bready), // Templated
									  .s_axi_arid		(m25_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m25_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m25_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m25_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m25_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m25_axi_arlock), // Templated
									  .s_axi_arcache	(m25_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m25_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m25_axi_arvalid), // Templated
									  .s_axi_rready		(m25_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u26_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m26_axi_awready), // Templated
									  .s_axi_wready		(m26_axi_wready), // Templated
									  .s_axi_bid		(m26_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m26_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m26_axi_bvalid), // Templated
									  .s_axi_arready	(m26_axi_arready), // Templated
									  .s_axi_rid		(m26_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m26_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m26_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m26_axi_rlast), // Templated
									  .s_axi_rvalid		(m26_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m26_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m26_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m26_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m26_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m26_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m26_axi_awlock), // Templated
									  .s_axi_awcache	(m26_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m26_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m26_axi_awvalid), // Templated
									  .s_axi_wdata		(m26_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m26_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m26_axi_wlast), // Templated
									  .s_axi_wvalid		(m26_axi_wvalid), // Templated
									  .s_axi_bready		(m26_axi_bready), // Templated
									  .s_axi_arid		(m26_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m26_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m26_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m26_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m26_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m26_axi_arlock), // Templated
									  .s_axi_arcache	(m26_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m26_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m26_axi_arvalid), // Templated
									  .s_axi_rready		(m26_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u27_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m27_axi_awready), // Templated
									  .s_axi_wready		(m27_axi_wready), // Templated
									  .s_axi_bid		(m27_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m27_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m27_axi_bvalid), // Templated
									  .s_axi_arready	(m27_axi_arready), // Templated
									  .s_axi_rid		(m27_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m27_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m27_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m27_axi_rlast), // Templated
									  .s_axi_rvalid		(m27_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m27_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m27_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m27_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m27_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m27_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m27_axi_awlock), // Templated
									  .s_axi_awcache	(m27_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m27_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m27_axi_awvalid), // Templated
									  .s_axi_wdata		(m27_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m27_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m27_axi_wlast), // Templated
									  .s_axi_wvalid		(m27_axi_wvalid), // Templated
									  .s_axi_bready		(m27_axi_bready), // Templated
									  .s_axi_arid		(m27_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m27_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m27_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m27_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m27_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m27_axi_arlock), // Templated
									  .s_axi_arcache	(m27_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m27_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m27_axi_arvalid), // Templated
									  .s_axi_rready		(m27_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u28_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m28_axi_awready), // Templated
									  .s_axi_wready		(m28_axi_wready), // Templated
									  .s_axi_bid		(m28_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m28_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m28_axi_bvalid), // Templated
									  .s_axi_arready	(m28_axi_arready), // Templated
									  .s_axi_rid		(m28_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m28_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m28_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m28_axi_rlast), // Templated
									  .s_axi_rvalid		(m28_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m28_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m28_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m28_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m28_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m28_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m28_axi_awlock), // Templated
									  .s_axi_awcache	(m28_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m28_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m28_axi_awvalid), // Templated
									  .s_axi_wdata		(m28_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m28_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m28_axi_wlast), // Templated
									  .s_axi_wvalid		(m28_axi_wvalid), // Templated
									  .s_axi_bready		(m28_axi_bready), // Templated
									  .s_axi_arid		(m28_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m28_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m28_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m28_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m28_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m28_axi_arlock), // Templated
									  .s_axi_arcache	(m28_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m28_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m28_axi_arvalid), // Templated
									  .s_axi_rready		(m28_axi_rready)); // Templated


  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u29_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m29_axi_awready), // Templated
									  .s_axi_wready		(m29_axi_wready), // Templated
									  .s_axi_bid		(m29_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m29_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m29_axi_bvalid), // Templated
									  .s_axi_arready	(m29_axi_arready), // Templated
									  .s_axi_rid		(m29_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m29_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m29_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m29_axi_rlast), // Templated
									  .s_axi_rvalid		(m29_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m29_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m29_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m29_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m29_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m29_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m29_axi_awlock), // Templated
									  .s_axi_awcache	(m29_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m29_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m29_axi_awvalid), // Templated
									  .s_axi_wdata		(m29_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m29_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m29_axi_wlast), // Templated
									  .s_axi_wvalid		(m29_axi_wvalid), // Templated
									  .s_axi_bready		(m29_axi_bready), // Templated
									  .s_axi_arid		(m29_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m29_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m29_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m29_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m29_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m29_axi_arlock), // Templated
									  .s_axi_arcache	(m29_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m29_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m29_axi_arvalid), // Templated
									  .s_axi_rready		(m29_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u30_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m30_axi_awready), // Templated
									  .s_axi_wready		(m30_axi_wready), // Templated
									  .s_axi_bid		(m30_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m30_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m30_axi_bvalid), // Templated
									  .s_axi_arready	(m30_axi_arready), // Templated
									  .s_axi_rid		(m30_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m30_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m30_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m30_axi_rlast), // Templated
									  .s_axi_rvalid		(m30_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m30_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m30_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m30_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m30_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m30_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m30_axi_awlock), // Templated
									  .s_axi_awcache	(m30_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m30_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m30_axi_awvalid), // Templated
									  .s_axi_wdata		(m30_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m30_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m30_axi_wlast), // Templated
									  .s_axi_wvalid		(m30_axi_wvalid), // Templated
									  .s_axi_bready		(m30_axi_bready), // Templated
									  .s_axi_arid		(m30_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m30_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m30_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m30_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m30_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m30_axi_arlock), // Templated
									  .s_axi_arcache	(m30_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m30_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m30_axi_arvalid), // Templated
									  .s_axi_rready		(m30_axi_rready)); // Templated

  axi_hbm_sub #(
	    // Parameters
	    .DATA_WIDTH			(AXI_DATA_WIDTH),
	    .ADDR_WIDTH			(AXI_ADDR_WIDTH),
	    .STRB_WIDTH			(AXI_STRB_WIDTH),
	    .ID_WIDTH			(M_ID_WIDTH),
	    .PIPELINE_OUTPUT		(PIPELINE_OUTPUT),
	    .VALID_ADDR_WIDTH		(VALID_ADDR_WIDTH),
	    .WORD_WIDTH			(AXI_WORD_WIDTH),
	    .WORD_SIZE			(AXI_WORD_SIZE)) u31_axi_hbm_sub (  /*autoinst*/
									  // Outputs
									  .s_axi_awready	(m31_axi_awready), // Templated
									  .s_axi_wready		(m31_axi_wready), // Templated
									  .s_axi_bid		(m31_axi_bid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_bresp		(m31_axi_bresp[1:0]), // Templated
									  .s_axi_bvalid		(m31_axi_bvalid), // Templated
									  .s_axi_arready	(m31_axi_arready), // Templated
									  .s_axi_rid		(m31_axi_rid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_rdata		(m31_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_rresp		(m31_axi_rresp[1:0]), // Templated
									  .s_axi_rlast		(m31_axi_rlast), // Templated
									  .s_axi_rvalid		(m31_axi_rvalid), // Templated
									  // Inputs
									  .clk			(clk),
									  .rst			(rst),
									  .s_axi_awid		(m31_axi_awid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_awaddr		(m31_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_awlen		(m31_axi_awlen[7:0]), // Templated
									  .s_axi_awsize		(m31_axi_awsize[2:0]), // Templated
									  .s_axi_awburst	(m31_axi_awburst[1:0]), // Templated
									  .s_axi_awlock		(m31_axi_awlock), // Templated
									  .s_axi_awcache	(m31_axi_awcache[3:0]), // Templated
									  .s_axi_awprot		(m31_axi_awprot[2:0]), // Templated
									  .s_axi_awvalid	(m31_axi_awvalid), // Templated
									  .s_axi_wdata		(m31_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
									  .s_axi_wstrb		(m31_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
									  .s_axi_wlast		(m31_axi_wlast), // Templated
									  .s_axi_wvalid		(m31_axi_wvalid), // Templated
									  .s_axi_bready		(m31_axi_bready), // Templated
									  .s_axi_arid		(m31_axi_arid[M_ID_WIDTH-1:0]), // Templated
									  .s_axi_araddr		(m31_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
									  .s_axi_arlen		(m31_axi_arlen[7:0]), // Templated
									  .s_axi_arsize		(m31_axi_arsize[2:0]), // Templated
									  .s_axi_arburst	(m31_axi_arburst[1:0]), // Templated
									  .s_axi_arlock		(m31_axi_arlock), // Templated
									  .s_axi_arcache	(m31_axi_arcache[3:0]), // Templated
									  .s_axi_arprot		(m31_axi_arprot[2:0]), // Templated
									  .s_axi_arvalid	(m31_axi_arvalid), // Templated
									  .s_axi_rready		(m31_axi_rready)); // Templated


endmodule

// Local Variables:
// verilog-auto-inst-param-value:t
// End:


