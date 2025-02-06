module sub_mon_param (clk,
                      rst,
                      ivld,
                      din,
		      step_num);
    
    parameter string FILE   = "./stage1.txt";
    parameter ELEMENT_NUM   = 32;
    parameter ELEMENT_WIDTH = 16;
    
    input clk;
    input rst;
    input ivld;
    input [ELEMENT_NUM-1:0][ELEMENT_WIDTH-1:0] din;
    input [7:0]   step_num ;  
 
    integer fr ;
    
    integer                 fp_r = $fopen(FILE, "r");
    integer                 count;
    //wire    [ELEMENT_NUM-1:0][ELEMENT_WIDTH-1:0] RDATA;
    // reg     [WIDTH - 1:0] RDATA0;
    // reg     [WIDTH - 1:0] RDATA1;
    // reg     [WIDTH - 1:0] RDATA2;
    // reg     [WIDTH - 1:0] RDATA3;
    // reg     [WIDTH - 1:0] RDATA4;
    // reg     [WIDTH - 1:0] RDATA5;
    // reg     [WIDTH - 1:0] RDATA6;
    // reg     [WIDTH - 1:0] RDATA7;
    
    reg [ELEMENT_NUM-1:0][ELEMENT_WIDTH-1:0] RDATA_ROW;

    `ifdef COMP
    initial begin
        // fp_r  = $fopen(FILE, "r");
        // count = $fscanf(fp_r, "%h", RDATA0);
        // count = $fscanf(fp_r, "%h", RDATA1);
        // count = $fscanf(fp_r, "%h", RDATA2);
        // count = $fscanf(fp_r, "%h", RDATA3);
        // count = $fscanf(fp_r, "%h", RDATA4);
        // count = $fscanf(fp_r, "%h", RDATA5);
        // count = $fscanf(fp_r, "%h", RDATA6);
        // count = $fscanf(fp_r, "%h", RDATA7);
        for(integer i = 0;i<ELEMENT_NUM;i = i+1) begin
            $fscanf(fp_r, "%h", RDATA_ROW[i]);
        end
    end
    `endif
    
    //assign RDATA = {RDATA7, RDATA6, RDATA5, RDATA4, RDATA3, RDATA2, RDATA1, RDATA0};
    
    reg [63:0] icnt;
    
    reg        err_flag;
    reg        compare_done;
    
    
    reg         cmp_flag ;
    reg   [ELEMENT_WIDTH-1:0]  cmp_data ;
    always@(*)
    begin
        cmp_flag = 1 ;
        for(integer i = 0;i<ELEMENT_NUM;i = i+1) begin
            cmp_data      = RDATA_ROW[i] - din[i] ;
            if ((cmp_data === 'd0)||(cmp_data === 'h8000 && (din[i]==='h0 || din[i]==='h8000) ))   cmp_flag = 1 ;
            else begin
                cmp_flag = 0 ;
                break ;
            end
        end
        
    end
    
    always @(posedge clk) begin
        if (rst) begin
            err_flag     <= 'd0;
            icnt         <= 'd0;
            compare_done <= 1'd0;
            end 
	 else if (ivld && ~compare_done) begin
            icnt <= icnt + 'd1;
            `ifdef COMP
            //if (RDATA_ROW == din) begin
            if (cmp_flag) begin
                err_flag <= 'd0;
                end else begin
                err_flag <= 'd1;
                $display("%m:the %0d data compare fail!!!! reference and rtl  is %0h --  %0h  ,   step_num is %0d \n", icnt,
                RDATA_ROW, din ,  step_num  );
            end
            #0.1
            for(integer i = 0;i<ELEMENT_NUM;i = i+1) begin
                $fscanf(fp_r, "%h", RDATA_ROW[i]);
            end
            `endif
            
            `ifdef COMP
            if ($feof(fp_r)) begin
                compare_done <= 1'd1;
            end
            `else
                compare_done <= 1'd0;
            `endif
        end 
        else if (ivld) begin 
           $display("%m: compare fail  because compare_done !!!!!!!!!!!!!  \n");
            err_flag <= 'd1;           
        end 
        else begin
            err_flag <= 'd0;
        end
    end
    
    always @(posedge clk) begin
        if (err_flag) begin
            #10_000 $display("%m: CASE_FAILE  !!!!!  \n");
   	    fr = $fopen("./R.txt", "w");
      	    $fdisplay(fr, "%0d", 0) ;
            $fclose(fr);
                         
            $finish();
        end
    end
    
    
    
    
    
endmodule
    
    
    
    
    
