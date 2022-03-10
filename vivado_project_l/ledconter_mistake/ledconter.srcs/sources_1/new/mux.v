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
    input [3:0] q,
    input [15:0] sw,
    output reg [3:0] d
);
always @(*) begin
    case (q)
        4'b1110: d = sw[3:0]; 
        4'b1101: d = sw[7:4];
        4'b1011: d = sw[11:8];
        4'b0111: d = sw[15:12];
        default: d = 0;
    endcase
end 
endmodule