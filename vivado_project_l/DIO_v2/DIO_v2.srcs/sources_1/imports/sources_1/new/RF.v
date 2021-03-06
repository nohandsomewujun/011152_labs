`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 13:53:55
// Design Name: 
// Module Name: RF
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



module RF #(
    parameter AW = 5,
    parameter DW = 16
)(
    input en8,
    input rst,
    input clk,
    input [AW-1:0] ra0,
    input [AW-1:0] ra1,  //读地址 
    input [AW-1:0] wa,   //写地址
    input [DW-1:0] wd,  //写数据
    input we,               //写使能
    output [DW-1:0] rd0,
    output [DW-1:0] rd1,  //读数据
    output reg [DW-1:0] de //统计周期数
);
reg [DW-1:0] rf [0:(1<<AW)-1];
assign rd0 = rf[ra0];
assign rd1 = rf[ra1];
always @(posedge clk) begin
    if(rst) begin de <= 0; end
    else begin
    if(en8) begin
        rf[ra1] <= rd0;
        rf[ra0] <= rd1;
       //交换顺序
        de <= de+1;
    end
    else begin 
        if(we) rf[wa] <= wd;
    end
    end
end
endmodule


