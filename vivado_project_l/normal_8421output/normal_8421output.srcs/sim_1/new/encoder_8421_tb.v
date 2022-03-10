`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 18:11:38
// Design Name: 
// Module Name: encoder_8421_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module encoder_8421_tb(
    );
    reg [9:0]sw;
    wire [3:0]d;
    reg gs;
    Encoder_8421 d1(sw,d,gs);
    initial begin
        sw = 1;
        #10 sw = 2;
        #10 sw = 4;
        #10 sw = 8;
        #10 sw = 16;
        #10 sw = 32;
        #10 sw = 64;
        #10 sw = 128;
        #10 sw = 256;
        #10 sw = 512;
        #10 sw = 3;
        #10 $finish;
     end
endmodule
