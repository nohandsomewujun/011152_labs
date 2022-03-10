`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ZengYX
// 
// Create Date:    13:05:25 03/31/2013 
// Design Name: 	 
// Module Name:    ps2_key 
// Project Name: 	 ps2
// Target Devices: 
// Tool versions:  14.1
// Description: 	 This module is the top of the PS/2 keyboard.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ps2_key(
	clk, rst_n,
	ps2_clk, ps2_data,
	ps2_byte, ps2_state
    );
	 
	 input clk;
	 input rst_n;
	 input ps2_clk;
	 input ps2_data; 
	 output [7:0] ps2_byte;
	 output ps2_state;
	
	 ps2scan ps2scan(.clk(clk), .rst_n(rst_n),
						  .ps2_clk(ps2_clk), .ps2_data(ps2_data),
						  .ps2_byte(ps2_byte), .ps2_state(ps2_state));	

endmodule
