`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/01 19:17:13
// Design Name: 
// Module Name: Launch1
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


module Launch1(
    input [3:0] in,
    input en,
    input rst,
    input clk,
    output reg [3:0] out
    );
always@(posedge clk)
    if(rst) begin
        out <= 1;
     end
     else begin
        if(en) out <=in;
     end 
endmodule
