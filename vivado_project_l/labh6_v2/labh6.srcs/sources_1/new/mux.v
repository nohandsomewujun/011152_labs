`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 17:21:53
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

module mux (
    input [1:0] cnt,
    input [11:0] rgb,
    output reg [3:0] d
);
always @(*) begin
    case (cnt)
        2'b00: d = rgb[3:0]; 
        2'b01: d = rgb[7:4];
        2'b10: d = rgb[11:8];
        default: d = 0;
    endcase
end 
endmodule
