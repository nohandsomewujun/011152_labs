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


module getall (
    input clk,
    input rst,
    input [4:0] ar,
    input [15:0] sw,
    output [7:0] a,
    output [6:0] led
);
wire clkd;
wire [3:0] dd;
wire [2:0] cnt;
fpq a0(rst,clk,clkd);
counter a1(clkd,rst,0,1,0,cnt);
decodercnt a4(cnt,a);
mux a2(cnt,sw,ar,dd);
decoder7 a3(dd,led); 
endmodule