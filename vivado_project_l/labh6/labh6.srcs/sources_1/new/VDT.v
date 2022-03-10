`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 15:22:38
// Design Name: 
// Module Name: VDT
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


module VDT(
input clk,rst,//clk=65MHz
//output [9:0] h_addr,v_addr,
//output rd_vld,
input  [11:0] rd_data, //r[3:0],g[3:0],b[3:0]
output reg hs,vs,
output [11:0] vga_data,  //rgb
output reg [10:0]  h_cnt,v_cnt
);

reg  h_de,v_de;//data_enable

parameter H_CNT = 11'd1039; 
parameter V_CNT = 11'd665; 

//行逐次加一扫描，到达尽头时归0
always@(posedge clk)
begin
    if(rst)
        h_cnt   <= 11'd0;
    else if(h_cnt >= 11'd1039)
        h_cnt   <= 11'd0;
    else
        h_cnt   <= h_cnt + 11'd1;
end

//场在行到达尽头时加一，场到达尽头时归0
always@(posedge clk)
begin
    if(rst)
        v_cnt   <= 11'd0;
    else if(h_cnt == 11'd1039)
    begin
        if(v_cnt >= 11'd665)
            v_cnt   <= 11'd0;
        else
            v_cnt   <= v_cnt + 11'd1;
    end
end

//描述行使能信号
always@(posedge clk)
begin
    if(rst)
        h_de <= 1'b0;
    else if((h_cnt >= 184)&&(h_cnt <= 983))
        h_de <= 1'b1;
    else
        h_de <= 1'b0;
end

//描述场使能信号
always@(posedge clk)
begin
    if(rst)
        v_de <= 1'b0;
    else if((v_cnt>=29)&&(v_cnt<=628))
        v_de <= 1'b1;
    else
        v_de <= 1'b0;
end


always@(posedge clk)
begin
    if(rst)
        hs  <= 1'b1;
    else if(h_cnt <= 11'd119)
        hs  <= 1'b0;
    else
        hs  <= 1'b1;
end


always@(posedge clk)
begin
    if(rst)
        vs  <= 1'b1;
    else if(v_cnt <= 11'd5)
        vs  <= 1'b0;
    else
        vs  <= 1'b1;
end

assign vga_data = ((v_de == 1) && (h_de == 1)) ? rd_data : 12'h0;

endmodule
