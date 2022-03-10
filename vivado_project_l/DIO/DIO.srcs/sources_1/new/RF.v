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
    input clk,
    input [AW-1:0] ra0,
    input [AW-1:0] ra1,  //����ַ 
    input [AW-1:0] wa,   //д��ַ
    input [DW-1:0] wd,  //д����
    input we,               //дʹ��
    output [DW-1:0] rd0,
    output [DW-1:0] rd1   //������
);
reg [DW-1:0] rf [0:(1<<AW)-1];
assign rd0 = rf[ra0];
assign rd1 = rf[ra1];
always @(posedge clk) begin
    if(we) rf[wa] <= wd;
end
endmodule