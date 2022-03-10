`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 21:32:21
// Design Name: 
// Module Name: DB
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


module DB (
    input x,
    input rstn,
    input clk,
    output reg y
);
integer N = 1000000;
integer cnt = 0;
integer cnt1 = 1000000;
always @(posedge clk) begin
    if(rstn) cnt <= 0;
    else if(x&&cnt < N) cnt <= cnt+1;
    else if(x == 0) cnt <= 0;
end
always @(posedge clk) begin
    if(rstn) cnt1 <= N;
    else if(x == 0 && cnt1 >0) cnt1 <= cnt1-1;
    else if(x == 1) cnt1 <= N;
end
always @(*) begin
    if(cnt == N) y = 1;
    else if(cnt1 == 0) y = 0;
end
endmodule

