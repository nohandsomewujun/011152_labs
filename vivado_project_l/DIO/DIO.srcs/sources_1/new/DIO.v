`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 14:01:21
// Design Name: 
// Module Name: DIO
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


module DIO (
    input [15:0] d,
    input rst,
    input clk,
    input bs,
    input pre,
    input next,
    output [7:0] a,
    output [6:0] led
);
wire bs_db,bs_ps;
wire pre_db,pre_ps;
wire next_db,next_ps;
wire en1,en2,en3,en4,en5,en6,en7;
wire [15:0] d_ps;
wire [3:0] data;
wire [15:0] rd1;
wire [15:0] dr;
wire [4:0] ra;
wire [15:0] rd0;
db q0(bs,rst,clk,bs_db);
db q1(pre,rst,clk,pre_db);
db q2(next,rst,clk,next_db);
PS a0(bs_db,clk,bs_ps);
PS a1(pre_db,clk,pre_ps);
PS a2(next_db,clk,next_ps);
PS2 c1(d[0],clk,d_ps[0]);
PS2 c2(d[1],clk,d_ps[1]);
PS2 c3(d[2],clk,d_ps[2]);
PS2 c4(d[3],clk,d_ps[3]);
PS2 c5(d[4],clk,d_ps[4]);
PS2 c6(d[5],clk,d_ps[5]);
PS2 c7(d[6],clk,d_ps[6]);
PS2 c8(d[7],clk,d_ps[7]);
PS2 c9(d[8],clk,d_ps[8]);
PS2 c10(d[9],clk,d_ps[9]);
PS2 c11(d[10],clk,d_ps[10]);
PS2 c12(d[11],clk,d_ps[11]);
PS2 c13(d[12],clk,d_ps[12]);
PS2 c14(d[13],clk,d_ps[13]);
PS2 c15(d[14],clk,d_ps[14]);
EDC q3(d_ps,data);
fsm q4(d_ps,bs_ps,pre_ps,next_ps,rst,clk,en1,en2,en3,en4,en5,en6,en7);
DR q5(clk,rst,data,en3,en4,en7,rd1,dr);
AR q6(clk,en1,en5,en6,ra);
RF q7(clk,0,ra,ra,dr,en2,rd0,rd1);
getall q8(clk,rst,ra,dr,a,led);
endmodule


