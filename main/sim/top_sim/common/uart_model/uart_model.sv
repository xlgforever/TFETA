module uart_model (
    input       clk   ,
    input       reset ,
    output wire rxd   ,
    input       txd   
);

  wire    [7:0]       ser_data ;
  wire                ser_en ;

assign   rxd = 1'd1 ;

serialc serc (
    .CLK        (clk    )   , 
    .RST_X      (~reset )   ,  
    .RXD        (txd    )   , 
    .DATA   (ser_data    )   , 
    .EN     (ser_en      )   
);


  initial begin 
    	$display("\nuart_printf_start!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   \n");
	#100
	wait(~reset);
	while (1) begin 
   		@(posedge clk);
		if ( ser_en ) begin 
			$write("%s",ser_data);
		end
	end
    	$display("\nuart_printf_finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   \n");	
  end

  /////////////////////////////////////////////////////////////////////////////////////////////////////


endmodule

