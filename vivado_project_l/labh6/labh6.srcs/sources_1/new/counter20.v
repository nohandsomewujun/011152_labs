`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 21:33:32
// Design Name: 
// Module Name: counter20
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



module  counter20 #(
    parameter W = 20, 
        RST_VLU = 0
)(
    input clk, rstn, pe, ce, 
    input [W-1:0] d,
    output reg [W-1:0] cnt
);
    always @(posedge clk) begin
        if (~rstn)  cnt <= RST_VLU;
        else if (pe)  cnt <= d;
        else if (ce)  cnt <= cnt + 1; 
//      else if (ce)  cnt <= cnt - 1;
    end
endmodule
