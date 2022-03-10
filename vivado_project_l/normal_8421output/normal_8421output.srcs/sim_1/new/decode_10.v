`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 19:54:52
// Design Name: 
// Module Name: decode_10
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


module decode_10(
    );
    reg [3:0] inputy;
    reg gs;
    wire [9:0] y;
    decoder_10 d1(inputy,gs,y);
    initial begin
        inputy = 0;gs = 1;
        #10 inputy = 1;
        #10 inputy = 2;
        #10 inputy = 3;
        #10 inputy = 4;
        #10 gs = 0;
        #10 inputy = 5;
        #10 inputy = 6;
        #10 inputy = 7;
        #10 gs = 1;
        #10 inputy = 8;
        #10 inputy = 9;
        #10 $finish;
     end
endmodule
