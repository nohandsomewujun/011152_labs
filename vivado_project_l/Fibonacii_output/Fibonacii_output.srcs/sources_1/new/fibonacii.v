`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/30 11:43:11
// Design Name: 
// Module Name: fibonacii
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


module fibonacii(
    input en,
    input rst,
    input clk,
    output [3:0] fn,
    output cf,
    output of,
    output zf
    );
    wire [3:0] in0;
    wire [3:0] out0;
    wire [3:0] in1;
    Launch0 a0(in0,en,rst,clk,out0);
    Launch1 a1(fn,en,rst,clk,in0);
    ALU a2(out0,in0,3'b000,fn,cf,of,zf);
endmodule
