`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 21:44:02
// Design Name: 
// Module Name: fls_tb
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


module fls_tb(
    );
    reg clk,rstn,en;
    reg [7:0] d;
    wire [7:0] f;
    wire err;
    FLS d0(clk,rstn,en,d,f,err);
    initial begin
    rstn = 1;
    #10 rstn = 0;
    end
    initial begin
    en = 0;
    #5 en = 1;
    end
    integer i = 0;
    initial begin
    clk = 0;
    for(;i<1000;i = i+1)
    begin
    clk = ~clk;
    end
    end
    initial begin
    d = 2;
    #20 d = 3;
    end
    
endmodule
