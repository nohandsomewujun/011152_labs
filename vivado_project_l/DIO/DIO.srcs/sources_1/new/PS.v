`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 19:32:56
// Design Name: 
// Module Name: PS
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



module PS(
    input a,
    input clk,
    output p
    );
    wire b;
    wire c;
    wire s;
    d_trigger a0(a,clk,b);
    d_trigger a1(b,clk,s);
    d_trigger a2(s,clk,c);
    assign p = (~c)&s;
endmodule


