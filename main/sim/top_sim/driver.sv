module driver (
    /*AUTOARG*/
   // Outputs
   cfg_reg_addr, cfg_reg_wr_data, cfg_reg_wr_en,
   // Inputs
   clk, rst, cfg_reg_rd_data
   );



  parameter fpga_pkg::tile_features_t TILE_FEATURES = fpga_pkg::TILE_FEATURES_DEFAULT1;
  parameter AXI_ADDR_WIDTH = 32;
  parameter LEN_WIDTH = 8;
  parameter int unsigned DMEM_DEPTH = 8 * 12;
  parameter int unsigned DADDR_BITS = 12;



  localparam fpga_pkg::pe_features_t PE_FEATURES = TILE_FEATURES.PE_Features;
  localparam int unsigned ID_WIDTH = $clog2(PE_FEATURES.MaxSimultaneousMatmuls);

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  input clk;
  input rst;

  output [31:0] cfg_reg_addr;
  output [31:0] cfg_reg_wr_data;
  output cfg_reg_wr_en;

  //output		  	decode_write;		        
  //output [DADDR_BITS-1:0] decode_write_addr;	
  //output [DMEM_DEPTH-1:0] decode_write_data;	

  input [31:0] cfg_reg_rd_data;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  reg  [          31:0] cfg_reg_addr;
  reg  [          31:0] cfg_reg_wr_data;
  reg                   cfg_reg_wr_en;
  wire                  decode_write = 'd0;
  wire [DADDR_BITS-1:0] decode_write_addr = 'd0;
  wire [DMEM_DEPTH-1:0] decode_write_data = 'd0;
  
  reg [15:0] lut_data;
  integer i, lut_file;

  reg [15:0] fp16_test;
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  initial begin
    cfg_reg_addr    = 'd0 ;
    cfg_reg_wr_data = 'd1 ;
    cfg_reg_wr_en   = 'd0 ;
    #1000;
    wait (rst == 1'b0);
    
    // init lut
`ifdef VIT_LUT
    lut_file = $fopen("vit_lut","r");
`else
    lut_file = $fopen("qwen_lut","r");
`endif

    for(i=0;i<4096;i=i+1)begin
        @(posedge clk);
        $fscanf(lut_file, "%h", lut_data);
        ini_lut(i, lut_data);
    end
    @(posedge clk);
    force tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut = 'd0;
    release tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut;
    release tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut_addr[11:0];
    release tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut_data[15:0];
    
    #100;
    $fclose(lut_file);
    #1000;

    @(posedge clk) cfg_reg_wr_en = 'd1;
    @(posedge clk) cfg_reg_wr_en = 'd0;

    //force   tb.u_top.u0_dut_top.params_feature_lmode = 1'd1;

    force  tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_TOP.params_uart_divisor[31:0] =  250000000/50000000   -   1  ;
    force tb.u_uart_model.serc.waitcnt[31:0] = 250000000 / 50000000;


  end


  task ini_lut;
      input [11:0] lut_addr;
      input [15:0] lut_data;
    begin
      //tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.reg_014[0];
      //tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.reg_015[11:0];
      //tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.reg_015[27:12];
      //@(posedge clk);
      force tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut = 'd1;
      force tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut_addr[11:0] = lut_addr;
      force tb.u_top.u0_dut_top.u0_CFG_TOP.u_MFUNC_SFU.params_write_lut_data[15:0] = lut_data;
     end
  endtask








endmodule

