`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 19:54:57
// Design Name: 
// Module Name: sir
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


module sir (
    input x,
    input rst,
    input clk,
    output y,
    output rx,
    output ry
);
wire q1,q2,q3;
jk_trigger((x&q3)|x,x&q3,rst,clk,q1);
jk_trigger(x&q1&(~q3),x&(q2),rst,clk,q2);
jk_trigger(x&q2&q1,x,rst,clk,q3);
endmodule
