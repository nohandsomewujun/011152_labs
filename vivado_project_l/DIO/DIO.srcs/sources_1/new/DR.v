`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 13:59:42
// Design Name: 
// Module Name: DR
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


module DR (
    input clk,
    input rst,
    input [3:0] data,
    input en3,
    input en4,
    input en7,
    input [15:0] rd1,
    output reg [15:0] dr
);
reg [15:0] dr_next;
always @(posedge clk) begin
    if(rst) dr <= 0;
    else dr <= dr_next;
end
always @(*) begin
    if(en7) dr_next = rd1;
    else if(en3) dr_next = (dr<<4)+data;
    else if(en4) dr_next = dr>>4;
    else dr_next = dr;
end
endmodule