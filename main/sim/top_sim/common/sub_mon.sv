module sub_mon (
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
  input [WIDTH-1 : 0] din;

  integer               fp_r;
  integer               count;
  reg     [WIDTH - 1:0] RDATA;

  initial begin
    fp_r  = $fopen(FILE, "r");
    count = $fscanf(fp_r, "%d", RDATA);
  end


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
        $display("%m:the %d  data compare fail!!!! reference and rtl  is %d --  %d \n", icnt,
                 RDATA, din);
      end
      #0.1

	     count = $fscanf(fp_r, "%d", RDATA);

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





