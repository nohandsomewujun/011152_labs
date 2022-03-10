`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/17 18:49:30
// Design Name: 
// Module Name: ps
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


module ps(
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
