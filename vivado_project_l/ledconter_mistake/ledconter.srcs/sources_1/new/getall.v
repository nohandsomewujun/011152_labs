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
    input [15:0] sw,
    output [3:0] a,
    output [6:0] led,
    output reg [3:0] ledc
);
wire clkd;
wire [3:0] dd;
fpq a0(rst,clk,clkd);
counter a1(clkd,rst,0,1,0,a);
mux a2(a,sw,dd);
decoder7 a3(dd,led); 
always@(*)begin
ledc = 4'b1111;
end
endmodule