`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 19:56:41
// Design Name: 
// Module Name: decoder_7_tb
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


module decoder_7_tb(
    );
    reg [3:0] inputn;
    reg gs;
    wire [6:0] n;
    decoder_7 d1(inputn,gs,n);
    initial begin
        inputn = 0;gs = 1;
        #10 inputn = 1;
        #10 inputn = 2;
        #10 gs = 0;
        #10 inputn = 3;
        #10 gs = 1;
        #10 inputn = 4;
        #10 inputn = 5;
        #10 inputn = 6;
        #10 inputn = 7;
        #10 inputn = 8;
        #10 inputn = 9;
        #10 $finish;
    end     
endmodule
