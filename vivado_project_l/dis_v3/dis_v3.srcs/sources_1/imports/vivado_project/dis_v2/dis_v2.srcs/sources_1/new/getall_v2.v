`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/16 19:10:10
// Design Name: 
// Module Name: getall
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


module getall_v2 (
    input btnc,
    input clk,
    input rst,
    output [3:0] a,
    output [6:0] led,
    output [3:0] ledc
);
wire y;
wire p;
wire q;
wire t;
wire [15:0] cnt;
db d0(btnc,rst,clk,y);
ps d1(y,clk,p);
cnt3 d5(y,clk,q);
assign t = p|q;
counter_v2 d2(clk,rst,0,t,0,cnt);
getall d3(clk,rst,cnt,a,led,ledc);
endmodule
