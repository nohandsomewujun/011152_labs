`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 13:56:17
// Design Name: 
// Module Name: EDC
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


module EDC (
    input [15:0] d,
    output reg [3:0] data
);
always @(*) begin
    case(d)
        16'b0000000000000001: data = 0;
        16'b0000000000000010: data = 1;
        16'b0000000000000100: data = 2;
        16'b0000000000001000: data = 3;
        16'b0000000000010000: data = 4;
        16'b0000000000100000: data = 5;
        16'b0000000001000000: data = 6;
        16'b0000000010000000: data = 7;
        16'b0000000100000000: data = 8;
        16'b0000001000000000: data = 9;
        16'b0000010000000000: data = 10;
        16'b0000100000000000: data = 11;
        16'b0001000000000000: data = 12;
        16'b0010000000000000: data = 13;
        16'b0100000000000000: data = 14;
        16'b1000000000000000: data = 15;
        default:data = 0;
    endcase
end 
endmodule
