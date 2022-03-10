`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/18 16:16:42
// Design Name: 
// Module Name: cnt3
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


module cnt3(
    input y,
    input clk,
    output p
    );
    reg [25:0] i = 0;
    always@(posedge clk)begin
        if(y == 1) i <= i+1;
        else i <= 0;
    end
    assign p = (i == 26'b11111111111111111111111111);
endmodule
