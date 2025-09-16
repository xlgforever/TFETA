// matlab
// OpenTF/main/Code/mac/model/matlab/systolic_array

`include "define.sv"

module tb (  /*AUTOARG*/
   // Outputs
   params_qsfp1_loopback_in, params_qsfp0_loopback_in, params_mac_rst,
   params_irq_ro, params_core_sync,
   // Inputs
   params_core_sync1_ro, params_core_sync0_ro
   );
  ////////////////////////////////////////////////////////////////////////////

   parameter  GADDR_BITS = 10 ;
   parameter  GDATA_BITS = 64 ;

  parameter int unsigned DMEM_DEPTH = 8 * 12;
  parameter int unsigned DADDR_BITS = 12;
  //parameter DELAY_CNT = 48  ;
  parameter DELAY_CNT = 2  ;

`ifdef   MULTI_CORE
  parameter int unsigned RAM_SIZE   = 256;
  parameter int unsigned WRAM_SIZE0 = 256;
  parameter int unsigned WRAM_SIZE1 = 256;
`else
  parameter int unsigned RAM_SIZE   = 512;
  parameter int unsigned WRAM_SIZE0 = 1024;
  parameter int unsigned WRAM_SIZE1 = 1024;

`endif

  //parameter int unsigned WRAM_SIZE0 = 256;
  //parameter int unsigned WRAM_SIZE1 = 256;


`ifdef MODE_32
  parameter fpga_pkg::tile_features_t TILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT1;
  parameter fpga_pkg::tile_features_t STILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT1;
`elsif MODE_64
  parameter fpga_pkg::tile_features_t TILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT4;
  parameter fpga_pkg::tile_features_t STILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT4;
`elsif MODE_16
  parameter fpga_pkg::tile_features_t TILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT5;
  parameter fpga_pkg::tile_features_t STILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT5;
`elsif MODE_64_INT8
  parameter fpga_pkg::tile_features_t TILE_FEATURES = fpga_pkg::TILE_FEATURES_INT8_64;
  parameter fpga_pkg::tile_features_t STILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT1;
`else
  parameter fpga_pkg::tile_features_t TILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT1;
  parameter fpga_pkg::tile_features_t STILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT1;
`endif



 localparam fpga_pkg::pe_features_t PE_FEATURES = TILE_FEATURES.PE_Features;
 localparam int unsigned ROWS = TILE_FEATURES.rows;
 localparam int unsigned COLUMNS = TILE_FEATURES.columns;

 //localparam  int unsigned MAX_REPEAT_CNT  =  (RAM_SIZE/ROWS)*(RAM_SIZE/ROWS)/2 -1  ;
 localparam  int unsigned MAX_REPEAT_CNT  =  0  ;
 localparam  int unsigned ADD_LATENCY     =  7 ;

 localparam int unsigned INPUT_LENGTH = fpga_pkg::data_width(PE_FEATURES.InputType);
 localparam int unsigned OUTPUT_LENGTH = fpga_pkg::data_width(PE_FEATURES.OutputType);
 localparam int unsigned ACC_LENGTH = fpga_pkg::data_width(PE_FEATURES.AccType);
 localparam int unsigned ID_WIDTH = $clog2(PE_FEATURES.MaxSimultaneousMatmuls);
 localparam fpga_pkg::data_flow_e DATA_FLOW = PE_FEATURES.DataFlow;
 localparam int unsigned MSM = PE_FEATURES.MaxSimultaneousMatmuls;

 localparam int unsigned MAC_DELAY =  TILE_FEATURES.PE_Features.MacDelay;

 localparam  int unsigned FMEM_DEPTH  =  (RAM_SIZE/ROWS)*(RAM_SIZE/ROWS) ;

 //parameter   int unsigned WMEM_DEPTH  =  (RAM_SIZE/ROWS)*(RAM_SIZE/ROWS) ;
  parameter   int unsigned WMEM_DEPTH  =  (WRAM_SIZE0/ROWS)*(WRAM_SIZE1/ROWS) ;

 localparam  int unsigned BMEM_DEPTH  =  (RAM_SIZE/ROWS)*(RAM_SIZE/ROWS) ;
 localparam  int unsigned SMEM_DEPTH  =  (RAM_SIZE/ROWS)*(RAM_SIZE/ROWS) ;
 localparam  int unsigned SMAMEM_DEPTH = (RAM_SIZE/ROWS)*(RAM_SIZE/ROWS) ;

 localparam int unsigned WADDR_BITS =  $clog2(ROWS*WMEM_DEPTH);
 localparam int unsigned FADDR_BITS =  $clog2(ROWS*FMEM_DEPTH);
 localparam int unsigned BADDR_BITS =  $clog2(ROWS*BMEM_DEPTH); 

 localparam int unsigned MADDR_BITS =  $clog2(ROWS*( MAX_REPEAT_CNT + 1));
 //localparam int unsigned SMADDR_BITS =  $clog2(ROWS*(MAX_REPEAT_CNT+1)*(MAX_REPEAT_CNT+1));
 localparam int unsigned SMADDR_BITS =  $clog2(ROWS*SMAMEM_DEPTH);

 localparam int unsigned SADDR_BITS =  $clog2(ROWS*SMEM_DEPTH);


   parameter 			NUM_CH = ROWS;

///////////////////////////////////
 localparam fpga_pkg::pe_features_t SPE_FEATURES = STILE_FEATURES.PE_Features;
 localparam int unsigned SROWS = STILE_FEATURES.rows;
 localparam int unsigned SCOLUMNS = STILE_FEATURES.columns;

 localparam int unsigned SINPUT_LENGTH = fpga_pkg::data_width(SPE_FEATURES.InputType);

   parameter                    SFU_SRAM_WIDTH = SROWS*SINPUT_LENGTH;
   parameter 			SFU_SRAM_DEPTH = 3*RAM_SIZE*RAM_SIZE*SINPUT_LENGTH/SFU_SRAM_WIDTH;
   parameter 			SFU_NUM_CH = SROWS;
   parameter 			SFU_MODE_LEN = 5;
   parameter 			SFU_SUB_LEN  = 16;


  parameter 			SFU_SRAM_DELAY  = 2; // mode==1: the read operation will be delay 1 cycle
  localparam          SFU_SRAM_ADDR_BITS =  $clog2(SFU_SRAM_DEPTH); // clog2(6144) = 13bit

  parameter 			SFU_SCALAR_DEPTH = 1024  ;
  localparam   		SCALAR_ADDR_BITS = $clog2(SFU_SCALAR_DEPTH);

  parameter 			SFU_GB_DEPTH = 128       ;
  localparam 			GB_ADDR_BITS = $clog2(SFU_GB_DEPTH);
  //localparam            WORD_SIZE = INPUT_LENGTH;
  localparam            TOKEN_SRAM_DELAY = 3;
   

	localparam LB_ELEWIDTH = SINPUT_LENGTH;
	parameter LB_DEPTH = 256;
	parameter LB_DLY = SFU_SRAM_DELAY; //
	parameter LB_CH = 24;
	localparam LB_WIDTH = LB_ELEWIDTH*SFU_NUM_CH;
    parameter LB_RAM_TYPE = "auto";

  //////////////////////////////////////////////////////////////////////////////////////////////////
  localparam S_COUNT = 8;
  localparam M_COUNT = 3;

  // Width of AXI data bus in bits
  parameter AXI_DATA_WIDTH = ROWS * INPUT_LENGTH;
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
  parameter LEN_WIDTH = 32;
  // Width of tag field
  parameter TAG_WIDTH = 8;
  // Enable support for scatter/gather DMA
  // (multiple descriptors per AXI stream frame)
  parameter ENABLE_SG = 0;
  // Enable support for unaligned transfers
  parameter ENABLE_UNALIGNED = 0;

  parameter AXI_WORD_WIDTH = AXI_STRB_WIDTH;
  parameter AXI_WORD_SIZE = AXI_DATA_WIDTH / AXI_WORD_WIDTH;
  parameter AXI_BURST_SIZE = $clog2(AXI_STRB_WIDTH);
  parameter AXI_MAX_BURST_SIZE = AXI_MAX_BURST_LEN << AXI_BURST_SIZE;

  parameter OFFSET_WIDTH = AXI_STRB_WIDTH > 1 ? $clog2(AXI_STRB_WIDTH) : 1;
  parameter OFFSET_MASK = AXI_STRB_WIDTH > 1 ? {OFFSET_WIDTH{1'b1}} : 0;
  parameter ADDR_MASK = {AXI_ADDR_WIDTH{1'b1}} << $clog2(AXI_STRB_WIDTH);
  parameter CYCLE_COUNT_WIDTH = LEN_WIDTH - AXI_BURST_SIZE + 1;

  parameter STATUS_FIFO_ADDR_WIDTH = 5;
  parameter OUTPUT_FIFO_ADDR_WIDTH = 5;

  // Additional bits required for response routing
  parameter M_ID_WIDTH = AXI_ID_WIDTH + $clog2(S_COUNT);

  ////////////////////////////////////////////////////////////////////////////////

  parameter PIPELINE_OUTPUT = 0;

  parameter VALID_ADDR_WIDTH = AXI_ADDR_WIDTH - $clog2(AXI_STRB_WIDTH);
  ///////////////////////////////////////////////////////////////////////////////////////



  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input [31:0]		params_core_sync0_ro;	// To u_top of top.v
  input [31:0]		params_core_sync1_ro;	// To u_top of top.v
  // End of automatics
  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output [1:0]		params_core_sync;	// From u_top of top.v
  output		params_irq_ro;		// From u_top of top.v
  output		params_mac_rst;		// From u_top of top.v
  output [11:0]		params_qsfp0_loopback_in;// From u_top of top.v
  output [11:0]		params_qsfp1_loopback_in;// From u_top of top.v
  // End of automatics
  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [31:0]		cfg_reg_addr;		// From driver of driver.v
  wire [31:0]		cfg_reg_rd_data;	// From u_top of top.v
  wire [31:0]		cfg_reg_wr_data;	// From driver of driver.v
  wire			cfg_reg_wr_en;		// From driver of driver.v
  wire			clk;			// From u_clk_gen of clk_gen.v
  wire [AXI_ADDR_WIDTH-1:0] m00_axi_araddr;	// From u_top of top.v
  wire [AXI_ADDR_WIDTH-1:0] m00_axi_araddr_reg;	// From u00_register of axi_register_dly.v
  wire [1:0]		m00_axi_arburst;	// From u_top of top.v
  wire [1:0]		m00_axi_arburst_reg;	// From u00_register of axi_register_dly.v
  wire [3:0]		m00_axi_arcache;	// From u_top of top.v
  wire [3:0]		m00_axi_arcache_reg;	// From u00_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m00_axi_arid;		// From u_top of top.v
  wire [M_ID_WIDTH-1:0]	m00_axi_arid_reg;	// From u00_register of axi_register_dly.v
  wire [7:0]		m00_axi_arlen;		// From u_top of top.v
  wire [7:0]		m00_axi_arlen_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_arlock;		// From u_top of top.v
  wire			m00_axi_arlock_reg;	// From u00_register of axi_register_dly.v
  wire [2:0]		m00_axi_arprot;		// From u_top of top.v
  wire [2:0]		m00_axi_arprot_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_arready;	// From u00_register of axi_register_dly.v
  wire			m00_axi_arready_reg;	// From u00_ram of axi_ram.v
  wire [2:0]		m00_axi_arsize;		// From u_top of top.v
  wire [2:0]		m00_axi_arsize_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_arvalid;	// From u_top of top.v
  wire			m00_axi_arvalid_reg;	// From u00_register of axi_register_dly.v
  wire [AXI_ADDR_WIDTH-1:0] m00_axi_awaddr;	// From u_top of top.v
  wire [AXI_ADDR_WIDTH-1:0] m00_axi_awaddr_reg;	// From u00_register of axi_register_dly.v
  wire [1:0]		m00_axi_awburst;	// From u_top of top.v
  wire [1:0]		m00_axi_awburst_reg;	// From u00_register of axi_register_dly.v
  wire [3:0]		m00_axi_awcache;	// From u_top of top.v
  wire [3:0]		m00_axi_awcache_reg;	// From u00_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m00_axi_awid;		// From u_top of top.v
  wire [M_ID_WIDTH-1:0]	m00_axi_awid_reg;	// From u00_register of axi_register_dly.v
  wire [7:0]		m00_axi_awlen;		// From u_top of top.v
  wire [7:0]		m00_axi_awlen_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_awlock;		// From u_top of top.v
  wire			m00_axi_awlock_reg;	// From u00_register of axi_register_dly.v
  wire [2:0]		m00_axi_awprot;		// From u_top of top.v
  wire [2:0]		m00_axi_awprot_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_awready;	// From u00_register of axi_register_dly.v
  wire			m00_axi_awready_reg;	// From u00_ram of axi_ram.v
  wire [2:0]		m00_axi_awsize;		// From u_top of top.v
  wire [2:0]		m00_axi_awsize_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_awvalid;	// From u_top of top.v
  wire			m00_axi_awvalid_reg;	// From u00_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m00_axi_bid;		// From u00_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m00_axi_bid_reg;	// From u00_ram of axi_ram.v
  wire			m00_axi_bready;		// From u_top of top.v
  wire			m00_axi_bready_reg;	// From u00_register of axi_register_dly.v
  wire [1:0]		m00_axi_bresp;		// From u00_register of axi_register_dly.v
  wire [1:0]		m00_axi_bresp_reg;	// From u00_ram of axi_ram.v
  wire			m00_axi_bvalid;		// From u00_register of axi_register_dly.v
  wire			m00_axi_bvalid_reg;	// From u00_ram of axi_ram.v
  wire [AXI_DATA_WIDTH-1:0] m00_axi_rdata;	// From u00_register of axi_register_dly.v
  wire [AXI_DATA_WIDTH-1:0] m00_axi_rdata_reg;	// From u00_ram of axi_ram.v
  wire [M_ID_WIDTH-1:0]	m00_axi_rid;		// From u00_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m00_axi_rid_reg;	// From u00_ram of axi_ram.v
  wire			m00_axi_rlast;		// From u00_register of axi_register_dly.v
  wire			m00_axi_rlast_reg;	// From u00_ram of axi_ram.v
  wire			m00_axi_rready;		// From u_top of top.v
  wire			m00_axi_rready_reg;	// From u00_register of axi_register_dly.v
  wire [1:0]		m00_axi_rresp;		// From u00_register of axi_register_dly.v
  wire [1:0]		m00_axi_rresp_reg;	// From u00_ram of axi_ram.v
  wire			m00_axi_rvalid;		// From u00_register of axi_register_dly.v
  wire			m00_axi_rvalid_reg;	// From u00_ram of axi_ram.v
  wire [AXI_DATA_WIDTH-1:0] m00_axi_wdata;	// From u_top of top.v
  wire [AXI_DATA_WIDTH-1:0] m00_axi_wdata_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_wlast;		// From u_top of top.v
  wire			m00_axi_wlast_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_wready;		// From u00_register of axi_register_dly.v
  wire			m00_axi_wready_reg;	// From u00_ram of axi_ram.v
  wire [AXI_STRB_WIDTH-1:0] m00_axi_wstrb;	// From u_top of top.v
  wire [AXI_STRB_WIDTH-1:0] m00_axi_wstrb_reg;	// From u00_register of axi_register_dly.v
  wire			m00_axi_wvalid;		// From u_top of top.v
  wire			m00_axi_wvalid_reg;	// From u00_register of axi_register_dly.v
  wire [AXI_ADDR_WIDTH-1:0] m01_axi_araddr;	// From u_top of top.v
  wire [1:0]		m01_axi_arburst;	// From u_top of top.v
  wire [1:0]		m01_axi_arburst_reg;	// From u01_register of axi_register_dly.v
  wire [3:0]		m01_axi_arcache;	// From u_top of top.v
  wire [3:0]		m01_axi_arcache_reg;	// From u01_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m01_axi_arid;		// From u_top of top.v
  wire [M_ID_WIDTH-1:0]	m01_axi_arid_reg;	// From u01_register of axi_register_dly.v
  wire [7:0]		m01_axi_arlen;		// From u_top of top.v
  wire [7:0]		m01_axi_arlen_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_arlock;		// From u_top of top.v
  wire			m01_axi_arlock_reg;	// From u01_register of axi_register_dly.v
  wire [2:0]		m01_axi_arprot;		// From u_top of top.v
  wire [2:0]		m01_axi_arprot_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_arready;	// From u01_register of axi_register_dly.v
  wire			m01_axi_arready_reg;	// From u01_ram of axi_ram.v
  wire [2:0]		m01_axi_arsize;		// From u_top of top.v
  wire [2:0]		m01_axi_arsize_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_arvalid;	// From u_top of top.v
  wire			m01_axi_arvalid_reg;	// From u01_register of axi_register_dly.v
  wire [AXI_ADDR_WIDTH-1:0] m01_axi_awaddr;	// From u_top of top.v
  wire [1:0]		m01_axi_awburst;	// From u_top of top.v
  wire [1:0]		m01_axi_awburst_reg;	// From u01_register of axi_register_dly.v
  wire [3:0]		m01_axi_awcache;	// From u_top of top.v
  wire [3:0]		m01_axi_awcache_reg;	// From u01_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m01_axi_awid;		// From u_top of top.v
  wire [M_ID_WIDTH-1:0]	m01_axi_awid_reg;	// From u01_register of axi_register_dly.v
  wire [7:0]		m01_axi_awlen;		// From u_top of top.v
  wire [7:0]		m01_axi_awlen_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_awlock;		// From u_top of top.v
  wire			m01_axi_awlock_reg;	// From u01_register of axi_register_dly.v
  wire [2:0]		m01_axi_awprot;		// From u_top of top.v
  wire [2:0]		m01_axi_awprot_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_awready;	// From u01_register of axi_register_dly.v
  wire			m01_axi_awready_reg;	// From u01_ram of axi_ram.v
  wire [2:0]		m01_axi_awsize;		// From u_top of top.v
  wire [2:0]		m01_axi_awsize_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_awvalid;	// From u_top of top.v
  wire			m01_axi_awvalid_reg;	// From u01_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m01_axi_bid;		// From u01_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m01_axi_bid_reg;	// From u01_ram of axi_ram.v
  wire			m01_axi_bready;		// From u_top of top.v
  wire			m01_axi_bready_reg;	// From u01_register of axi_register_dly.v
  wire [1:0]		m01_axi_bresp;		// From u01_register of axi_register_dly.v
  wire [1:0]		m01_axi_bresp_reg;	// From u01_ram of axi_ram.v
  wire			m01_axi_bvalid;		// From u01_register of axi_register_dly.v
  wire			m01_axi_bvalid_reg;	// From u01_ram of axi_ram.v
  wire [AXI_DATA_WIDTH-1:0] m01_axi_rdata;	// From u01_register of axi_register_dly.v
  wire [AXI_DATA_WIDTH-1:0] m01_axi_rdata_reg;	// From u01_ram of axi_ram.v
  wire [M_ID_WIDTH-1:0]	m01_axi_rid;		// From u01_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m01_axi_rid_reg;	// From u01_ram of axi_ram.v
  wire			m01_axi_rlast;		// From u01_register of axi_register_dly.v
  wire			m01_axi_rlast_reg;	// From u01_ram of axi_ram.v
  wire			m01_axi_rready;		// From u_top of top.v
  wire			m01_axi_rready_reg;	// From u01_register of axi_register_dly.v
  wire [1:0]		m01_axi_rresp;		// From u01_register of axi_register_dly.v
  wire [1:0]		m01_axi_rresp_reg;	// From u01_ram of axi_ram.v
  wire			m01_axi_rvalid;		// From u01_register of axi_register_dly.v
  wire			m01_axi_rvalid_reg;	// From u01_ram of axi_ram.v
  wire [AXI_DATA_WIDTH-1:0] m01_axi_wdata;	// From u_top of top.v
  wire [AXI_DATA_WIDTH-1:0] m01_axi_wdata_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_wlast;		// From u_top of top.v
  wire			m01_axi_wlast_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_wready;		// From u01_register of axi_register_dly.v
  wire			m01_axi_wready_reg;	// From u01_ram of axi_ram.v
  wire [AXI_STRB_WIDTH-1:0] m01_axi_wstrb;	// From u_top of top.v
  wire [AXI_STRB_WIDTH-1:0] m01_axi_wstrb_reg;	// From u01_register of axi_register_dly.v
  wire			m01_axi_wvalid;		// From u_top of top.v
  wire			m01_axi_wvalid_reg;	// From u01_register of axi_register_dly.v
  wire [AXI_ADDR_WIDTH-1:0] m02_axi_araddr;	// From u_top of top.v
  wire [1:0]		m02_axi_arburst;	// From u_top of top.v
  wire [1:0]		m02_axi_arburst_reg;	// From u02_register of axi_register_dly.v
  wire [3:0]		m02_axi_arcache;	// From u_top of top.v
  wire [3:0]		m02_axi_arcache_reg;	// From u02_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m02_axi_arid;		// From u_top of top.v
  wire [M_ID_WIDTH-1:0]	m02_axi_arid_reg;	// From u02_register of axi_register_dly.v
  wire [7:0]		m02_axi_arlen;		// From u_top of top.v
  wire [7:0]		m02_axi_arlen_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_arlock;		// From u_top of top.v
  wire			m02_axi_arlock_reg;	// From u02_register of axi_register_dly.v
  wire [2:0]		m02_axi_arprot;		// From u_top of top.v
  wire [2:0]		m02_axi_arprot_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_arready;	// From u02_register of axi_register_dly.v
  wire			m02_axi_arready_reg;	// From u02_ram of axi_ram.v
  wire [2:0]		m02_axi_arsize;		// From u_top of top.v
  wire [2:0]		m02_axi_arsize_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_arvalid;	// From u_top of top.v
  wire			m02_axi_arvalid_reg;	// From u02_register of axi_register_dly.v
  wire [AXI_ADDR_WIDTH-1:0] m02_axi_awaddr;	// From u_top of top.v
  wire [1:0]		m02_axi_awburst;	// From u_top of top.v
  wire [1:0]		m02_axi_awburst_reg;	// From u02_register of axi_register_dly.v
  wire [3:0]		m02_axi_awcache;	// From u_top of top.v
  wire [3:0]		m02_axi_awcache_reg;	// From u02_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m02_axi_awid;		// From u_top of top.v
  wire [M_ID_WIDTH-1:0]	m02_axi_awid_reg;	// From u02_register of axi_register_dly.v
  wire [7:0]		m02_axi_awlen;		// From u_top of top.v
  wire [7:0]		m02_axi_awlen_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_awlock;		// From u_top of top.v
  wire			m02_axi_awlock_reg;	// From u02_register of axi_register_dly.v
  wire [2:0]		m02_axi_awprot;		// From u_top of top.v
  wire [2:0]		m02_axi_awprot_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_awready;	// From u02_register of axi_register_dly.v
  wire			m02_axi_awready_reg;	// From u02_ram of axi_ram.v
  wire [2:0]		m02_axi_awsize;		// From u_top of top.v
  wire [2:0]		m02_axi_awsize_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_awvalid;	// From u_top of top.v
  wire			m02_axi_awvalid_reg;	// From u02_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m02_axi_bid;		// From u02_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m02_axi_bid_reg;	// From u02_ram of axi_ram.v
  wire			m02_axi_bready;		// From u_top of top.v
  wire			m02_axi_bready_reg;	// From u02_register of axi_register_dly.v
  wire [1:0]		m02_axi_bresp;		// From u02_register of axi_register_dly.v
  wire [1:0]		m02_axi_bresp_reg;	// From u02_ram of axi_ram.v
  wire			m02_axi_bvalid;		// From u02_register of axi_register_dly.v
  wire			m02_axi_bvalid_reg;	// From u02_ram of axi_ram.v
  wire [AXI_DATA_WIDTH-1:0] m02_axi_rdata;	// From u02_register of axi_register_dly.v
  wire [AXI_DATA_WIDTH-1:0] m02_axi_rdata_reg;	// From u02_ram of axi_ram.v
  wire [M_ID_WIDTH-1:0]	m02_axi_rid;		// From u02_register of axi_register_dly.v
  wire [M_ID_WIDTH-1:0]	m02_axi_rid_reg;	// From u02_ram of axi_ram.v
  wire			m02_axi_rlast;		// From u02_register of axi_register_dly.v
  wire			m02_axi_rlast_reg;	// From u02_ram of axi_ram.v
  wire			m02_axi_rready;		// From u_top of top.v
  wire			m02_axi_rready_reg;	// From u02_register of axi_register_dly.v
  wire [1:0]		m02_axi_rresp;		// From u02_register of axi_register_dly.v
  wire [1:0]		m02_axi_rresp_reg;	// From u02_ram of axi_ram.v
  wire			m02_axi_rvalid;		// From u02_register of axi_register_dly.v
  wire			m02_axi_rvalid_reg;	// From u02_ram of axi_ram.v
  wire [AXI_DATA_WIDTH-1:0] m02_axi_wdata;	// From u_top of top.v
  wire [AXI_DATA_WIDTH-1:0] m02_axi_wdata_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_wlast;		// From u_top of top.v
  wire			m02_axi_wlast_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_wready;		// From u02_register of axi_register_dly.v
  wire			m02_axi_wready_reg;	// From u02_ram of axi_ram.v
  wire [AXI_STRB_WIDTH-1:0] m02_axi_wstrb;	// From u_top of top.v
  wire [AXI_STRB_WIDTH-1:0] m02_axi_wstrb_reg;	// From u02_register of axi_register_dly.v
  wire			m02_axi_wvalid;		// From u_top of top.v
  wire			m02_axi_wvalid_reg;	// From u02_register of axi_register_dly.v
  wire [7:0]		params_step_num;	// From u_top of top.v
  wire [511:0]		qsfp0_mac_tx_axis_tdata;// From u_top of top.v
  wire [63:0]		qsfp0_mac_tx_axis_tkeep;// From u_top of top.v
  wire			qsfp0_mac_tx_axis_tlast;// From u_top of top.v
  wire			qsfp0_mac_tx_axis_tready;// From u_cmac_model of cmac_model.v
  wire [7:0]		qsfp0_mac_tx_axis_tuser;// From u_top of top.v
  wire			qsfp0_mac_tx_axis_tvalid;// From u_top of top.v
  wire [511:0]		qsfp0_rx_axis_tdata_int;// From u_cmac_model of cmac_model.v
  wire [63:0]		qsfp0_rx_axis_tkeep_int;// From u_cmac_model of cmac_model.v
  wire			qsfp0_rx_axis_tlast_int;// From u_cmac_model of cmac_model.v
  wire			qsfp0_rx_axis_tuser_int;// From u_cmac_model of cmac_model.v
  wire			qsfp0_rx_axis_tvalid_int;// From u_cmac_model of cmac_model.v
  wire			qsfp0_rx_clk_int;	// From u_cmac_model of cmac_model.v
  wire			qsfp0_rx_rst_int;	// From u_cmac_model of cmac_model.v
  wire			qsfp0_tx_clk_int;	// From u_cmac_model of cmac_model.v
  wire			qsfp0_tx_rst_int;	// From u_cmac_model of cmac_model.v
  wire [511:0]		qsfp1_mac_tx_axis_tdata;// From u_top of top.v
  wire [63:0]		qsfp1_mac_tx_axis_tkeep;// From u_top of top.v
  wire			qsfp1_mac_tx_axis_tlast;// From u_top of top.v
  wire			qsfp1_mac_tx_axis_tready;// From u_cmac_model of cmac_model.v
  wire [7:0]		qsfp1_mac_tx_axis_tuser;// From u_top of top.v
  wire			qsfp1_mac_tx_axis_tvalid;// From u_top of top.v
  wire [511:0]		qsfp1_rx_axis_tdata_int;// From u_cmac_model of cmac_model.v
  wire [63:0]		qsfp1_rx_axis_tkeep_int;// From u_cmac_model of cmac_model.v
  wire			qsfp1_rx_axis_tlast_int;// From u_cmac_model of cmac_model.v
  wire			qsfp1_rx_axis_tuser_int;// From u_cmac_model of cmac_model.v
  wire			qsfp1_rx_axis_tvalid_int;// From u_cmac_model of cmac_model.v
  wire			qsfp1_rx_clk_int;	// From u_cmac_model of cmac_model.v
  wire			qsfp1_rx_rst_int;	// From u_cmac_model of cmac_model.v
  wire			qsfp1_tx_clk_int;	// From u_cmac_model of cmac_model.v
  wire			qsfp1_tx_rst_int;	// From u_cmac_model of cmac_model.v
  wire			rst;			// From u_rst_gen of rst_gen.v
  wire			uart_rxd_i;		// From u_uart_model of uart_model.v
  wire			uart_txd_o;		// From u_top of top.v
  // End of automatics


  wire [AXI_ADDR_WIDTH-1:0] m01_axi_araddr_reg;  // From u_top of top.v
  wire [AXI_ADDR_WIDTH-1:0] m01_axi_awaddr_reg;  // From u_top of top.v
  wire [AXI_ADDR_WIDTH-1:0] m02_axi_araddr_reg;  // From u_top of top.v
  wire [AXI_ADDR_WIDTH-1:0] m02_axi_awaddr_reg;  // From u_top of top.v

/* rst_gen AUTO_TEMPLATE (
  .rst_p(rst),
  .rst_n(),             
 );
*/

/* axi_ram  AUTO_TEMPLATE "\([0-9]+\)"  (
	.s_axi_\(.*\) 		(m@_axi_\1_reg[]),
 );
*/

/* top  AUTO_TEMPLATE "\([0-9]+\)"  (
	.s_pcie_\(.*\) 		(),
 );
*/

/* axi_register_dly  AUTO_TEMPLATE "\([0-9]+\)"  (
	.s_axi_\(.*\) 		(m@_axi_\1[]),
	.m_axi_\(.*\) 		(m@_axi_\1_reg[]),
        .s_axi_arqos    ('d0), 
        .s_axi_arregion ('d0), 
        .s_axi_aruser   ('d0), 
        .s_axi_awqos    ('d0), 
        .s_axi_awregion ('d0), 
        .s_axi_awuser   ('d0), 
        .m_axi_buser    ('d0), 
        .m_axi_ruser    ('d0), 
        .s_axi_wuser    ('d0), 

        .m_axi_arqos(),    
        .m_axi_arregion(), 
        .m_axi_aruser(),   
        .m_axi_awqos(),    
        .m_axi_awregion(), 
        .m_axi_awuser(),   
        .s_axi_buser(),        
        .s_axi_ruser(),        
        .m_axi_wuser(),    

  );
*/



  top #(
      /*AUTOINSTPARAM*/
	// Parameters
	.GADDR_BITS			(GADDR_BITS),
	.GDATA_BITS			(GDATA_BITS),
	.DELAY_CNT			(DELAY_CNT),
	.DMEM_DEPTH			(DMEM_DEPTH),
	.DADDR_BITS			(DADDR_BITS),
	.RAM_SIZE			(RAM_SIZE),
	.WRAM_SIZE0			(WRAM_SIZE0),
	.WRAM_SIZE1			(WRAM_SIZE1),
//	.fpga_pkg::tile_features_t	(fpga_pkg::tile_features_t),
	.TILE_FEATURES			(TILE_FEATURES),
	.WMEM_DEPTH			(WMEM_DEPTH),
	.NUM_CH				(NUM_CH),
	.STILE_FEATURES			(STILE_FEATURES),
	.SFU_SRAM_WIDTH			(SFU_SRAM_WIDTH),
	.SFU_SRAM_DEPTH			(SFU_SRAM_DEPTH),
	.SFU_NUM_CH			(SFU_NUM_CH),
	.SFU_MODE_LEN			(SFU_MODE_LEN),
	.SFU_SUB_LEN			(SFU_SUB_LEN),
	.SFU_SRAM_DELAY			(SFU_SRAM_DELAY),
	.SFU_SCALAR_DEPTH		(SFU_SCALAR_DEPTH),
	.SFU_GB_DEPTH			(SFU_GB_DEPTH),
	.LB_DEPTH			(LB_DEPTH),
	.LB_DLY				(LB_DLY),
	.LB_CH				(LB_CH),
	.LB_RAM_TYPE			(LB_RAM_TYPE),
	.AXI_DATA_WIDTH			(AXI_DATA_WIDTH),
	.AXI_ADDR_WIDTH			(AXI_ADDR_WIDTH),
	.AXI_STRB_WIDTH			(AXI_STRB_WIDTH),
	.AXI_ID_WIDTH			(AXI_ID_WIDTH),
	.AXI_MAX_BURST_LEN		(AXI_MAX_BURST_LEN),
	.AXIS_DATA_WIDTH		(AXIS_DATA_WIDTH),
	.AXIS_KEEP_ENABLE		(AXIS_KEEP_ENABLE),
	.AXIS_KEEP_WIDTH		(AXIS_KEEP_WIDTH),
	.AXIS_LAST_ENABLE		(AXIS_LAST_ENABLE),
	.AXIS_ID_ENABLE			(AXIS_ID_ENABLE),
	.AXIS_ID_WIDTH			(AXIS_ID_WIDTH),
	.AXIS_DEST_ENABLE		(AXIS_DEST_ENABLE),
	.AXIS_DEST_WIDTH		(AXIS_DEST_WIDTH),
	.AXIS_USER_ENABLE		(AXIS_USER_ENABLE),
	.AXIS_USER_WIDTH		(AXIS_USER_WIDTH),
	.LEN_WIDTH			(LEN_WIDTH),
	.TAG_WIDTH			(TAG_WIDTH),
	.ENABLE_SG			(ENABLE_SG),
	.ENABLE_UNALIGNED		(ENABLE_UNALIGNED),
	.AXI_WORD_WIDTH			(AXI_WORD_WIDTH),
	.AXI_WORD_SIZE			(AXI_WORD_SIZE),
	.AXI_BURST_SIZE			(AXI_BURST_SIZE),
	.AXI_MAX_BURST_SIZE		(AXI_MAX_BURST_SIZE),
	.OFFSET_WIDTH			(OFFSET_WIDTH),
	.OFFSET_MASK			(OFFSET_MASK),
	.ADDR_MASK			(ADDR_MASK),
	.CYCLE_COUNT_WIDTH		(CYCLE_COUNT_WIDTH),
	.STATUS_FIFO_ADDR_WIDTH		(STATUS_FIFO_ADDR_WIDTH),
	.OUTPUT_FIFO_ADDR_WIDTH		(OUTPUT_FIFO_ADDR_WIDTH),
	.M_ID_WIDTH			(M_ID_WIDTH)) u_top (
      /*AUTOINST*/
							     // Outputs
							     .cfg_reg_rd_data	(cfg_reg_rd_data[31:0]),
							     .m00_axi_araddr	(m00_axi_araddr[AXI_ADDR_WIDTH-1:0]),
							     .m00_axi_arburst	(m00_axi_arburst[1:0]),
							     .m00_axi_arcache	(m00_axi_arcache[3:0]),
							     .m00_axi_arid	(m00_axi_arid[M_ID_WIDTH-1:0]),
							     .m00_axi_arlen	(m00_axi_arlen[7:0]),
							     .m00_axi_arlock	(m00_axi_arlock),
							     .m00_axi_arprot	(m00_axi_arprot[2:0]),
							     .m00_axi_arsize	(m00_axi_arsize[2:0]),
							     .m00_axi_arvalid	(m00_axi_arvalid),
							     .m00_axi_awaddr	(m00_axi_awaddr[AXI_ADDR_WIDTH-1:0]),
							     .m00_axi_awburst	(m00_axi_awburst[1:0]),
							     .m00_axi_awcache	(m00_axi_awcache[3:0]),
							     .m00_axi_awid	(m00_axi_awid[M_ID_WIDTH-1:0]),
							     .m00_axi_awlen	(m00_axi_awlen[7:0]),
							     .m00_axi_awlock	(m00_axi_awlock),
							     .m00_axi_awprot	(m00_axi_awprot[2:0]),
							     .m00_axi_awsize	(m00_axi_awsize[2:0]),
							     .m00_axi_awvalid	(m00_axi_awvalid),
							     .m00_axi_bready	(m00_axi_bready),
							     .m00_axi_rready	(m00_axi_rready),
							     .m00_axi_wdata	(m00_axi_wdata[AXI_DATA_WIDTH-1:0]),
							     .m00_axi_wlast	(m00_axi_wlast),
							     .m00_axi_wstrb	(m00_axi_wstrb[AXI_STRB_WIDTH-1:0]),
							     .m00_axi_wvalid	(m00_axi_wvalid),
							     .m01_axi_araddr	(m01_axi_araddr[AXI_ADDR_WIDTH-1:0]),
							     .m01_axi_arburst	(m01_axi_arburst[1:0]),
							     .m01_axi_arcache	(m01_axi_arcache[3:0]),
							     .m01_axi_arid	(m01_axi_arid[M_ID_WIDTH-1:0]),
							     .m01_axi_arlen	(m01_axi_arlen[7:0]),
							     .m01_axi_arlock	(m01_axi_arlock),
							     .m01_axi_arprot	(m01_axi_arprot[2:0]),
							     .m01_axi_arsize	(m01_axi_arsize[2:0]),
							     .m01_axi_arvalid	(m01_axi_arvalid),
							     .m01_axi_awaddr	(m01_axi_awaddr[AXI_ADDR_WIDTH-1:0]),
							     .m01_axi_awburst	(m01_axi_awburst[1:0]),
							     .m01_axi_awcache	(m01_axi_awcache[3:0]),
							     .m01_axi_awid	(m01_axi_awid[M_ID_WIDTH-1:0]),
							     .m01_axi_awlen	(m01_axi_awlen[7:0]),
							     .m01_axi_awlock	(m01_axi_awlock),
							     .m01_axi_awprot	(m01_axi_awprot[2:0]),
							     .m01_axi_awsize	(m01_axi_awsize[2:0]),
							     .m01_axi_awvalid	(m01_axi_awvalid),
							     .m01_axi_bready	(m01_axi_bready),
							     .m01_axi_rready	(m01_axi_rready),
							     .m01_axi_wdata	(m01_axi_wdata[AXI_DATA_WIDTH-1:0]),
							     .m01_axi_wlast	(m01_axi_wlast),
							     .m01_axi_wstrb	(m01_axi_wstrb[AXI_STRB_WIDTH-1:0]),
							     .m01_axi_wvalid	(m01_axi_wvalid),
							     .m02_axi_araddr	(m02_axi_araddr[AXI_ADDR_WIDTH-1:0]),
							     .m02_axi_arburst	(m02_axi_arburst[1:0]),
							     .m02_axi_arcache	(m02_axi_arcache[3:0]),
							     .m02_axi_arid	(m02_axi_arid[M_ID_WIDTH-1:0]),
							     .m02_axi_arlen	(m02_axi_arlen[7:0]),
							     .m02_axi_arlock	(m02_axi_arlock),
							     .m02_axi_arprot	(m02_axi_arprot[2:0]),
							     .m02_axi_arsize	(m02_axi_arsize[2:0]),
							     .m02_axi_arvalid	(m02_axi_arvalid),
							     .m02_axi_awaddr	(m02_axi_awaddr[AXI_ADDR_WIDTH-1:0]),
							     .m02_axi_awburst	(m02_axi_awburst[1:0]),
							     .m02_axi_awcache	(m02_axi_awcache[3:0]),
							     .m02_axi_awid	(m02_axi_awid[M_ID_WIDTH-1:0]),
							     .m02_axi_awlen	(m02_axi_awlen[7:0]),
							     .m02_axi_awlock	(m02_axi_awlock),
							     .m02_axi_awprot	(m02_axi_awprot[2:0]),
							     .m02_axi_awsize	(m02_axi_awsize[2:0]),
							     .m02_axi_awvalid	(m02_axi_awvalid),
							     .m02_axi_bready	(m02_axi_bready),
							     .m02_axi_rready	(m02_axi_rready),
							     .m02_axi_wdata	(m02_axi_wdata[AXI_DATA_WIDTH-1:0]),
							     .m02_axi_wlast	(m02_axi_wlast),
							     .m02_axi_wstrb	(m02_axi_wstrb[AXI_STRB_WIDTH-1:0]),
							     .m02_axi_wvalid	(m02_axi_wvalid),
							     .params_core_sync	(params_core_sync[1:0]),
							     .params_irq_ro	(params_irq_ro),
							     .params_mac_rst	(params_mac_rst),
							     .params_qsfp0_loopback_in(params_qsfp0_loopback_in[11:0]),
							     .params_qsfp1_loopback_in(params_qsfp1_loopback_in[11:0]),
							     .params_step_num	(params_step_num[7:0]),
							     .qsfp0_mac_tx_axis_tdata(qsfp0_mac_tx_axis_tdata[511:0]),
							     .qsfp0_mac_tx_axis_tkeep(qsfp0_mac_tx_axis_tkeep[63:0]),
							     .qsfp0_mac_tx_axis_tlast(qsfp0_mac_tx_axis_tlast),
							     .qsfp0_mac_tx_axis_tuser(qsfp0_mac_tx_axis_tuser[7:0]),
							     .qsfp0_mac_tx_axis_tvalid(qsfp0_mac_tx_axis_tvalid),
							     .qsfp1_mac_tx_axis_tdata(qsfp1_mac_tx_axis_tdata[511:0]),
							     .qsfp1_mac_tx_axis_tkeep(qsfp1_mac_tx_axis_tkeep[63:0]),
							     .qsfp1_mac_tx_axis_tlast(qsfp1_mac_tx_axis_tlast),
							     .qsfp1_mac_tx_axis_tuser(qsfp1_mac_tx_axis_tuser[7:0]),
							     .qsfp1_mac_tx_axis_tvalid(qsfp1_mac_tx_axis_tvalid),
							     .s_pcie_axi_arready(),		 // Templated
							     .s_pcie_axi_awready(),		 // Templated
							     .s_pcie_axi_bid	(),		 // Templated
							     .s_pcie_axi_bresp	(),		 // Templated
							     .s_pcie_axi_bvalid	(),		 // Templated
							     .s_pcie_axi_rdata	(),		 // Templated
							     .s_pcie_axi_rid	(),		 // Templated
							     .s_pcie_axi_rlast	(),		 // Templated
							     .s_pcie_axi_rresp	(),		 // Templated
							     .s_pcie_axi_rvalid	(),		 // Templated
							     .s_pcie_axi_wready	(),		 // Templated
							     .uart_txd_o	(uart_txd_o),
							     // Inputs
							     .cfg_reg_addr	(cfg_reg_addr[19:0]),
							     .cfg_reg_wr_data	(cfg_reg_wr_data[31:0]),
							     .cfg_reg_wr_en	(cfg_reg_wr_en),
							     .clk		(clk),
							     .m00_axi_arready	(m00_axi_arready),
							     .m00_axi_awready	(m00_axi_awready),
							     .m00_axi_bid	(m00_axi_bid[M_ID_WIDTH-1:0]),
							     .m00_axi_bresp	(m00_axi_bresp[1:0]),
							     .m00_axi_bvalid	(m00_axi_bvalid),
							     .m00_axi_rdata	(m00_axi_rdata[AXI_DATA_WIDTH-1:0]),
							     .m00_axi_rid	(m00_axi_rid[M_ID_WIDTH-1:0]),
							     .m00_axi_rlast	(m00_axi_rlast),
							     .m00_axi_rresp	(m00_axi_rresp[1:0]),
							     .m00_axi_rvalid	(m00_axi_rvalid),
							     .m00_axi_wready	(m00_axi_wready),
							     .m01_axi_arready	(m01_axi_arready),
							     .m01_axi_awready	(m01_axi_awready),
							     .m01_axi_bid	(m01_axi_bid[M_ID_WIDTH-1:0]),
							     .m01_axi_bresp	(m01_axi_bresp[1:0]),
							     .m01_axi_bvalid	(m01_axi_bvalid),
							     .m01_axi_rdata	(m01_axi_rdata[AXI_DATA_WIDTH-1:0]),
							     .m01_axi_rid	(m01_axi_rid[M_ID_WIDTH-1:0]),
							     .m01_axi_rlast	(m01_axi_rlast),
							     .m01_axi_rresp	(m01_axi_rresp[1:0]),
							     .m01_axi_rvalid	(m01_axi_rvalid),
							     .m01_axi_wready	(m01_axi_wready),
							     .m02_axi_arready	(m02_axi_arready),
							     .m02_axi_awready	(m02_axi_awready),
							     .m02_axi_bid	(m02_axi_bid[M_ID_WIDTH-1:0]),
							     .m02_axi_bresp	(m02_axi_bresp[1:0]),
							     .m02_axi_bvalid	(m02_axi_bvalid),
							     .m02_axi_rdata	(m02_axi_rdata[AXI_DATA_WIDTH-1:0]),
							     .m02_axi_rid	(m02_axi_rid[M_ID_WIDTH-1:0]),
							     .m02_axi_rlast	(m02_axi_rlast),
							     .m02_axi_rresp	(m02_axi_rresp[1:0]),
							     .m02_axi_rvalid	(m02_axi_rvalid),
							     .m02_axi_wready	(m02_axi_wready),
							     .params_core_sync0_ro(params_core_sync0_ro[31:0]),
							     .params_core_sync1_ro(params_core_sync1_ro[31:0]),
							     .qsfp0_mac_tx_axis_tready(qsfp0_mac_tx_axis_tready),
							     .qsfp0_rx_axis_tdata_int(qsfp0_rx_axis_tdata_int[511:0]),
							     .qsfp0_rx_axis_tkeep_int(qsfp0_rx_axis_tkeep_int[63:0]),
							     .qsfp0_rx_axis_tlast_int(qsfp0_rx_axis_tlast_int),
							     .qsfp0_rx_axis_tuser_int(qsfp0_rx_axis_tuser_int[7:0]),
							     .qsfp0_rx_axis_tvalid_int(qsfp0_rx_axis_tvalid_int),
							     .qsfp0_rx_clk_int	(qsfp0_rx_clk_int),
							     .qsfp0_rx_rst_int	(qsfp0_rx_rst_int),
							     .qsfp0_tx_clk_int	(qsfp0_tx_clk_int),
							     .qsfp0_tx_rst_int	(qsfp0_tx_rst_int),
							     .qsfp1_mac_tx_axis_tready(qsfp1_mac_tx_axis_tready),
							     .qsfp1_rx_axis_tdata_int(qsfp1_rx_axis_tdata_int[511:0]),
							     .qsfp1_rx_axis_tkeep_int(qsfp1_rx_axis_tkeep_int[63:0]),
							     .qsfp1_rx_axis_tlast_int(qsfp1_rx_axis_tlast_int),
							     .qsfp1_rx_axis_tuser_int(qsfp1_rx_axis_tuser_int[7:0]),
							     .qsfp1_rx_axis_tvalid_int(qsfp1_rx_axis_tvalid_int),
							     .qsfp1_rx_clk_int	(qsfp1_rx_clk_int),
							     .qsfp1_rx_rst_int	(qsfp1_rx_rst_int),
							     .qsfp1_tx_clk_int	(qsfp1_tx_clk_int),
							     .qsfp1_tx_rst_int	(qsfp1_tx_rst_int),
							     .rst		(rst),
							     .s_pcie_axi_araddr	(),		 // Templated
							     .s_pcie_axi_arburst(),		 // Templated
							     .s_pcie_axi_arcache(),		 // Templated
							     .s_pcie_axi_arid	(),		 // Templated
							     .s_pcie_axi_arlen	(),		 // Templated
							     .s_pcie_axi_arlock	(),		 // Templated
							     .s_pcie_axi_arprot	(),		 // Templated
							     .s_pcie_axi_arsize	(),		 // Templated
							     .s_pcie_axi_arvalid(),		 // Templated
							     .s_pcie_axi_awaddr	(),		 // Templated
							     .s_pcie_axi_awburst(),		 // Templated
							     .s_pcie_axi_awcache(),		 // Templated
							     .s_pcie_axi_awid	(),		 // Templated
							     .s_pcie_axi_awlen	(),		 // Templated
							     .s_pcie_axi_awlock	(),		 // Templated
							     .s_pcie_axi_awprot	(),		 // Templated
							     .s_pcie_axi_awsize	(),		 // Templated
							     .s_pcie_axi_awvalid(),		 // Templated
							     .s_pcie_axi_bready	(),		 // Templated
							     .s_pcie_axi_rready	(),		 // Templated
							     .s_pcie_axi_wdata	(),		 // Templated
							     .s_pcie_axi_wlast	(),		 // Templated
							     .s_pcie_axi_wstrb	(),		 // Templated
							     .s_pcie_axi_wvalid	(),		 // Templated
							     .uart_rxd_i	(uart_rxd_i));


 axi_register_dly #(
      // Parameters
      .DATA_WIDTH   (AXI_DATA_WIDTH),
      .ADDR_WIDTH   (AXI_ADDR_WIDTH),
      .STRB_WIDTH   (AXI_STRB_WIDTH),
      .ID_WIDTH   (M_ID_WIDTH),
      .DELAY_CNT  (DELAY_CNT)
  ) u00_register(/*autoinst*/
		 // Outputs
		 .s_axi_awready		(m00_axi_awready),	 // Templated
		 .s_axi_wready		(m00_axi_wready),	 // Templated
		 .s_axi_bid		(m00_axi_bid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_bresp		(m00_axi_bresp[1:0]),	 // Templated
		 .s_axi_buser		(),			 // Templated
		 .s_axi_bvalid		(m00_axi_bvalid),	 // Templated
		 .s_axi_arready		(m00_axi_arready),	 // Templated
		 .s_axi_rid		(m00_axi_rid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_rdata		(m00_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
		 .s_axi_rresp		(m00_axi_rresp[1:0]),	 // Templated
		 .s_axi_rlast		(m00_axi_rlast),	 // Templated
		 .s_axi_ruser		(),			 // Templated
		 .s_axi_rvalid		(m00_axi_rvalid),	 // Templated
		 .m_axi_awid		(m00_axi_awid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_awaddr		(m00_axi_awaddr_reg[AXI_ADDR_WIDTH-1:0]), // Templated
		 .m_axi_awlen		(m00_axi_awlen_reg[7:0]), // Templated
		 .m_axi_awsize		(m00_axi_awsize_reg[2:0]), // Templated
		 .m_axi_awburst		(m00_axi_awburst_reg[1:0]), // Templated
		 .m_axi_awlock		(m00_axi_awlock_reg),	 // Templated
		 .m_axi_awcache		(m00_axi_awcache_reg[3:0]), // Templated
		 .m_axi_awprot		(m00_axi_awprot_reg[2:0]), // Templated
		 .m_axi_awqos		(),			 // Templated
		 .m_axi_awregion	(),			 // Templated
		 .m_axi_awuser		(),			 // Templated
		 .m_axi_awvalid		(m00_axi_awvalid_reg),	 // Templated
		 .m_axi_wdata		(m00_axi_wdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
		 .m_axi_wstrb		(m00_axi_wstrb_reg[AXI_STRB_WIDTH-1:0]), // Templated
		 .m_axi_wlast		(m00_axi_wlast_reg),	 // Templated
		 .m_axi_wuser		(),			 // Templated
		 .m_axi_wvalid		(m00_axi_wvalid_reg),	 // Templated
		 .m_axi_bready		(m00_axi_bready_reg),	 // Templated
		 .m_axi_arid		(m00_axi_arid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_araddr		(m00_axi_araddr_reg[AXI_ADDR_WIDTH-1:0]), // Templated
		 .m_axi_arlen		(m00_axi_arlen_reg[7:0]), // Templated
		 .m_axi_arsize		(m00_axi_arsize_reg[2:0]), // Templated
		 .m_axi_arburst		(m00_axi_arburst_reg[1:0]), // Templated
		 .m_axi_arlock		(m00_axi_arlock_reg),	 // Templated
		 .m_axi_arcache		(m00_axi_arcache_reg[3:0]), // Templated
		 .m_axi_arprot		(m00_axi_arprot_reg[2:0]), // Templated
		 .m_axi_arqos		(),			 // Templated
		 .m_axi_arregion	(),			 // Templated
		 .m_axi_aruser		(),			 // Templated
		 .m_axi_arvalid		(m00_axi_arvalid_reg),	 // Templated
		 .m_axi_rready		(m00_axi_rready_reg),	 // Templated
		 // Inputs
		 .clk			(clk),
		 .rst			(rst),
		 .s_axi_awid		(m00_axi_awid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_awaddr		(m00_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
		 .s_axi_awlen		(m00_axi_awlen[7:0]),	 // Templated
		 .s_axi_awsize		(m00_axi_awsize[2:0]),	 // Templated
		 .s_axi_awburst		(m00_axi_awburst[1:0]),	 // Templated
		 .s_axi_awlock		(m00_axi_awlock),	 // Templated
		 .s_axi_awcache		(m00_axi_awcache[3:0]),	 // Templated
		 .s_axi_awprot		(m00_axi_awprot[2:0]),	 // Templated
		 .s_axi_awqos		('d0),			 // Templated
		 .s_axi_awregion	('d0),			 // Templated
		 .s_axi_awuser		('d0),			 // Templated
		 .s_axi_awvalid		(m00_axi_awvalid),	 // Templated
		 .s_axi_wdata		(m00_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
		 .s_axi_wstrb		(m00_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
		 .s_axi_wlast		(m00_axi_wlast),	 // Templated
		 .s_axi_wuser		('d0),			 // Templated
		 .s_axi_wvalid		(m00_axi_wvalid),	 // Templated
		 .s_axi_bready		(m00_axi_bready),	 // Templated
		 .s_axi_arid		(m00_axi_arid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_araddr		(m00_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
		 .s_axi_arlen		(m00_axi_arlen[7:0]),	 // Templated
		 .s_axi_arsize		(m00_axi_arsize[2:0]),	 // Templated
		 .s_axi_arburst		(m00_axi_arburst[1:0]),	 // Templated
		 .s_axi_arlock		(m00_axi_arlock),	 // Templated
		 .s_axi_arcache		(m00_axi_arcache[3:0]),	 // Templated
		 .s_axi_arprot		(m00_axi_arprot[2:0]),	 // Templated
		 .s_axi_arqos		('d0),			 // Templated
		 .s_axi_arregion	('d0),			 // Templated
		 .s_axi_aruser		('d0),			 // Templated
		 .s_axi_arvalid		(m00_axi_arvalid),	 // Templated
		 .s_axi_rready		(m00_axi_rready),	 // Templated
		 .m_axi_awready		(m00_axi_awready_reg),	 // Templated
		 .m_axi_wready		(m00_axi_wready_reg),	 // Templated
		 .m_axi_bid		(m00_axi_bid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_bresp		(m00_axi_bresp_reg[1:0]), // Templated
		 .m_axi_buser		('d0),			 // Templated
		 .m_axi_bvalid		(m00_axi_bvalid_reg),	 // Templated
		 .m_axi_arready		(m00_axi_arready_reg),	 // Templated
		 .m_axi_rid		(m00_axi_rid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_rdata		(m00_axi_rdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
		 .m_axi_rresp		(m00_axi_rresp_reg[1:0]), // Templated
		 .m_axi_rlast		(m00_axi_rlast_reg),	 // Templated
		 .m_axi_ruser		('d0),			 // Templated
		 .m_axi_rvalid		(m00_axi_rvalid_reg));	 // Templated

 axi_register_dly #(
      // Parameters
      .DATA_WIDTH   (AXI_DATA_WIDTH),
      .ADDR_WIDTH   (AXI_ADDR_WIDTH),
      .STRB_WIDTH   (AXI_STRB_WIDTH),
      .ID_WIDTH   (M_ID_WIDTH),
      .DELAY_CNT  (DELAY_CNT)      
  ) u01_register(
                 .m_axi_araddr (m01_axi_araddr_reg),
                 .m_axi_awaddr (m01_axi_awaddr_reg),
                 /*autoinst*/
		 // Outputs
		 .s_axi_awready		(m01_axi_awready),	 // Templated
		 .s_axi_wready		(m01_axi_wready),	 // Templated
		 .s_axi_bid		(m01_axi_bid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_bresp		(m01_axi_bresp[1:0]),	 // Templated
		 .s_axi_buser		(),			 // Templated
		 .s_axi_bvalid		(m01_axi_bvalid),	 // Templated
		 .s_axi_arready		(m01_axi_arready),	 // Templated
		 .s_axi_rid		(m01_axi_rid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_rdata		(m01_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
		 .s_axi_rresp		(m01_axi_rresp[1:0]),	 // Templated
		 .s_axi_rlast		(m01_axi_rlast),	 // Templated
		 .s_axi_ruser		(),			 // Templated
		 .s_axi_rvalid		(m01_axi_rvalid),	 // Templated
		 .m_axi_awid		(m01_axi_awid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_awlen		(m01_axi_awlen_reg[7:0]), // Templated
		 .m_axi_awsize		(m01_axi_awsize_reg[2:0]), // Templated
		 .m_axi_awburst		(m01_axi_awburst_reg[1:0]), // Templated
		 .m_axi_awlock		(m01_axi_awlock_reg),	 // Templated
		 .m_axi_awcache		(m01_axi_awcache_reg[3:0]), // Templated
		 .m_axi_awprot		(m01_axi_awprot_reg[2:0]), // Templated
		 .m_axi_awqos		(),			 // Templated
		 .m_axi_awregion	(),			 // Templated
		 .m_axi_awuser		(),			 // Templated
		 .m_axi_awvalid		(m01_axi_awvalid_reg),	 // Templated
		 .m_axi_wdata		(m01_axi_wdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
		 .m_axi_wstrb		(m01_axi_wstrb_reg[AXI_STRB_WIDTH-1:0]), // Templated
		 .m_axi_wlast		(m01_axi_wlast_reg),	 // Templated
		 .m_axi_wuser		(),			 // Templated
		 .m_axi_wvalid		(m01_axi_wvalid_reg),	 // Templated
		 .m_axi_bready		(m01_axi_bready_reg),	 // Templated
		 .m_axi_arid		(m01_axi_arid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_arlen		(m01_axi_arlen_reg[7:0]), // Templated
		 .m_axi_arsize		(m01_axi_arsize_reg[2:0]), // Templated
		 .m_axi_arburst		(m01_axi_arburst_reg[1:0]), // Templated
		 .m_axi_arlock		(m01_axi_arlock_reg),	 // Templated
		 .m_axi_arcache		(m01_axi_arcache_reg[3:0]), // Templated
		 .m_axi_arprot		(m01_axi_arprot_reg[2:0]), // Templated
		 .m_axi_arqos		(),			 // Templated
		 .m_axi_arregion	(),			 // Templated
		 .m_axi_aruser		(),			 // Templated
		 .m_axi_arvalid		(m01_axi_arvalid_reg),	 // Templated
		 .m_axi_rready		(m01_axi_rready_reg),	 // Templated
		 // Inputs
		 .clk			(clk),
		 .rst			(rst),
		 .s_axi_awid		(m01_axi_awid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_awaddr		(m01_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
		 .s_axi_awlen		(m01_axi_awlen[7:0]),	 // Templated
		 .s_axi_awsize		(m01_axi_awsize[2:0]),	 // Templated
		 .s_axi_awburst		(m01_axi_awburst[1:0]),	 // Templated
		 .s_axi_awlock		(m01_axi_awlock),	 // Templated
		 .s_axi_awcache		(m01_axi_awcache[3:0]),	 // Templated
		 .s_axi_awprot		(m01_axi_awprot[2:0]),	 // Templated
		 .s_axi_awqos		('d0),			 // Templated
		 .s_axi_awregion	('d0),			 // Templated
		 .s_axi_awuser		('d0),			 // Templated
		 .s_axi_awvalid		(m01_axi_awvalid),	 // Templated
		 .s_axi_wdata		(m01_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
		 .s_axi_wstrb		(m01_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
		 .s_axi_wlast		(m01_axi_wlast),	 // Templated
		 .s_axi_wuser		('d0),			 // Templated
		 .s_axi_wvalid		(m01_axi_wvalid),	 // Templated
		 .s_axi_bready		(m01_axi_bready),	 // Templated
		 .s_axi_arid		(m01_axi_arid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_araddr		(m01_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
		 .s_axi_arlen		(m01_axi_arlen[7:0]),	 // Templated
		 .s_axi_arsize		(m01_axi_arsize[2:0]),	 // Templated
		 .s_axi_arburst		(m01_axi_arburst[1:0]),	 // Templated
		 .s_axi_arlock		(m01_axi_arlock),	 // Templated
		 .s_axi_arcache		(m01_axi_arcache[3:0]),	 // Templated
		 .s_axi_arprot		(m01_axi_arprot[2:0]),	 // Templated
		 .s_axi_arqos		('d0),			 // Templated
		 .s_axi_arregion	('d0),			 // Templated
		 .s_axi_aruser		('d0),			 // Templated
		 .s_axi_arvalid		(m01_axi_arvalid),	 // Templated
		 .s_axi_rready		(m01_axi_rready),	 // Templated
		 .m_axi_awready		(m01_axi_awready_reg),	 // Templated
		 .m_axi_wready		(m01_axi_wready_reg),	 // Templated
		 .m_axi_bid		(m01_axi_bid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_bresp		(m01_axi_bresp_reg[1:0]), // Templated
		 .m_axi_buser		('d0),			 // Templated
		 .m_axi_bvalid		(m01_axi_bvalid_reg),	 // Templated
		 .m_axi_arready		(m01_axi_arready_reg),	 // Templated
		 .m_axi_rid		(m01_axi_rid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_rdata		(m01_axi_rdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
		 .m_axi_rresp		(m01_axi_rresp_reg[1:0]), // Templated
		 .m_axi_rlast		(m01_axi_rlast_reg),	 // Templated
		 .m_axi_ruser		('d0),			 // Templated
		 .m_axi_rvalid		(m01_axi_rvalid_reg));	 // Templated

 axi_register_dly #(
      // Parameters
      .DATA_WIDTH   (AXI_DATA_WIDTH),
      .ADDR_WIDTH   (AXI_ADDR_WIDTH),
      .STRB_WIDTH   (AXI_STRB_WIDTH),
      .ID_WIDTH   (M_ID_WIDTH),
      .DELAY_CNT  (DELAY_CNT)
  ) u02_register(
                 .m_axi_araddr (m02_axi_araddr_reg),
                 .m_axi_awaddr (m02_axi_awaddr_reg),
                 /*autoinst*/
		 // Outputs
		 .s_axi_awready		(m02_axi_awready),	 // Templated
		 .s_axi_wready		(m02_axi_wready),	 // Templated
		 .s_axi_bid		(m02_axi_bid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_bresp		(m02_axi_bresp[1:0]),	 // Templated
		 .s_axi_buser		(),			 // Templated
		 .s_axi_bvalid		(m02_axi_bvalid),	 // Templated
		 .s_axi_arready		(m02_axi_arready),	 // Templated
		 .s_axi_rid		(m02_axi_rid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_rdata		(m02_axi_rdata[AXI_DATA_WIDTH-1:0]), // Templated
		 .s_axi_rresp		(m02_axi_rresp[1:0]),	 // Templated
		 .s_axi_rlast		(m02_axi_rlast),	 // Templated
		 .s_axi_ruser		(),			 // Templated
		 .s_axi_rvalid		(m02_axi_rvalid),	 // Templated
		 .m_axi_awid		(m02_axi_awid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_awlen		(m02_axi_awlen_reg[7:0]), // Templated
		 .m_axi_awsize		(m02_axi_awsize_reg[2:0]), // Templated
		 .m_axi_awburst		(m02_axi_awburst_reg[1:0]), // Templated
		 .m_axi_awlock		(m02_axi_awlock_reg),	 // Templated
		 .m_axi_awcache		(m02_axi_awcache_reg[3:0]), // Templated
		 .m_axi_awprot		(m02_axi_awprot_reg[2:0]), // Templated
		 .m_axi_awqos		(),			 // Templated
		 .m_axi_awregion	(),			 // Templated
		 .m_axi_awuser		(),			 // Templated
		 .m_axi_awvalid		(m02_axi_awvalid_reg),	 // Templated
		 .m_axi_wdata		(m02_axi_wdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
		 .m_axi_wstrb		(m02_axi_wstrb_reg[AXI_STRB_WIDTH-1:0]), // Templated
		 .m_axi_wlast		(m02_axi_wlast_reg),	 // Templated
		 .m_axi_wuser		(),			 // Templated
		 .m_axi_wvalid		(m02_axi_wvalid_reg),	 // Templated
		 .m_axi_bready		(m02_axi_bready_reg),	 // Templated
		 .m_axi_arid		(m02_axi_arid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_arlen		(m02_axi_arlen_reg[7:0]), // Templated
		 .m_axi_arsize		(m02_axi_arsize_reg[2:0]), // Templated
		 .m_axi_arburst		(m02_axi_arburst_reg[1:0]), // Templated
		 .m_axi_arlock		(m02_axi_arlock_reg),	 // Templated
		 .m_axi_arcache		(m02_axi_arcache_reg[3:0]), // Templated
		 .m_axi_arprot		(m02_axi_arprot_reg[2:0]), // Templated
		 .m_axi_arqos		(),			 // Templated
		 .m_axi_arregion	(),			 // Templated
		 .m_axi_aruser		(),			 // Templated
		 .m_axi_arvalid		(m02_axi_arvalid_reg),	 // Templated
		 .m_axi_rready		(m02_axi_rready_reg),	 // Templated
		 // Inputs
		 .clk			(clk),
		 .rst			(rst),
		 .s_axi_awid		(m02_axi_awid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_awaddr		(m02_axi_awaddr[AXI_ADDR_WIDTH-1:0]), // Templated
		 .s_axi_awlen		(m02_axi_awlen[7:0]),	 // Templated
		 .s_axi_awsize		(m02_axi_awsize[2:0]),	 // Templated
		 .s_axi_awburst		(m02_axi_awburst[1:0]),	 // Templated
		 .s_axi_awlock		(m02_axi_awlock),	 // Templated
		 .s_axi_awcache		(m02_axi_awcache[3:0]),	 // Templated
		 .s_axi_awprot		(m02_axi_awprot[2:0]),	 // Templated
		 .s_axi_awqos		('d0),			 // Templated
		 .s_axi_awregion	('d0),			 // Templated
		 .s_axi_awuser		('d0),			 // Templated
		 .s_axi_awvalid		(m02_axi_awvalid),	 // Templated
		 .s_axi_wdata		(m02_axi_wdata[AXI_DATA_WIDTH-1:0]), // Templated
		 .s_axi_wstrb		(m02_axi_wstrb[AXI_STRB_WIDTH-1:0]), // Templated
		 .s_axi_wlast		(m02_axi_wlast),	 // Templated
		 .s_axi_wuser		('d0),			 // Templated
		 .s_axi_wvalid		(m02_axi_wvalid),	 // Templated
		 .s_axi_bready		(m02_axi_bready),	 // Templated
		 .s_axi_arid		(m02_axi_arid[M_ID_WIDTH-1:0]), // Templated
		 .s_axi_araddr		(m02_axi_araddr[AXI_ADDR_WIDTH-1:0]), // Templated
		 .s_axi_arlen		(m02_axi_arlen[7:0]),	 // Templated
		 .s_axi_arsize		(m02_axi_arsize[2:0]),	 // Templated
		 .s_axi_arburst		(m02_axi_arburst[1:0]),	 // Templated
		 .s_axi_arlock		(m02_axi_arlock),	 // Templated
		 .s_axi_arcache		(m02_axi_arcache[3:0]),	 // Templated
		 .s_axi_arprot		(m02_axi_arprot[2:0]),	 // Templated
		 .s_axi_arqos		('d0),			 // Templated
		 .s_axi_arregion	('d0),			 // Templated
		 .s_axi_aruser		('d0),			 // Templated
		 .s_axi_arvalid		(m02_axi_arvalid),	 // Templated
		 .s_axi_rready		(m02_axi_rready),	 // Templated
		 .m_axi_awready		(m02_axi_awready_reg),	 // Templated
		 .m_axi_wready		(m02_axi_wready_reg),	 // Templated
		 .m_axi_bid		(m02_axi_bid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_bresp		(m02_axi_bresp_reg[1:0]), // Templated
		 .m_axi_buser		('d0),			 // Templated
		 .m_axi_bvalid		(m02_axi_bvalid_reg),	 // Templated
		 .m_axi_arready		(m02_axi_arready_reg),	 // Templated
		 .m_axi_rid		(m02_axi_rid_reg[M_ID_WIDTH-1:0]), // Templated
		 .m_axi_rdata		(m02_axi_rdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
		 .m_axi_rresp		(m02_axi_rresp_reg[1:0]), // Templated
		 .m_axi_rlast		(m02_axi_rlast_reg),	 // Templated
		 .m_axi_ruser		('d0),			 // Templated
		 .m_axi_rvalid		(m02_axi_rvalid_reg));	 // Templated


  axi_ram #(
      // Parameters
      .DATA_WIDTH   (AXI_DATA_WIDTH),
      .ADDR_WIDTH   (AXI_ADDR_WIDTH),
      .STRB_WIDTH   (AXI_STRB_WIDTH),
      .ID_WIDTH   (M_ID_WIDTH),
      .PIPELINE_OUTPUT  (PIPELINE_OUTPUT)
      //.VALID_ADDR_WIDTH  (VALID_ADDR_WIDTH),
      //.WORD_WIDTH   (AXI_WORD_WIDTH),
      //.WORD_SIZE   (AXI_WORD_SIZE)
  ) u00_ram (  /*autoinst*/
	     // Outputs
	     .s_axi_awready		(m00_axi_awready_reg),	 // Templated
	     .s_axi_wready		(m00_axi_wready_reg),	 // Templated
	     .s_axi_bid			(m00_axi_bid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_bresp		(m00_axi_bresp_reg[1:0]), // Templated
	     .s_axi_bvalid		(m00_axi_bvalid_reg),	 // Templated
	     .s_axi_arready		(m00_axi_arready_reg),	 // Templated
	     .s_axi_rid			(m00_axi_rid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_rdata		(m00_axi_rdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
	     .s_axi_rresp		(m00_axi_rresp_reg[1:0]), // Templated
	     .s_axi_rlast		(m00_axi_rlast_reg),	 // Templated
	     .s_axi_rvalid		(m00_axi_rvalid_reg),	 // Templated
	     // Inputs
	     .clk			(clk),
	     .rst			(rst),
	     .s_axi_awid		(m00_axi_awid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_awaddr		(m00_axi_awaddr_reg[AXI_ADDR_WIDTH-1:0]), // Templated
	     .s_axi_awlen		(m00_axi_awlen_reg[7:0]), // Templated
	     .s_axi_awsize		(m00_axi_awsize_reg[2:0]), // Templated
	     .s_axi_awburst		(m00_axi_awburst_reg[1:0]), // Templated
	     .s_axi_awlock		(m00_axi_awlock_reg),	 // Templated
	     .s_axi_awcache		(m00_axi_awcache_reg[3:0]), // Templated
	     .s_axi_awprot		(m00_axi_awprot_reg[2:0]), // Templated
	     .s_axi_awvalid		(m00_axi_awvalid_reg),	 // Templated
	     .s_axi_wdata		(m00_axi_wdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
	     .s_axi_wstrb		(m00_axi_wstrb_reg[AXI_STRB_WIDTH-1:0]), // Templated
	     .s_axi_wlast		(m00_axi_wlast_reg),	 // Templated
	     .s_axi_wvalid		(m00_axi_wvalid_reg),	 // Templated
	     .s_axi_bready		(m00_axi_bready_reg),	 // Templated
	     .s_axi_arid		(m00_axi_arid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_araddr		(m00_axi_araddr_reg[AXI_ADDR_WIDTH-1:0]), // Templated
	     .s_axi_arlen		(m00_axi_arlen_reg[7:0]), // Templated
	     .s_axi_arsize		(m00_axi_arsize_reg[2:0]), // Templated
	     .s_axi_arburst		(m00_axi_arburst_reg[1:0]), // Templated
	     .s_axi_arlock		(m00_axi_arlock_reg),	 // Templated
	     .s_axi_arcache		(m00_axi_arcache_reg[3:0]), // Templated
	     .s_axi_arprot		(m00_axi_arprot_reg[2:0]), // Templated
	     .s_axi_arvalid		(m00_axi_arvalid_reg),	 // Templated
	     .s_axi_rready		(m00_axi_rready_reg));	 // Templated
  axi_ram #(
      // Parameters
      .DATA_WIDTH   (AXI_DATA_WIDTH),
      .ADDR_WIDTH   (AXI_ADDR_WIDTH),
      .STRB_WIDTH   (AXI_STRB_WIDTH),
      .ID_WIDTH   (M_ID_WIDTH),
      .PIPELINE_OUTPUT  (PIPELINE_OUTPUT)
      //.VALID_ADDR_WIDTH  (VALID_ADDR_WIDTH),
      //.WORD_WIDTH   (AXI_WORD_WIDTH),
      //.WORD_SIZE   (AXI_WORD_SIZE)
  ) u01_ram (
      .s_axi_awaddr(m01_axi_awaddr_reg[AXI_ADDR_WIDTH-1:0] - 64'h2_0000_0000),
      .s_axi_araddr(m01_axi_araddr_reg[AXI_ADDR_WIDTH-1:0] - 64'h2_0000_0000),

      /*autoinst*/
	     // Outputs
	     .s_axi_awready		(m01_axi_awready_reg),	 // Templated
	     .s_axi_wready		(m01_axi_wready_reg),	 // Templated
	     .s_axi_bid			(m01_axi_bid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_bresp		(m01_axi_bresp_reg[1:0]), // Templated
	     .s_axi_bvalid		(m01_axi_bvalid_reg),	 // Templated
	     .s_axi_arready		(m01_axi_arready_reg),	 // Templated
	     .s_axi_rid			(m01_axi_rid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_rdata		(m01_axi_rdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
	     .s_axi_rresp		(m01_axi_rresp_reg[1:0]), // Templated
	     .s_axi_rlast		(m01_axi_rlast_reg),	 // Templated
	     .s_axi_rvalid		(m01_axi_rvalid_reg),	 // Templated
	     // Inputs
	     .clk			(clk),
	     .rst			(rst),
	     .s_axi_awid		(m01_axi_awid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_awlen		(m01_axi_awlen_reg[7:0]), // Templated
	     .s_axi_awsize		(m01_axi_awsize_reg[2:0]), // Templated
	     .s_axi_awburst		(m01_axi_awburst_reg[1:0]), // Templated
	     .s_axi_awlock		(m01_axi_awlock_reg),	 // Templated
	     .s_axi_awcache		(m01_axi_awcache_reg[3:0]), // Templated
	     .s_axi_awprot		(m01_axi_awprot_reg[2:0]), // Templated
	     .s_axi_awvalid		(m01_axi_awvalid_reg),	 // Templated
	     .s_axi_wdata		(m01_axi_wdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
	     .s_axi_wstrb		(m01_axi_wstrb_reg[AXI_STRB_WIDTH-1:0]), // Templated
	     .s_axi_wlast		(m01_axi_wlast_reg),	 // Templated
	     .s_axi_wvalid		(m01_axi_wvalid_reg),	 // Templated
	     .s_axi_bready		(m01_axi_bready_reg),	 // Templated
	     .s_axi_arid		(m01_axi_arid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_arlen		(m01_axi_arlen_reg[7:0]), // Templated
	     .s_axi_arsize		(m01_axi_arsize_reg[2:0]), // Templated
	     .s_axi_arburst		(m01_axi_arburst_reg[1:0]), // Templated
	     .s_axi_arlock		(m01_axi_arlock_reg),	 // Templated
	     .s_axi_arcache		(m01_axi_arcache_reg[3:0]), // Templated
	     .s_axi_arprot		(m01_axi_arprot_reg[2:0]), // Templated
	     .s_axi_arvalid		(m01_axi_arvalid_reg),	 // Templated
	     .s_axi_rready		(m01_axi_rready_reg));	 // Templated


  axi_ram #(
      // Parameters
      .DATA_WIDTH   (AXI_DATA_WIDTH),
      .ADDR_WIDTH   (AXI_ADDR_WIDTH),
      .STRB_WIDTH   (AXI_STRB_WIDTH),
      .ID_WIDTH   (M_ID_WIDTH),
      .PIPELINE_OUTPUT  (PIPELINE_OUTPUT)
      //.VALID_ADDR_WIDTH  (VALID_ADDR_WIDTH),
      //.WORD_WIDTH   (AXI_WORD_WIDTH),
      //.WORD_SIZE   (AXI_WORD_SIZE)
  ) u02_ram (
      .s_axi_awaddr  (m02_axi_awaddr_reg[AXI_ADDR_WIDTH-1:0] - 64'h4_0000_0000),
      .s_axi_araddr  (m02_axi_araddr_reg[AXI_ADDR_WIDTH-1:0] - 64'h4_0000_0000),
      /*autoinst*/
	     // Outputs
	     .s_axi_awready		(m02_axi_awready_reg),	 // Templated
	     .s_axi_wready		(m02_axi_wready_reg),	 // Templated
	     .s_axi_bid			(m02_axi_bid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_bresp		(m02_axi_bresp_reg[1:0]), // Templated
	     .s_axi_bvalid		(m02_axi_bvalid_reg),	 // Templated
	     .s_axi_arready		(m02_axi_arready_reg),	 // Templated
	     .s_axi_rid			(m02_axi_rid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_rdata		(m02_axi_rdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
	     .s_axi_rresp		(m02_axi_rresp_reg[1:0]), // Templated
	     .s_axi_rlast		(m02_axi_rlast_reg),	 // Templated
	     .s_axi_rvalid		(m02_axi_rvalid_reg),	 // Templated
	     // Inputs
	     .clk			(clk),
	     .rst			(rst),
	     .s_axi_awid		(m02_axi_awid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_awlen		(m02_axi_awlen_reg[7:0]), // Templated
	     .s_axi_awsize		(m02_axi_awsize_reg[2:0]), // Templated
	     .s_axi_awburst		(m02_axi_awburst_reg[1:0]), // Templated
	     .s_axi_awlock		(m02_axi_awlock_reg),	 // Templated
	     .s_axi_awcache		(m02_axi_awcache_reg[3:0]), // Templated
	     .s_axi_awprot		(m02_axi_awprot_reg[2:0]), // Templated
	     .s_axi_awvalid		(m02_axi_awvalid_reg),	 // Templated
	     .s_axi_wdata		(m02_axi_wdata_reg[AXI_DATA_WIDTH-1:0]), // Templated
	     .s_axi_wstrb		(m02_axi_wstrb_reg[AXI_STRB_WIDTH-1:0]), // Templated
	     .s_axi_wlast		(m02_axi_wlast_reg),	 // Templated
	     .s_axi_wvalid		(m02_axi_wvalid_reg),	 // Templated
	     .s_axi_bready		(m02_axi_bready_reg),	 // Templated
	     .s_axi_arid		(m02_axi_arid_reg[M_ID_WIDTH-1:0]), // Templated
	     .s_axi_arlen		(m02_axi_arlen_reg[7:0]), // Templated
	     .s_axi_arsize		(m02_axi_arsize_reg[2:0]), // Templated
	     .s_axi_arburst		(m02_axi_arburst_reg[1:0]), // Templated
	     .s_axi_arlock		(m02_axi_arlock_reg),	 // Templated
	     .s_axi_arcache		(m02_axi_arcache_reg[3:0]), // Templated
	     .s_axi_arprot		(m02_axi_arprot_reg[2:0]), // Templated
	     .s_axi_arvalid		(m02_axi_arvalid_reg),	 // Templated
	     .s_axi_rready		(m02_axi_rready_reg));	 // Templated




  clk_gen u_clk_gen (
      /*AUTOINST*/
		     // Outputs
		     .clk		(clk));

  rst_gen u_rst_gen (
      /*AUTOINST*/
		     // Outputs
		     .rst_n		(),			 // Templated
		     .rst_p		(rst));			 // Templated

  driver #(
      .TILE_FEATURES (TILE_FEATURES),
      /*AUTOINSTPARAM*/
	   // Parameters
//	   .fpga_pkg::tile_features_t	(fpga_pkg::tile_features_t),
	   .AXI_ADDR_WIDTH		(AXI_ADDR_WIDTH),
	   .LEN_WIDTH			(LEN_WIDTH),
	   .DMEM_DEPTH			(DMEM_DEPTH),
	   .DADDR_BITS			(DADDR_BITS)) driver (
      /*AUTOINST*/
							      // Outputs
							      .cfg_reg_addr	(cfg_reg_addr[31:0]),
							      .cfg_reg_wr_data	(cfg_reg_wr_data[31:0]),
							      .cfg_reg_wr_en	(cfg_reg_wr_en),
							      // Inputs
							      .clk		(clk),
							      .rst		(rst),
							      .cfg_reg_rd_data	(cfg_reg_rd_data[31:0]));


  dump dump ();


  ini_mem #(
      .ROWS(ROWS),
      .INPUT_LENGTH(INPUT_LENGTH)
  ) u_ini_mem ();


  ini_decode u_ini_decode ();

  monitor #(
      /*AUTOINSTPARAM*/
	    // Parameters
	    .INPUT_LENGTH		(INPUT_LENGTH),
	    .OUTPUT_LENGTH		(OUTPUT_LENGTH),
	    .ROWS			(ROWS),
	    .COLUMNS			(COLUMNS),
	    .ID_WIDTH			(ID_WIDTH),
	    .DATA_FLOW			(DATA_FLOW),
	    .MAC_DELAY			(MAC_DELAY)) u_monitor (  /*AUTOINST*/
								// Inputs
								.clk		(clk),
								.rst		(rst),
								.params_step_num(params_step_num[7:0]));



  sfu_monitor #(
      /*AUTOINSTPARAM*/
		// Parameters
		.INPUT_LENGTH		(INPUT_LENGTH),
		.NUM_CH			(NUM_CH)) u_sfu_monitor (  /*AUTOINST*/
								 // Inputs
								 .clk			(clk),
								 .rst			(rst),
								 .params_step_num	(params_step_num[7:0]));

//  net_cnt #(
//      /*AUTOINSTPARAM*/
//	    // Parameters
//	    .AXI_DATA_WIDTH		(AXI_DATA_WIDTH),
//	    .AXI_ADDR_WIDTH		(AXI_ADDR_WIDTH),
//	    .AXI_STRB_WIDTH		(AXI_STRB_WIDTH),
//	    .AXI_ID_WIDTH		(AXI_ID_WIDTH),
//	    .AXI_MAX_BURST_LEN		(AXI_MAX_BURST_LEN),
//	    .AXIS_DATA_WIDTH		(AXIS_DATA_WIDTH),
//	    .AXIS_KEEP_ENABLE		(AXIS_KEEP_ENABLE),
//	    .AXIS_KEEP_WIDTH		(AXIS_KEEP_WIDTH),
//	    .AXIS_LAST_ENABLE		(AXIS_LAST_ENABLE),
//	    .AXIS_ID_ENABLE		(AXIS_ID_ENABLE),
//	    .AXIS_ID_WIDTH		(AXIS_ID_WIDTH),
//	    .AXIS_DEST_ENABLE		(AXIS_DEST_ENABLE),
//	    .AXIS_DEST_WIDTH		(AXIS_DEST_WIDTH),
//	    .AXIS_USER_ENABLE		(AXIS_USER_ENABLE),
//	    .AXIS_USER_WIDTH		(AXIS_USER_WIDTH),
//	    .LEN_WIDTH			(LEN_WIDTH),
//	    .TAG_WIDTH			(TAG_WIDTH),
//	    .ENABLE_SG			(ENABLE_SG),
//	    .ENABLE_UNALIGNED		(ENABLE_UNALIGNED),
//	    .ROWS			(ROWS),
//	    .INPUT_LENGTH		(INPUT_LENGTH)) u_net_cnt (  /*AUTOINST*/
//								   // Outputs
//								   .m_net_axis_tdata	(m_net_axis_tdata[AXIS_DATA_WIDTH-1:0]),
//								   .m_net_axis_tdest	(m_net_axis_tdest[AXIS_DEST_WIDTH-1:0]),
//								   .m_net_axis_tid	(m_net_axis_tid[AXIS_ID_WIDTH-1:0]),
//								   .m_net_axis_tkeep	(m_net_axis_tkeep[AXIS_KEEP_WIDTH-1:0]),
//								   .m_net_axis_tlast	(m_net_axis_tlast),
//								   .m_net_axis_tuser	(m_net_axis_tuser[AXIS_USER_WIDTH-1:0]),
//								   .m_net_axis_tvalid	(m_net_axis_tvalid),
//								   .net_tx_rdy		(net_tx_rdy),
//								   // Inputs
//								   .m_net_axis_tready	(m_net_axis_tready),
//								   .net_data_in		(net_data_in[(ROWS*INPUT_LENGTH)-1:0]),
//								   .net_valid_in	(net_valid_in),
//								   .net_data_tkeep	(net_data_tkeep[AXIS_KEEP_WIDTH-1:0]),
//								   .net_data_tlast	(net_data_tlast),
//								   .net_data_tuser	(net_data_tuser[AXIS_USER_WIDTH-1:0]));
//


  /* uart_model  AUTO_TEMPLATE  (
    .reset (rst       ) , 
    .rxd   (uart_rxd_i) ,
    .txd   (uart_txd_o) ,
 );
*/




  uart_model u_uart_model (  /*autoinst*/
			   // Outputs
			   .rxd			(uart_rxd_i),	 // Templated
			   // Inputs
			   .clk			(clk),
			   .reset		(rst       ),	 // Templated
			   .txd			(uart_txd_o));	 // Templated




//cmac_top #(/*autoinstparam*/
//	   // Parameters
//	   .ROWS			(ROWS),
//	   .INPUT_LENGTH		(INPUT_LENGTH),
//	   .AXI_DATA_WIDTH		(AXI_DATA_WIDTH),
//	   .AXI_ADDR_WIDTH		(AXI_ADDR_WIDTH),
//	   .AXI_STRB_WIDTH		(AXI_STRB_WIDTH),
//	   .AXI_ID_WIDTH		(AXI_ID_WIDTH),
//	   .AXI_MAX_BURST_LEN		(AXI_MAX_BURST_LEN),
//	   .AXIS_DATA_WIDTH		(AXIS_DATA_WIDTH),
//	   .AXIS_KEEP_ENABLE		(AXIS_KEEP_ENABLE),
//	   .AXIS_KEEP_WIDTH		(AXIS_KEEP_WIDTH),
//	   .AXIS_LAST_ENABLE		(AXIS_LAST_ENABLE),
//	   .AXIS_ID_ENABLE		(AXIS_ID_ENABLE),
//	   .AXIS_ID_WIDTH		(AXIS_ID_WIDTH),
//	   .AXIS_DEST_ENABLE		(AXIS_DEST_ENABLE),
//	   .AXIS_DEST_WIDTH		(AXIS_DEST_WIDTH),
//	   .AXIS_USER_ENABLE		(AXIS_USER_ENABLE),
//	   .AXIS_USER_WIDTH		(AXIS_USER_WIDTH),
//	   .LEN_WIDTH			(LEN_WIDTH),
//	   .TAG_WIDTH			(TAG_WIDTH),
//	   .ENABLE_SG			(ENABLE_SG),
//	   .ENABLE_UNALIGNED		(ENABLE_UNALIGNED),
//	   .AXI_WORD_WIDTH		(AXI_WORD_WIDTH),
//	   .AXI_WORD_SIZE		(AXI_WORD_SIZE),
//	   .AXI_BURST_SIZE		(AXI_BURST_SIZE),
//	   .AXI_MAX_BURST_SIZE		(AXI_MAX_BURST_SIZE),
//	   .OFFSET_WIDTH		(OFFSET_WIDTH),
//	   .OFFSET_MASK			(OFFSET_MASK),
//	   .ADDR_MASK			(ADDR_MASK),
//	   .CYCLE_COUNT_WIDTH		(CYCLE_COUNT_WIDTH),
//	   .STATUS_FIFO_ADDR_WIDTH	(STATUS_FIFO_ADDR_WIDTH),
//	   .OUTPUT_FIFO_ADDR_WIDTH	(OUTPUT_FIFO_ADDR_WIDTH),
//	   .M_ID_WIDTH			(M_ID_WIDTH)) u_cmac_top(/*autoinst*/
//								 // Outputs
//								 .m_net_axis_tdata	(m_net_axis_tdata[AXIS_DATA_WIDTH-1:0]),
//								 .m_net_axis_tdest	(m_net_axis_tdest[AXIS_DEST_WIDTH-1:0]),
//								 .m_net_axis_tid	(m_net_axis_tid[AXIS_ID_WIDTH-1:0]),
//								 .m_net_axis_tkeep	(m_net_axis_tkeep[AXIS_KEEP_WIDTH-1:0]),
//								 .m_net_axis_tlast	(m_net_axis_tlast),
//								 .m_net_axis_tuser	(m_net_axis_tuser[AXIS_USER_WIDTH-1:0]),
//								 .m_net_axis_tvalid	(m_net_axis_tvalid),
//								 .net_tx_rdy		(net_tx_rdy),
//								 .qsfp0_mac_tx_axis_tdata(qsfp0_mac_tx_axis_tdata[511:0]),
//								 .qsfp0_mac_tx_axis_tkeep(qsfp0_mac_tx_axis_tkeep[63:0]),
//								 .qsfp0_mac_tx_axis_tlast(qsfp0_mac_tx_axis_tlast),
//								 .qsfp0_mac_tx_axis_tuser(qsfp0_mac_tx_axis_tuser),
//								 .qsfp0_mac_tx_axis_tvalid(qsfp0_mac_tx_axis_tvalid),
//								 .qsfp1_mac_tx_axis_tdata(qsfp1_mac_tx_axis_tdata[511:0]),
//								 .qsfp1_mac_tx_axis_tkeep(qsfp1_mac_tx_axis_tkeep[63:0]),
//								 .qsfp1_mac_tx_axis_tlast(qsfp1_mac_tx_axis_tlast),
//								 .qsfp1_mac_tx_axis_tuser(qsfp1_mac_tx_axis_tuser),
//								 .qsfp1_mac_tx_axis_tvalid(qsfp1_mac_tx_axis_tvalid),
//								 // Inputs
//								 .clk			(clk),
//								 .rst			(rst),
//								 .m_net_axis_tready	(m_net_axis_tready),
//								 .net_data_in		(net_data_in[(ROWS*INPUT_LENGTH)-1:0]),
//								 .net_data_tkeep	(net_data_tkeep[AXIS_KEEP_WIDTH-1:0]),
//								 .net_data_tlast	(net_data_tlast),
//								 .net_data_tuser	(net_data_tuser[AXIS_USER_WIDTH-1:0]),
//								 .net_rdesc_len		(net_rdesc_len[LEN_WIDTH-1:0]),
//								 .net_rstart		(net_rstart),
//								 .net_tdesc_len		(net_tdesc_len[LEN_WIDTH-1:0]),
//								 .net_tstart		(net_tstart),
//								 .net_valid_in		(net_valid_in),
//								 .params_qsfp0_dmac_addrh(params_qsfp0_dmac_addrh[15:0]),
//								 .params_qsfp0_dmac_addrl(params_qsfp0_dmac_addrl[31:0]),
//								 .params_qsfp0_mac_addrh(params_qsfp0_mac_addrh[15:0]),
//								 .params_qsfp0_mac_addrl(params_qsfp0_mac_addrl[31:0]),
//								 .params_qsfp1_dmac_addrh(params_qsfp1_dmac_addrh[15:0]),
//								 .params_qsfp1_dmac_addrl(params_qsfp1_dmac_addrl[31:0]),
//								 .params_qsfp1_mac_addrh(params_qsfp1_mac_addrh[15:0]),
//								 .params_qsfp1_mac_addrl(params_qsfp1_mac_addrl[31:0]),
//								 .qsfp0_mac_tx_axis_tready(qsfp0_mac_tx_axis_tready),
//								 .qsfp0_rx_axis_tdata_int(qsfp0_rx_axis_tdata_int[511:0]),
//								 .qsfp0_rx_axis_tkeep_int(qsfp0_rx_axis_tkeep_int[63:0]),
//								 .qsfp0_rx_axis_tlast_int(qsfp0_rx_axis_tlast_int),
//								 .qsfp0_rx_axis_tuser_int(qsfp0_rx_axis_tuser_int),
//								 .qsfp0_rx_axis_tvalid_int(qsfp0_rx_axis_tvalid_int),
//								 .qsfp0_rx_clk_int	(qsfp0_rx_clk_int),
//								 .qsfp0_rx_rst_int	(qsfp0_rx_rst_int),
//								 .qsfp0_tx_clk_int	(qsfp0_tx_clk_int),
//								 .qsfp0_tx_rst_int	(qsfp0_tx_rst_int),
//								 .qsfp1_mac_tx_axis_tready(qsfp1_mac_tx_axis_tready),
//								 .qsfp1_rx_axis_tdata_int(qsfp1_rx_axis_tdata_int[511:0]),
//								 .qsfp1_rx_axis_tkeep_int(qsfp1_rx_axis_tkeep_int[63:0]),
//								 .qsfp1_rx_axis_tlast_int(qsfp1_rx_axis_tlast_int),
//								 .qsfp1_rx_axis_tuser_int(qsfp1_rx_axis_tuser_int),
//								 .qsfp1_rx_axis_tvalid_int(qsfp1_rx_axis_tvalid_int),
//								 .qsfp1_rx_clk_int	(qsfp1_rx_clk_int),
//								 .qsfp1_rx_rst_int	(qsfp1_rx_rst_int),
//								 .qsfp1_tx_clk_int	(qsfp1_tx_clk_int),
//								 .qsfp1_tx_rst_int	(qsfp1_tx_rst_int));
//




  cmac_model u_cmac_model (/*autoinst*/
			   // Outputs
			   .qsfp0_mac_tx_axis_tready(qsfp0_mac_tx_axis_tready),
			   .qsfp0_rx_axis_tdata_int(qsfp0_rx_axis_tdata_int[511:0]),
			   .qsfp0_rx_axis_tkeep_int(qsfp0_rx_axis_tkeep_int[63:0]),
			   .qsfp0_rx_axis_tlast_int(qsfp0_rx_axis_tlast_int),
			   .qsfp0_rx_axis_tuser_int(qsfp0_rx_axis_tuser_int),
			   .qsfp0_rx_axis_tvalid_int(qsfp0_rx_axis_tvalid_int),
			   .qsfp0_rx_clk_int	(qsfp0_rx_clk_int),
			   .qsfp0_rx_rst_int	(qsfp0_rx_rst_int),
			   .qsfp0_tx_clk_int	(qsfp0_tx_clk_int),
			   .qsfp0_tx_rst_int	(qsfp0_tx_rst_int),
			   .qsfp1_mac_tx_axis_tready(qsfp1_mac_tx_axis_tready),
			   .qsfp1_rx_axis_tdata_int(qsfp1_rx_axis_tdata_int[511:0]),
			   .qsfp1_rx_axis_tkeep_int(qsfp1_rx_axis_tkeep_int[63:0]),
			   .qsfp1_rx_axis_tlast_int(qsfp1_rx_axis_tlast_int),
			   .qsfp1_rx_axis_tuser_int(qsfp1_rx_axis_tuser_int),
			   .qsfp1_rx_axis_tvalid_int(qsfp1_rx_axis_tvalid_int),
			   .qsfp1_rx_clk_int	(qsfp1_rx_clk_int),
			   .qsfp1_rx_rst_int	(qsfp1_rx_rst_int),
			   .qsfp1_tx_clk_int	(qsfp1_tx_clk_int),
			   .qsfp1_tx_rst_int	(qsfp1_tx_rst_int),
			   // Inputs
			   .qsfp0_mac_tx_axis_tdata(qsfp0_mac_tx_axis_tdata[511:0]),
			   .qsfp0_mac_tx_axis_tkeep(qsfp0_mac_tx_axis_tkeep[63:0]),
			   .qsfp0_mac_tx_axis_tlast(qsfp0_mac_tx_axis_tlast),
			   .qsfp0_mac_tx_axis_tuser(qsfp0_mac_tx_axis_tuser),
			   .qsfp0_mac_tx_axis_tvalid(qsfp0_mac_tx_axis_tvalid),
			   .qsfp1_mac_tx_axis_tdata(qsfp1_mac_tx_axis_tdata[511:0]),
			   .qsfp1_mac_tx_axis_tkeep(qsfp1_mac_tx_axis_tkeep[63:0]),
			   .qsfp1_mac_tx_axis_tlast(qsfp1_mac_tx_axis_tlast),
			   .qsfp1_mac_tx_axis_tuser(qsfp1_mac_tx_axis_tuser),
			   .qsfp1_mac_tx_axis_tvalid(qsfp1_mac_tx_axis_tvalid));




endmodule

// Local Variables:
// verilog-auto-inst-param-value:t
// verilog-library-directories:("." "../../../Code/interface/axi0/"  "../../../Code/top/"  "../../common/uart_model/" "../../../Code/cmac/" )
// End:
