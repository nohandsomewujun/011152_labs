`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/16 19:08:28
// Design Name: 
// Module Name: decoder7
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


module decoder7(
    input [3:0] d,
    output reg [6:0] led
);
always @(*) begin
    case (d)
        0:led = 7'b0000_001;
        1:led = 7'b1001_111;
        2:led = 7'b0010_010;
        3:led = 7'b0000_110;
        4:led = 7'b1001_100;
        5:led = 7'b0100_100;
        6:led = 7'b0100_000;
        7:led = 7'b0001_111;
        8:led = 7'b0000_000;
        9:led = 7'b0001_100;
        10:led = 7'b0001_000;
        11:led = 7'b0000_000;
        12:led = 7'b0110_001;
        13:led = 7'b0000_001;
        14:led = 7'b0110_000;
        15:led = 7'b0111_000;
        default: led = 0; 
    endcase
end
endmodule
