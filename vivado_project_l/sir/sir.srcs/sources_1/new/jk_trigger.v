`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 19:32:52
// Design Name: 
// Module Name: jk_trigger
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


module jk_trigger (
    input j,
    input k,
    input rst,
    input clk,
    output reg q
);
always@(posedge clk)begin
    if(rst) q <= 0;
    else begin
        q <= (j&(~q))|((~k)&q);
    end
end
endmodule