`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/16 19:04:58
// Design Name: 
// Module Name: counter
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


module counter (
    input clk,rstn,pe,ce,
    input [1:0] d,
    output reg [3:0] q
);
reg [1:0] cnt = 0;
always @(posedge clk) begin
    if(rstn) q <= 4'b1111;
    if(rstn) cnt <= 0;
    else if(pe) cnt <= d;
    else if(ce)begin
        cnt <= cnt+1;
    end 
end
always@(*)begin
    case(cnt)
        0:q = 4'b1110;
        1:q = 4'b1101;
        2:q = 4'b1011;
        3:q = 4'b0111;
        default: q = 4'b0000;
     endcase
end
endmodule