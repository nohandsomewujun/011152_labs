`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 23:10:50
// Design Name: 
// Module Name: sir_tb
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


module sir_tb(
 );
 wire y;
 reg x;
 reg clk;
 reg rstn;
 
 wire [7:0] rx;
 wire [7:0] ry;
 integer i;
 sir d0(x,rstn,clk,y,rx,ry);
 initial begin
    rstn = 1;
    #3 rstn = 0;
 end
 initial begin
    clk = 0;
    for(i = 1;i<1000;i = i+1)
    begin
        #5 clk = ~clk;
    end
 end
 initial begin
    x = 0;
    for(i = 1;i<1000;i = i+1)
    begin
        #200 x = ~x;
    end  
 end
endmodule
