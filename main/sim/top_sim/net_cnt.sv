module net_cnt (  /*AUTOARG*/
   // Outputs
   m_net_axis_tdata, m_net_axis_tdest, m_net_axis_tid,
   m_net_axis_tkeep, m_net_axis_tlast, m_net_axis_tuser,
   m_net_axis_tvalid, net_tx_rdy,
   // Inputs
   m_net_axis_tready, net_data_in, net_valid_in, net_data_tkeep,
   net_data_tlast, net_data_tuser
   );

  // Width of AXI data bus in bits
  parameter AXI_DATA_WIDTH = 512;
  // Width of AXI address bus in bits
  parameter AXI_ADDR_WIDTH = 64;  //4g 32 ;  8g 33 ;  16g  34 ;  32g 35;  64g  36 
  // Width of AXI wstrb (width of data bus in words)
  parameter AXI_STRB_WIDTH = (AXI_DATA_WIDTH / 8);
  // Width of AXI ID signal
  parameter AXI_ID_WIDTH = 7;
  // Maximum AXI burst length to generate
  parameter AXI_MAX_BURST_LEN = 16;
  // Width of AXI stream interfaces in bits
  parameter AXIS_DATA_WIDTH = AXI_DATA_WIDTH;
  // Use AXI stream tkeep signal
  parameter AXIS_KEEP_ENABLE = (AXIS_DATA_WIDTH > 8);
  // AXI stream tkeep signal width (words per cycle)
  parameter AXIS_KEEP_WIDTH = (AXIS_DATA_WIDTH / 8);
  // Use AXI stream tlast signal
  parameter AXIS_LAST_ENABLE = 1;
  // Propagate AXI stream tid signal
  parameter AXIS_ID_ENABLE = 0;
  // AXI stream tid signal width
  parameter AXIS_ID_WIDTH = 7;
  // Propagate AXI stream tdest signal
  parameter AXIS_DEST_ENABLE = 0;
  // AXI stream tdest signal width
  parameter AXIS_DEST_WIDTH = 8;
  // Propagate AXI stream tuser signal
  parameter AXIS_USER_ENABLE = 1;
  // AXI stream tuser signal width
  parameter AXIS_USER_WIDTH = 8;
  // Width of length field
  parameter LEN_WIDTH = 20;
  // Width of tag field
  parameter TAG_WIDTH = 8;
  // Enable support for scatter/gather DMA
  // (multiple descriptors per AXI stream frame)
  parameter ENABLE_SG = 0;
  // Enable support for unaligned transfers
  parameter ENABLE_UNALIGNED = 0;

  parameter ROWS = 32;
  parameter INPUT_LENGTH = 16;

  output [AXIS_DATA_WIDTH-1:0] m_net_axis_tdata;  // To u_top of top.v
  output [AXIS_DEST_WIDTH-1:0] m_net_axis_tdest;  // To u_top of top.v
  output [AXIS_ID_WIDTH-1:0] m_net_axis_tid;  // To u_top of top.v
  output [AXIS_KEEP_WIDTH-1:0] m_net_axis_tkeep;  // To u_top of top.v
  output m_net_axis_tlast;  // To u_top of top.v
  output [AXIS_USER_WIDTH-1:0] m_net_axis_tuser;  // To u_top of top.v
  output m_net_axis_tvalid;  // To u_top of top.v
  output net_tx_rdy;  // To u_top of top.v


  input m_net_axis_tready;  // From u_top of top.v
  input [(ROWS*INPUT_LENGTH)-1:0] net_data_in;  // From u_top of top.v
  input net_valid_in;  // From u_top of top.v
  input     [AXIS_KEEP_WIDTH-1:0] net_data_tkeep;
  input                           net_data_tlast;
  input     [AXIS_USER_WIDTH-1:0]    net_data_tuser;

  //wire [AXIS_DATA_WIDTH-1:0] m_net_axis_tdata = 'd0;  // To u_top of top.v
  //wire [AXIS_DEST_WIDTH-1:0] m_net_axis_tdest = 'hbf;  // To u_top of top.v
  //wire [  AXIS_ID_WIDTH-1:0] m_net_axis_tid = 'd0;  // To u_top of top.v
  //wire [AXIS_KEEP_WIDTH-1:0] m_net_axis_tkeep = 'd0;  // To u_top of top.v
  //wire                       m_net_axis_tlast = 'd0;  // To u_top of top.v
  //wire [AXIS_USER_WIDTH-1:0] m_net_axis_tuser = 'd0;  // To u_top of top.v
  //wire                       m_net_axis_tvalid = 'd0;  // To u_top of top.v
  //wire                       net_tx_rdy = 'd1;  // To u_top of top.v

  wire [AXIS_DATA_WIDTH-1:0] m_net_axis_tdata  = net_data_in;  // To u_top of top.v
  wire [AXIS_DEST_WIDTH-1:0] m_net_axis_tdest  = 'hbf;  // To u_top of top.v
  wire [  AXIS_ID_WIDTH-1:0] m_net_axis_tid    = 'd0;  // To u_top of top.v
  wire [AXIS_KEEP_WIDTH-1:0] m_net_axis_tkeep  = net_data_tkeep;  // To u_top of top.v
  wire                       m_net_axis_tlast  = net_data_tlast;  // To u_top of top.v
  wire [AXIS_USER_WIDTH-1:0] m_net_axis_tuser  = 'd0;  // To u_top of top.v
  wire                       m_net_axis_tvalid = net_valid_in     ;  // To u_top of top.v
  wire                       net_tx_rdy        = m_net_axis_tready;  // To u_top of top.v



endmodule
