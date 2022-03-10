`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 21:40:36
// Design Name: 
// Module Name: getall_tb
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


module getall_tb(
    );
    reg [9:0] sw;
    wire [9:0] led;
    wire [6:0] n;
    getall d2(sw,led,n);
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
        #10 $finish;
     end
endmodule
