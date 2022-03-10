`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 19:12:27
// Design Name: 
// Module Name: Print
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

module  Print (
    input clk, 
    input rstn,		
    input up,		
    input down,		
    input left,		
    input right,		
    input [3:0] red,  	
    input [3:0] green, 	
    input [3:0] blue, 	
    input draw,		
    output [3:0] pred,	
    output [3:0] pgreen, 	
    output [3:0] pblue, 	
    output hs,		//行同步
    output vs		//场同步
);

wire we;            //画笔使能
wire pclk;          //50mhz
wire [11:0] rgb;    //颜色
wire [3:0] dir;     //方向
wire [14:0] waddr;  //存储位置
wire [14:0] raddr;  //存储位置
//color
wire [11:0] wdata;  
wire [11:0] rdata;
wire [11:0] pdata;
wire [11:0] outputdata; 
wire [10:0] h_addr;
wire [10:0] v_addr;

wire up_db,down_db,left_db,right_db;
wire up_ps,down_ps,left_ps,right_ps;

DB db1(up,rstn,clk,up_db);
DB db2(down,rstn,clk,down_db);
DB db3(left,rstn,clk,left_db);
DB db4(right,rstn,clk,right_db);

PS ps1(up_db,clk,up_ps);
PS ps2(down_db,clk,down_ps);
PS ps3(left_db,clk,left_ps);
PS ps4(right_db,clk,right_ps);

clk50 c1(.clk_in1(clk),.reset(0),.clk_out1(pclk));
PCU p5(.clk(clk),.rstn(rstn),.rgb(rgb),.dir(dir),.draw(draw),.waddr(waddr),.wdata(wdata),.we(we));
VRAM v1(.addra(waddr),.clka(clk),.dina(wdata),.wea(we),.addrb(raddr),.clkb(clk),.doutb(pdata));
SRA s1(.h_addr(h_addr),.v_addr(v_addr),.rdata(rdata),.raddr(raddr),.pdata(pdata));
VDT v2(.clk(pclk),.rst(rstn),.rd_data(pdata),.hs(hs),.vs(vs),.vga_data(outputdata),.h_cnt(h_addr),.v_cnt(v_addr));

assign dir = {up_ps,down_ps,left_ps,right_ps};
assign rgb = {red,green,blue};
assign pred = outputdata[3:0];
assign pgreen = outputdata[7:4];
assign pblue = outputdata[11:8];

endmodule