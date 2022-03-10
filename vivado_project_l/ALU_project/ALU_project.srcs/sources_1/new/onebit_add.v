`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 15:01:40
// Design Name: 
// Module Name: onebit_add
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


module onebit_add(
    input a,
    input b,
    input c,
    output s,
    output c0
    );
    assign s = a^b^c;
    assign c0 = (a&b)|((a^b)&c);
endmodule
