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
    input [2:0] cnt,
    input [15:0] sw,
    input [4:0] ar,
    output reg [3:0] d
);
always @(*) begin
    case (cnt)
        3'b000: d = sw[3:0]; 
        3'b001: d = sw[7:4];
        3'b010: d = sw[11:8];
        3'b011: d = sw[15:12];
        3'b100: d = ar[3:0];
        3'b101: d = {3'b000,ar[4]};
        default: d = 0;
    endcase
end 
endmodule