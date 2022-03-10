`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 20:20:13
// Design Name: 
// Module Name: d_trigger_rgi
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


module d_trigger_rig (
    input x,
    input rst,
    input clk,
    output [7:0] r
);
d_trigger d0(x,clk,rst,r[0]);
d_trigger d1(r[0],clk,rst,r[1]);
d_trigger d2(r[1],clk,rst,r[2]);
d_trigger d3(r[2],clk,rst,r[3]);
d_trigger d4(r[3],clk,rst,r[4]);
d_trigger d5(r[4],clk,rst,r[5]);
d_trigger d6(r[5],clk,rst,r[6]);
d_trigger d7(r[6],clk,rst,r[7]);
endmodule