`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    
// Design Name:    
// Module Name:    
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 欢迎加入EDN的FPGA/CPLD助学小组一起讨论：http://group.ednchina.com/1375/
////////////////////////////////////////////////////////////////////////////////
module vga_dis(
			clk, rst_n,
			hsync, vsync,
			ps2_byte,
			vga_r, vga_g, vga_b
		);

	input clk;		//50MHz
	input rst_n;	//低电平复位
	input [7:0] ps2_byte;
	output hsync;	//行同步信号
	output vsync;	//场同步信号
	output [2:0] vga_r;
	output [2:0] vga_g;
	output [1:0] vga_b;

	//--------------------------------------------------
	reg[10:0] x_cnt;	//行坐标
	reg[9:0] y_cnt;	//列坐标

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			x_cnt <= 11'd0;
		else if(x_cnt == 11'd1039) 
			x_cnt <= 11'd0;
		else 
			x_cnt <= x_cnt+1'b1;
	end		

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			y_cnt <= 10'd0;
		else if(y_cnt == 10'd665) 
			y_cnt <= 10'd0;
		else if(x_cnt == 11'd1039) 
			y_cnt <= y_cnt+1'b1;
	end		
			

	//--------------------------------------------------
	wire valid;	//有效显示区标志

	assign valid = (x_cnt >= 11'd187) && (x_cnt < 11'd987) && 
						(y_cnt >= 10'd31) && (y_cnt < 10'd631); 

	wire [10:0] xpos;
	wire [9:0] ypos;	//有效显示区坐标

	assign xpos = x_cnt - 11'd187;
	assign ypos = y_cnt - 10'd31;

	//--------------------------------------------------
	reg hsync_r,vsync_r;	//同步信号产生

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			hsync_r <= 1'b1;
		else if(x_cnt == 11'd0) 
			hsync_r <= 1'b0;								//产生hsync信号
		else if(x_cnt == 11'd120) 
			hsync_r <= 1'b1;
	end		
	 
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			vsync_r <= 1'b1;
		else if(y_cnt == 10'd0) 
			vsync_r <= 1'b0;								//产生vsync信号
		else if(y_cnt == 10'd6) 
			vsync_r <= 1'b1;
	end		

	assign hsync = hsync_r;
	assign vsync = vsync_r;

	//--------------------------------------------------
	wire [15:0] charline;
	reg [3:0] nextline;
	wire [15:0] rom_temp;
	
	assign charline = (ps2_byte == 16'h41) ? rom_temp : 16'hff;
	
	//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
	rom your_instance_name (
	  .a({1'b0,nextline}), // input [4 : 0] a
	  .spo(rom_temp) // output [15 : 0] spo
	);
	// INST_TAG_END ------ End INSTANTIATION Template ---------
		
	
	reg [3:0] charbit;	// 显示位计算 16 * 16
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) 
			charbit <= 4'd0;
		else if (x_cnt == 10'd484) 
			charbit <= 4'd0;
		else if (x_cnt > 10'd484 && x_cnt < 10'd500)
			charbit <= charbit + 1'b1;
		else
			charbit <= 4'd0;
	end
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) 
			nextline <= 4'd0;
		else if (charbit == 4'hf)
			nextline <= nextline + 1'b1;
		else if (ypos < 10'd200 || ypos >= 10'd216)
			nextline <= 4'd0;
		else	
			;
	end

	reg [7:0] vga_rgb;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n)
			vga_rgb <= 8'd0;
		else if (!valid)
			vga_rgb <= 8'd0;
		else if (x_cnt >= 10'd484 && x_cnt < 10'd500) begin
			if(ypos >= 10'd200 && ypos < 10'd216) begin
				if (charline[charbit])	
					vga_rgb <= 8'hff;
				else 
					vga_rgb <= 8'd0;		
			end
			else	
				vga_rgb <= 8'd0;	
		end
		else
			vga_rgb <= 8'd0;
	end	

	assign { vga_r, vga_g, vga_b } = vga_rgb;

endmodule
