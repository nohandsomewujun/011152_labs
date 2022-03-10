`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/24 21:37:39
// Design Name: 
// Module Name: getall
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


module getall(
    input [9:0] sw,
    output [9:0] led,
    output [6:0] n
    );
    wire [3:0] d;
    wire gs;
    Encoder_8421 d1(sw,d,gs);
    decoder_10 d3(d,gs,led);
    decoder_7 d4(d,gs,n);
endmodule
