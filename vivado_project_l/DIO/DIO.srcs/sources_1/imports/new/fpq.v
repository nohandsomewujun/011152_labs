`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/16 19:03:56
// Design Name: 
// Module Name: fpq
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


module fpq (
    input rst,
    input clk,
    output clkd
);
reg [12:0] cnt = 0;
parameter N = 8000;
always@(posedge clk) begin
    if(rst) cnt <= 0;
    else cnt <= cnt+1;
end
assign clkd = (cnt == (N-2));
endmodule
