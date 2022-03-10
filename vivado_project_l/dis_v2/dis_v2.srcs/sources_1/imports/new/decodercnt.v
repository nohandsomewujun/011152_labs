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
    input [15:0] sw,
    output reg [3:0] q
    );
    reg [3:0] d1;
reg [3:0] d2;
reg [3:0] d3;
reg [3:0] d4;
always@(*)begin
    d1 = sw[3:0];
    d2 = sw[7:4];
    d3 = sw[11:8];
    d4 = sw[15:12];
end
    always@(*)begin
        case(cnt)
            2'b00: q = 4'b1110;
            2'b01: /*if(d4 == 0&&d3 == 0&&d2 == 0)q = 4'b1111;else */q = 4'b1101;
            2'b10: /*if(d4 == 0&&d3 == 0)q = 4'b1111;else */q = 4'b1011;
            2'b11: /*if(d4 == 0)q = 4'b1111;else */q = 4'b0111;
        endcase
    end
endmodule
