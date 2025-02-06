module sub8_mon (
    clk,
    rst,
    ivld,
    din
);

  parameter string FILE = "./din.txt";
  parameter WIDTH = 16;

  input clk;
  input rst;
  input ivld;
  input [WIDTH*8-1 : 0] din;

  integer                 fp_r;
  integer                 count;
  wire    [WIDTH*8 - 1:0] RDATA;
  reg     [  WIDTH - 1:0] RDATA0;
  reg     [  WIDTH - 1:0] RDATA1;
  reg     [  WIDTH - 1:0] RDATA2;
  reg     [  WIDTH - 1:0] RDATA3;
  reg     [  WIDTH - 1:0] RDATA4;
  reg     [  WIDTH - 1:0] RDATA5;
  reg     [  WIDTH - 1:0] RDATA6;
  reg     [  WIDTH - 1:0] RDATA7;

  initial begin
    fp_r  = $fopen(FILE, "r");
    count = $fscanf(fp_r, "%h", RDATA0);
    count = $fscanf(fp_r, "%h", RDATA1);
    count = $fscanf(fp_r, "%h", RDATA2);
    count = $fscanf(fp_r, "%h", RDATA3);
    count = $fscanf(fp_r, "%h", RDATA4);
    count = $fscanf(fp_r, "%h", RDATA5);
    count = $fscanf(fp_r, "%h", RDATA6);
    count = $fscanf(fp_r, "%h", RDATA7);
  end



  assign RDATA = {RDATA7, RDATA6, RDATA5, RDATA4, RDATA3, RDATA2, RDATA1, RDATA0};

  reg [63:0] icnt;

  reg        err_flag;
  reg        compare_done;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      err_flag     <= 'd0;
      icnt         <= 'd0;
      compare_done <= 1'd0;
    end else if (ivld && ~compare_done) begin
      icnt <= icnt + 'd1;
      if (RDATA == din) begin
        err_flag <= 'd0;
      end else begin
        err_flag <= 'd1;
        $display("%m:the %0h  data compare fail!!!! reference and rtl  is %0h --  %0h \n", icnt,
                 RDATA, din);
      end
      #0.1

	count = $fscanf(fp_r, "%h", RDATA0);
      count = $fscanf(fp_r, "%h", RDATA1);
      count = $fscanf(fp_r, "%h", RDATA2);
      count = $fscanf(fp_r, "%h", RDATA3);
      count = $fscanf(fp_r, "%h", RDATA4);
      count = $fscanf(fp_r, "%h", RDATA5);
      count = $fscanf(fp_r, "%h", RDATA6);
      count = $fscanf(fp_r, "%h", RDATA7);


      if ($feof(fp_r)) begin
        compare_done <= 1'd1;
      end
    end else begin
      err_flag <= 'd0;
    end
  end

  always @(posedge clk) begin
    if (err_flag) begin
      #1000 $display("%m: CASE_FAILE  !!!!!  \n");
      $finish();
    end
  end





endmodule





