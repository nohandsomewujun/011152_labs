`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 18:46:32
// Design Name: 
// Module Name: SRA
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


module SRA(
    input [10:0] h_cnt,
    input [10:0] v_cnt,
    input [11:0] rdata,
    output [14:0] raddr,
    output [11:0] pdata
    );

    reg [11:0] h,v;

    always @(*) begin
        if(h_cnt < 184 || v_cnt < 29) begin
            h = 0;
            v = 0;
        end
        else begin
            h = (h_cnt - 184)/4;
            v = (v_cnt - 29)/4;
        end
    end
    
    assign raddr = v*200 + h;
    assign pdata = rdata;
endmodule