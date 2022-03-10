`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/30 10:48:21
// Design Name: 
// Module Name: a_b_add
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


module a_b_add(
    input [3:0] a,
    input [3:0] b,
    output [3:0] y,
    output reg cf,
    output reg of,
    output reg zf
    );
    wire [4:0] c;
    onebit_add d0(a[0],b[0],0,y[0],c[1]);
    onebit_add d1(a[1],b[1],c[1],y[1],c[2]);
    onebit_add d2(a[2],b[2],c[2],y[2],c[3]);
    onebit_add d3(a[3],b[3],c[3],y[3],c[4]);
    always@(*) begin
        cf = c[4];
        of = c[3]^c[4];
        if(y == 0) zf = 1;
        else zf = 0;
    end
endmodule

