`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:16 03/31/2013 
// Design Name: 
// Module Name:    top 
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
module top(clk, rst_n,
			  ps2_clk, ps2_data,
			  hsync, vsync,
			  vga_r, vga_g, vga_b,
			  ps2_byte, ps2_state);
	 
	input clk;
	input rst_n;
	input ps2_clk;
	input ps2_data;
	output	hsync, vsync;
	output [2:0] vga_r;
	output [2:0] vga_g;
	output [1:0] vga_b;
	output [7:0] ps2_byte;
	output ps2_state;
	
	reg cnt;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) 
			cnt <= 1'b0;
		else 
			cnt <= cnt + 1'b1;
	end
	
	wire clk_50m;
	assign clk_50m = cnt;
	
	ps2_key ps2_key(.clk(clk_50m), .rst_n(rst_n),
						 .ps2_clk(ps2_clk), .ps2_data(ps2_data),
						 .ps2_byte(ps2_byte), .ps2_state(ps2_state));
	wire clk_100m;
	assign clk_100m = clk;
	
	vga_dis_test vga_dis_test(.clk_100m(clk_100m), .rst_n(rst_n), .ps2_byte(ps2_byte),
						 			  .hsync(hsync), .vsync(vsync),
									  .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b));
									

endmodule
