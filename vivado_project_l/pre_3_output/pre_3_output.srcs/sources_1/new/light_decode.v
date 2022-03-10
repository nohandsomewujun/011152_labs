`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/25 21:39:48
// Design Name: 
// Module Name: light_decode
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


module light_decode(
    input [3:0] d,
    output reg [6:0] n
    );
    always @(*) begin
        if(d == 0) n = 7'b1111111;
        else if(d == 4'b0010) n = 7'b000_0001;
        else if(d == 4'b0110) n = 7'b100_1111;
        else if(d == 4'b0111) n = 7'b001_0010;
        else if(d == 4'b0101) n = 7'b000_0110;
        else if(d == 4'b0100) n = 7'b100_1100;
        else if(d == 4'b1100) n = 7'b010_0100;
        else if(d == 4'b1101) n = 7'b010_0000;
        else if(d == 4'b1111) n = 7'b000_1111;
        else if(d == 4'b1110) n = 7'b000_0000;
        else if(d == 4'b1010) n = 7'b000_1100;
        else n = 7'b1111111;
    end
endmodule
