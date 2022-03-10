`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:22:26
// Design Name: 
// Module Name: mux
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


module mux(
    input [7:0] d0,
    input [7:0] d1,
    input [1:0] state,
    output reg [7:0] d2 
    );
    always@(*)begin
        if((state == 2'b00) || (state == 2'b01)) begin
            d2 = d0;
        end
        else d2 = d1;
    end
endmodule
