`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/25 20:46:22
// Design Name: 
// Module Name: pre_encode
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


module pre_encode(
    input [9:0] sw,
    output reg [3:0] d
    );
    always @(*) begin
        if(sw[9])
        d = 4'b1010;
        else if(sw[8])
        d = 4'b1110;
        else if(sw[7])
        d = 4'b1111;
        else if(sw[6])
        d = 4'b1101;
        else if(sw[5])
        d = 4'b1100;
        else if(sw[4])
        d = 4'b0100;
        else if(sw[3])
        d = 4'b0101;
        else if(sw[2])
        d = 4'b0111;
        else if(sw[1])
        d = 4'b0110;
        else if(sw[0])
        d = 4'b0010;
        else d = 0; 
    end    
endmodule
