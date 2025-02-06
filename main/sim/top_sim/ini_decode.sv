module ini_decode (  /*autoarg*/);

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  parameter ROWS = 32;
  parameter INPUT_LENGTH = 16;


  integer            fp_r;

  integer            i;

  integer            result_r;
  integer            all_line_count;

  reg     [12*8-1:0] rdata;

  initial begin


    fp_r = $fopen("./ins.bin", "r");

    $display("%m: ----  decode ini start    \n  ");
    all_line_count = 0;
    while (1) begin
      result_r = $fread(rdata, fp_r,, 12);

      if ($feof(fp_r)) break;
      tb.u_top.u07_decode_sram.u_decode_sram.u_dpsram.mem[all_line_count] = rdata;
      all_line_count++;
    end
    $display("%m: ---- decode mem ( %d * 12B ) ini done    \n  ", all_line_count);

  end

endmodule


