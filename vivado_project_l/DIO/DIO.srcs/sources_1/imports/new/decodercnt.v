`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/17 17:50:19
// Design Name: 
// Module Name: decodercnt
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


module decodercnt(
    input [2:0] cnt,
    output reg [7:0] q
    );
    always@(*)begin
        case(cnt)
            3'b000: q = 8'b11111110;
            3'b001: q = 8'b11111101;
            3'b010: q = 8'b11111011;
            3'b011: q = 8'b11110111;
            3'b100: q = 8'b10111111;
            3'b101: q = 8'b01111111;
            default:q = 8'b11111111;
        endcase
    end
endmodule
