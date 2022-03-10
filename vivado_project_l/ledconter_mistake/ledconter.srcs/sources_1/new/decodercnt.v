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
    input [1:0] cnt,
    output reg [3:0] q
    );
    always@(*)begin
        case(cnt)
            2'b00: q = 4'b1110;
            2'b01: q = 4'b1101;
            2'b10: q = 4'b1011;
            2'b11: q = 4'b0111;
        endcase
    end
endmodule
