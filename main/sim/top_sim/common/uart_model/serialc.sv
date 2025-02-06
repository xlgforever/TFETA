`define SERIAL_WCNT   5         // clock freq / uart band rate  
/**************************************************************************************************/
/* RS232C serial controller (deserializer):                                                       */
/**************************************************************************************************/
`define SS_SER_WAIT  'd0         // RS232C deserializer, State WAIT
`define SS_SER_RCV0  'd1         // RS232C deserializer, State Receive 0th bit
                                 // States Receive 1st bit to 7th bit are not used
`define SS_SER_DONE  'd9         // RS232C deserializer, State DONE
/**************************************************************************************************/
module serialc(CLK, RST_X, RXD, DATA, EN);
    input  wire   CLK, RST_X, RXD; // clock, reset, RS232C input
    output [7:0]  DATA;            // 8bit output data
    output reg    EN;              // 8bit output data enable

    reg    [7:0]   DATA;
    reg    [3:0]   stage;
    reg    [12:0]  cnt;             // counter to latch D0, D1, ..., D7
    reg    [31:0]  cnt_start;       // counter to detect the Start Bit
    wire   [31:0]  waitcnt;

    assign waitcnt = `SERIAL_WCNT;

    always @(posedge CLK) begin
        if (!RST_X) cnt_start <= 0;
        else        cnt_start <= (RXD) ? 0 : cnt_start + 1;
    end
    
    always @(posedge CLK) begin
        if(!RST_X) begin
            EN     <= 0;
            stage  <= `SS_SER_WAIT;
            cnt    <= 1;
            DATA   <= 0;
        end else if (stage == `SS_SER_WAIT) begin // detect the Start Bit
            EN <= 0;
            stage <= (cnt_start == (waitcnt >> 1)) ? `SS_SER_RCV0 : stage;
        end else begin
            if (cnt != waitcnt) begin
                cnt <= cnt + 1;
                EN <= 0;
            end else begin               // receive 1bit data
                stage  <= (stage == `SS_SER_DONE) ? `SS_SER_WAIT : stage + 1;
                EN     <= (stage == 8)  ? 1 : 0;
                DATA   <= {RXD, DATA[7:1]};
                cnt <= 1;
            end
        end
    end
endmodule

/**************************************************************************************************/




