`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 21:46:44
// Design Name: 
// Module Name: PS2
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


module PS2(
    input a,
    input clk,
    output p
    );
    wire b;
    wire c;
    wire s;
    wire v;
    d_trigger a0(a,clk,b);
    d_trigger a1(b,clk,s);
    d_trigger a2(s,clk,c);
    d_trigger a3(c,clk,v);
    assign p = (~v)&s;
endmodule