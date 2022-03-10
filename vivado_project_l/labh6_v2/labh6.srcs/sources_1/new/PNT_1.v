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
    input delete,
    output [7:0] a,
    output [6:0] led,
    output [3:0] pred,	
    output [3:0] pgreen, 	
    output [3:0] pblue, 	
    output hs,		
    output vs		
);

wire [3:0] direction;

wire [11:0] rgb;

wire [14:0] raddress;
wire [14:0] wradress;

wire [11:0] wdata;
wire [11:0] rdata;
wire [11:0] pdata;

wire [11:0] ppdata;

wire [11:0] initialdata;

wire [10:0] hadress;
wire [10:0] vadress;

wire wedraw;
wire pclk;

wire [7:0] x,y;

wire up_db;
wire down_db;
wire left_db;
wire right_db;

wire up_ps;
wire down_ps;
wire left_ps;
wire right_ps;

DB db1(up,rstn,clk,up_db);
DB db2(down,rstn,clk,down_db);
DB db3(left,rstn,clk,left_db);
DB db4(right,rstn,clk,right_db);

PS ps1(up_db,clk,up_ps);
PS ps2(down_db,clk,down_ps);
PS ps3(left_db,clk,left_ps);
PS ps4(right_db,clk,right_ps);

assign direction = {right_ps,left_ps,down_ps,up_ps};

assign pred = ppdata[3:0];
assign pgreen = ppdata[7:4];
assign pblue = ppdata[11:8];

assign rgb = {red,green,blue};

clk50 ip1(.clk_in1(clk),.reset(0),.clk_out1(pclk));
ROM ip2(.addra(wradress),.clka(clk),.douta(initialdata));
VRAM ip3(.addra(wradress),.clka(clk),.dina(wdata),.wea(wedraw),.addrb(raddress),.clkb(clk),.doutb(rdata));

DIS d0(.clk(clk),.rst(rstn),.rgb(rgb),.a(a),.led(led));
VSD d1(.clk(pclk),.rst(rstn),.rd_data(pdata),.hs(hs),.vs(vs),.vga_data(ppdata),.h_cnt(hadress),.v_cnt(vadress));
PCU d2(.clk(clk),.rstn(rstn),.rgb(rgb),.direction(direction),.draw(draw),.outadress(wradress),.outputdata(wdata),.we(wedraw),.x(x),.y(y),.delete(delete),.initialdata(initialdata));
SRA d3(.haddress(hadress),.vaddress(vadress),.rdata(rdata),.xad(x),.yad(y),.raddress(raddress),.pdata(pdata));

endmodule