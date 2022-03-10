`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:46 03/14/2013 
// Design Name: 
// Module Name:    vga_dis_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga_dis_test(
	clk_100m, rst_n, ps2_byte,
	hsync, vsync,
	vga_r, vga_g, vga_b	
    );
	
	input clk_100m;
	input rst_n;
	input [7:0] ps2_byte;
	output hsync, vsync;
	output [2:0] vga_r;
	output [2:0] vga_g;
	output [1:0] vga_b;
	
	reg cnt;
	
	always @( posedge clk_100m or negedge rst_n ) begin
		if( !rst_n ) 
			cnt <= 1'b0;
		else	
			cnt <= cnt + 1'b1;
	end

	wire clk50m;
	
	assign clk50m = cnt;	
	
	vga_dis vga_dis(.clk(clk50m), .rst_n(rst_n), .ps2_byte(ps2_byte),
						 .hsync(hsync), .vsync(vsync),
						 .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b));

endmodule
