`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/18 21:11:29
// Design Name: 
// Module Name: getall_v2_tb
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
reg clk;
reg rst;
wire [3:0] a;
wire [6:0] led;
reg btnc;
getall_v2 a9(btnc,clk,rst,a,led);
integer i;
initial begin
clk = 0;
for(i = 0;i<1000000;i = i+1)begin
#0.001 clk = ~clk;
end
end
initial begin
rst =1;
#5 rst = 0;
end
initial begin
btnc = 1;
#10 btnc = 0;
#100 btnc = 1;
#10 btnc = 0;
#100 btnc = 1;
#10 btnc = 0;
#100 btnc = 1;
end
endmodule