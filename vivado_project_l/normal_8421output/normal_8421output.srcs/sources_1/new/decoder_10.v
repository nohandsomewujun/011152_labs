`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 16:16:53
// Design Name: 
// Module Name: decoder_10
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


module decoder_10(
    input [3:0] inputy,
    input gs,
    output reg [9:0] y
    );
    always@(*) begin
        if(gs) begin
        case(inputy)
            0:y = 1;
            1:y = 2;
            2:y = 4;
            3:y = 8;
            4:y = 16;
            5:y = 32;
            6:y = 64;
            7:y = 128;
            8:y = 256;
            9:y = 512;
            default:y = 0;
        endcase
        end
        else begin 
        y = 0;
        end
        end
endmodule
