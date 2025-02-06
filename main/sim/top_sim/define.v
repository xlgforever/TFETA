
`define ASSIGN_SLAVE(upstream, s_axi) \
  assign     ``upstream``.aw_id    =   ``s_axi``_awid      ;  \
  assign     ``upstream``.aw_addr  =   ``s_axi``_awaddr    ;  \
  assign     ``upstream``.aw_len   =   ``s_axi``_awlen     ;  \
  assign     ``upstream``.aw_size  =   ``s_axi``_awsize    ;  \
  assign     ``upstream``.aw_burst =   ``s_axi``_awburst   ;  \
  assign     ``upstream``.aw_lock  =   ``s_axi``_awlock    ;  \
  assign     ``upstream``.aw_cache =   ``s_axi``_awcache   ;  \
  assign     ``upstream``.aw_prot  =   ``s_axi``_awprot    ;  \
  assign     ``upstream``.aw_qos   =   'd0  ;  \
  assign     ``upstream``.aw_region=   'd0  ;  \
  assign     ``upstream``.aw_atop  =   'd0  ;  \
  assign     ``upstream``.aw_user  =   'd0  ;  \
  assign     ``upstream``.aw_valid =   ``s_axi``_awvalid     ;  \
  assign     ``s_axi``_awready     =   ``upstream``.aw_ready ;  \
  assign     ``upstream``.w_data   =   ``s_axi``_wdata ;  \
  assign     ``upstream``.w_strb   =   ``s_axi``_wstrb ;  \
  assign     ``upstream``.w_last   =   ``s_axi``_wlast ;  \
  assign     ``upstream``.w_user   =   'd0         ;  \
  assign     ``upstream``.w_valid  =   ``s_axi``_wvalid;  \
  assign     ``s_axi``_wready      =   ``upstream``.w_ready ;  \
  assign     ``s_axi``_bid         =   ``upstream``.b_id    ;  \
  assign     ``s_axi``_bresp       =   ``upstream``.b_resp  ;  \
  assign     ``s_axi``_bvalid      =   ``upstream``.b_valid ;  \
  assign     ``upstream``.b_ready  =   ``s_axi``_bready ;  \
  assign     ``upstream``.ar_id      =    ``s_axi``_arid      ;  \
  assign     ``upstream``.ar_addr    =    ``s_axi``_araddr    ;  \
  assign     ``upstream``.ar_len     =    ``s_axi``_arlen     ;  \
  assign     ``upstream``.ar_size    =    ``s_axi``_arsize    ;  \
  assign     ``upstream``.ar_burst   =    ``s_axi``_arburst   ;  \
  assign     ``upstream``.ar_lock    =    ``s_axi``_arlock    ;  \
  assign     ``upstream``.ar_cache   =    ``s_axi``_arcache   ;  \
  assign     ``upstream``.ar_prot    =    ``s_axi``_arprot    ;  \
  assign     ``upstream``.ar_qos     =    'd0    ;  \
  assign     ``upstream``.ar_region  =    'd0    ;  \
  assign     ``upstream``.ar_user    =    'd0    ;  \
  assign     ``upstream``.ar_valid   =    ``s_axi``_arvalid     ;  \
  assign     ``s_axi``_arready       =    ``upstream``.ar_ready ;  \
  assign     ``s_axi``_rid           =    ``upstream``.r_id     ;  \
  assign     ``s_axi``_rdata         =    ``upstream``.r_data   ;  \
  assign     ``s_axi``_rresp         =    ``upstream``.r_resp   ;  \
  assign     ``s_axi``_rlast         =    ``upstream``.r_last   ;  \
  assign     ``s_axi``_rvalid        =    ``upstream``.r_valid  ;  \
  assign     ``upstream``.r_ready    =    ``s_axi``_rready      ;  




`define ASSIGN_MASTER(downstream, m_axi) \
  assign     ``m_axi``_awid       = ``downstream``.aw_id     ;  \
  assign     ``m_axi``_awaddr     = ``downstream``.aw_addr   ;  \
  assign     ``m_axi``_awlen      = ``downstream``.aw_len    ;  \
  assign     ``m_axi``_awsize     = ``downstream``.aw_size   ;  \
  assign     ``m_axi``_awburst    = ``downstream``.aw_burst  ;  \
  assign     ``m_axi``_awlock     = ``downstream``.aw_lock   ;  \
  assign     ``m_axi``_awcache    = ``downstream``.aw_cache  ;  \
  assign     ``m_axi``_awprot     = ``downstream``.aw_prot   ;  \
  assign     ``m_axi``_awvalid     =   ``downstream``.aw_valid ;  \
  assign     ``downstream``.aw_ready = ``m_axi``_awready       ;  \
  assign     ``m_axi``_wdata      = ``downstream``.w_data      ;  \
  assign     ``m_axi``_wstrb      = ``downstream``.w_strb      ;  \
  assign     ``m_axi``_wlast      = ``downstream``.w_last      ;  \
  assign     ``m_axi``_wvalid     = ``downstream``.w_valid     ;  \
  assign     ``downstream``.w_ready = ``m_axi``_wready         ;  \
  assign     ``downstream``.b_id     =  ``m_axi``_bid          ;  \
  assign     ``downstream``.b_resp   =  ``m_axi``_bresp        ;  \
  assign     ``downstream``.b_user   =  'd0                ;  \
  assign     ``downstream``.b_valid  =  ``m_axi``_bvalid       ;  \
  assign     ``m_axi``_bready        =  ``downstream``.b_ready ;  \
  assign     ``m_axi``_arid          =  ``downstream``.ar_id      ;  \
  assign     ``m_axi``_araddr        =  ``downstream``.ar_addr    ;  \
  assign     ``m_axi``_arlen         =  ``downstream``.ar_len     ;  \
  assign     ``m_axi``_arsize        =  ``downstream``.ar_size    ;  \
  assign     ``m_axi``_arburst       =  ``downstream``.ar_burst   ;  \
  assign     ``m_axi``_arlock        =  ``downstream``.ar_lock    ;  \
  assign     ``m_axi``_arcache       =  ``downstream``.ar_cache   ;  \
  assign     ``m_axi``_arprot        =  ``downstream``.ar_prot    ;  \
  assign     ``m_axi``_arvalid       =    ``downstream``.ar_valid ;  \
  assign     ``downstream``.ar_ready =    ``m_axi``_arready       ;  \
  assign     ``downstream``.r_id     =    ``m_axi``_rid           ;  \
  assign     ``downstream``.r_data   =    ``m_axi``_rdata         ;  \
  assign     ``downstream``.r_resp   =    ``m_axi``_rresp         ;  \
  assign     ``downstream``.r_last   =    ``m_axi``_rlast         ;  \
  assign     ``downstream``.r_user   =    'd0                 ;  \
  assign     ``downstream``.r_valid  =    ``m_axi``_rvalid        ;  \
  assign     ``m_axi``_rready        =    ``downstream``.r_ready  ;  


`define ASSIGN_MASTER_WIRE(downstream, m_axi) \
  assign     ``m_axi``_awid       = ``downstream``_awid     ;  \
  assign     ``m_axi``_awaddr     = ``downstream``_awaddr   ;  \
  assign     ``m_axi``_awlen      = ``downstream``_awlen    ;  \
  assign     ``m_axi``_awsize     = ``downstream``_awsize   ;  \
  assign     ``m_axi``_awburst    = ``downstream``_awburst  ;  \
  assign     ``m_axi``_awlock     = ``downstream``_awlock   ;  \
  assign     ``m_axi``_awcache    = ``downstream``_awcache  ;  \
  assign     ``m_axi``_awprot     = ``downstream``_awprot   ;  \
  assign     ``m_axi``_awvalid     =   ``downstream``_awvalid ;  \
  assign     ``downstream``_awready = ``m_axi``_awready       ;  \
  assign     ``m_axi``_wdata      = ``downstream``_wdata      ;  \
  assign     ``m_axi``_wstrb      = ``downstream``_wstrb      ;  \
  assign     ``m_axi``_wlast      = ``downstream``_wlast      ;  \
  assign     ``m_axi``_wvalid     = ``downstream``_wvalid     ;  \
  assign     ``downstream``_w_ready = ``m_axi``_wready         ;  \
  assign     ``downstream``_bid     =  ``m_axi``_bid          ;  \
  assign     ``downstream``_bresp   =  ``m_axi``_bresp        ;  \
  assign     ``downstream``_buser   =  'd0                ;  \
  assign     ``downstream``_bvalid  =  ``m_axi``_bvalid       ;  \
  assign     ``m_axi``_bready        =  ``downstream``_bready ;  \
  assign     ``m_axi``_arid          =  ``downstream``_arid      ;  \
  assign     ``m_axi``_araddr        =  ``downstream``_araddr    ;  \
  assign     ``m_axi``_arlen         =  ``downstream``_arlen     ;  \
  assign     ``m_axi``_arsize        =  ``downstream``_arsize    ;  \
  assign     ``m_axi``_arburst       =  ``downstream``_arburst   ;  \
  assign     ``m_axi``_arlock        =  ``downstream``_arlock    ;  \
  assign     ``m_axi``_arcache       =  ``downstream``_arcache   ;  \
  assign     ``m_axi``_arprot        =  ``downstream``_arprot    ;  \
  assign     ``m_axi``_arvalid       =    ``downstream``_arvalid ;  \
  assign     ``downstream``_arready =    ``m_axi``_arready       ;  \
  assign     ``downstream``_rid     =    ``m_axi``_rid           ;  \
  assign     ``downstream``_rdata   =    ``m_axi``_rdata         ;  \
  assign     ``downstream``_rresp   =    ``m_axi``_rresp         ;  \
  assign     ``downstream``_rlast   =    ``m_axi``_rlast         ;  \
  assign     ``downstream``_ruser   =    'd0                 ;  \
  assign     ``downstream``_rvalid  =    ``m_axi``_rvalid        ;  \
  assign     ``m_axi``_rready        =    ``downstream``_rready  ;  





`define ASSIGN_AXIS_SLAVE(upstream, index, s_axi) \
  assign     ``upstream``_tdata``index`` =   ``s_axi``_tdata     ;  \
  assign     ``upstream``_tdest``index``  =   ``s_axi``_tdest     ;  \
  assign     ``upstream``_tid``index``    =   ``s_axi``_tid       ;  \
  assign     ``upstream``_tkeep``index``  =   ``s_axi``_tkeep     ;  \
  assign     ``upstream``_tlast``index``  =   ``s_axi``_tlast     ;  \
  assign     ``upstream``_tuser``index``  =   ``s_axi``_tuser     ;  \
  assign     ``upstream``_tvalid``index`` =   ``s_axi``_tvalid    ;  \
  assign     ``s_axi``_tready            =   ``upstream``_tready``index`` ;  



`define ASSIGN_AXIS_MASTER(downstream, index, m_axis) \
  assign     ``m_axis``_tdata     = ``downstream``_tdata``index``   ;  \
  assign     ``m_axis``_tdest     = ``downstream``_tdest``index``   ;  \
  assign     ``m_axis``_tid       = ``downstream``_tid``index``     ;  \
  assign     ``m_axis``_tkeep     = ``downstream``_tkeep``index``   ;  \
  assign     ``m_axis``_tlast     = ``downstream``_tlast``index``   ;  \
  assign     ``m_axis``_tuser     = ``downstream``_tuser``index``   ;  \
  assign     ``m_axis``_tvalid    = ``downstream``_tvalid``index``  ;  \
  assign     ``downstream``_tready``index`` = ``m_axis``_tready     ;  


