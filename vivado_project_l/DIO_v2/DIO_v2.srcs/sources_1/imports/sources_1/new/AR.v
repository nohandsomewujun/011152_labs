`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 14:00:34
// Design Name: 
// Module Name: AR
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


module AR (
    input clk,
    input en1,
    input en5,
    input en6,
    output reg [4:0] ra
);
reg [4:0] ra_next;
always @(posedge clk) begin
    ra <= ra_next;
end
always @(*) begin
    if(en1) ra_next = 0;
    else if(en5) ra_next = ra+1;
    else if(en6) ra_next = ra-1;
    else ra_next = ra;
end
endmodule
