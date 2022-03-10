`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 16:16:53
// Design Name: 
// Module Name: decoder_7
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


    module decoder_7(
    input [3:0] inputn,
    input gs,
    output reg [6:0] n
    );
    always@(*) begin
        if(gs) begin
        case(inputn)
            0:n = 7'b0000_001;
            1:n = 7'b1001_111;
            2:n = 7'b0010_010;
            3:n = 7'b0000_110;
            4:n = 7'b1001_100;
            5:n = 7'b0100_100;
            6:n = 7'b0100_000;
            7:n = 7'b0001_111;
            8:n = 7'b0000_000;
            9:n = 7'b0001_100;
            default n =7'b0000_001;
         endcase
         end
         else n = 7'b1111_111;
         end
endmodule
