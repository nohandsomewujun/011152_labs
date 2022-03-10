`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 16:20:11
// Design Name: 
// Module Name: DIS
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

module DIS(
    input clk,
    input rst,
    input [11:0] rgb,
    output [7:0] a,
    output [6:0] led
);
wire clkd;
wire [3:0] dd;
wire [1:0] cnt;
fpq a0(rst,clk,clkd);
counter a1(clkd,rst,0,1,0,cnt);
decodercnt a4(cnt,a);
mux a2(cnt,rgb,dd);
decoder7 a3(dd,led); 
endmodule
