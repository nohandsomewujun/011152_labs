`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/25 21:02:41
// Design Name: 
// Module Name: leddecode
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


module leddecode(
    input [3:0] d,
    output reg [9:0] led
    );
    always @(*) begin
        if(d == 4'b1010) led = 512;
        else if(d == 4'b1110) led = 256;
        else if(d == 4'b1111) led = 128;
        else if(d == 4'b1101) led = 64;
        else if(d == 4'b1100) led = 32;
        else if(d == 4'b0100) led = 16;
        else if(d == 4'b0101) led = 8;
        else if(d == 4'b0111) led = 4;
        else if(d == 4'b0110) led = 2;
        else if(d == 4'b0010) led = 1;
        else led = 0;
    end
endmodule
