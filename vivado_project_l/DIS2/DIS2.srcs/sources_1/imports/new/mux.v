`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/16 19:07:07
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
    input [15:0] sw,
    output reg [3:0] d
);
always @(*) begin
    case (cnt)
        2'b00: d = sw[3:0]; 
        2'b01: d = sw[7:4];
        2'b10: d = sw[11:8];
        2'b11: d = sw[15:12];
        default: d = 0;
    endcase
end 
endmodule