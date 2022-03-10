`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/25 21:53:29
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
    pre_encode d1(sw,d);
    light_decode d2(d,n);
    leddecode d3(d,led);
endmodule
