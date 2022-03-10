`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 16:16:53
// Design Name: 
// Module Name: Encoder_8421
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


module Encoder_8421(
    input [9:0] sw,
    output reg [3:0] d,
    output reg gs
    );
    always @(*)
        case(sw)
            1:begin d = 4'b0000;gs = 1; end
            2:begin d = 4'b0001;gs = 1;end
            4:begin d = 4'b0010;gs = 1;end
            8:begin d = 4'b0011;gs = 1;end
            16:begin d = 4'b0100;gs = 1;end
            32:begin d = 4'b0101;gs = 1;end
            64:begin d = 4'b0110;gs = 1;end
            128:begin d = 4'b0111;gs = 1;end
            256:begin d = 4'b1000;gs = 1;end
            512:begin d = 4'b1001;gs = 1;end
            default:begin d = 0;gs = 0;end
        endcase                    
endmodule
