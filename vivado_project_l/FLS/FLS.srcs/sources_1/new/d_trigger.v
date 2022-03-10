`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 12:25:26
// Design Name: 
// Module Name: d_trigger
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


module d_trigger (
    input [7:0] x,
    input clk,
    input rst,
    output reg [7:0] d 
);
always@(posedge clk)begin
    if(rst) d <= 0;
    else d <= x;
end
endmodule