`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 15:06:41
// Design Name: 
// Module Name: fourbit_add
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


module fourbit_add(
    input a0,
    input a1,
    input a2,
    input a3,
    input b0,
    input b1,
    input b2,
    input b3,
    output s0,
    output s1,
    output s2,
    output s3,
    output c3
    );
    wire c00,c0,c1,c2;
    assign c00 = 0;
    onebit_add d0(a0,b0,c00,s0,c0);
    onebit_add d1(a1,b1,c0,s1,c1);
    onebit_add d2(a2,b2,c1,s2,c2);
    onebit_add d3(a3,b3,c2,s3,c3);
endmodule
