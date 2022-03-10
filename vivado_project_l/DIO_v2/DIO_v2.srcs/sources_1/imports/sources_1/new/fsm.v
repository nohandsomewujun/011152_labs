`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/21 13:57:22
// Design Name: 
// Module Name: fsm
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


module fsm (
    input [4:0] ra,
    input [15:0] rd0,
    input [15:0] rd1,
    input [15:0] d,
    input bs,
    input pre,
    input next,
    input rst,
    input clk,
    input exe,
    output reg en1, //置AR为0，相当于AR的rst
    output reg en2, //寄存器堆的写使能
    output reg en3, //DR的左移使能
    output reg en4, //DR的右移使能
    output reg en5, //AR的加一使能
    output reg en6, //AR的减一使能
    output reg en7,
    output reg en8,  //排序使能
    output reg busy
);
reg [3:0] state;
reg [3:0] nextstate;
integer i = 0;
always @(posedge clk or posedge rst) begin
    if(rst) begin state <= 0;i <= 0; end
    else state <= nextstate;
end
always @(*) begin
    case(state)
        4'b0000:begin en1 = 1;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0;en8 = 0; nextstate = 4'b0001;busy = 0; end
        4'b0001:begin en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 1;en8 = 0; nextstate = 4'b0010;busy = 0; end
        4'b0010:begin en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0;en8 = 0;busy = 0;
                     if(d != 0) nextstate = 4'b0011;
                     else if(next) nextstate = 4'b0101;
                     else if(pre) nextstate = 4'b0110;
                     else if(bs) nextstate = 4'b0100;
                     else if(exe) nextstate = 4'b0111;
                     else nextstate = 4'b0010;
                    end
        4'b0011:begin busy = 0;en1 = 0;en2 = 0;en3 = 1;en4 = 0;en5 = 0;en6 = 0;en7 = 0;en8 = 0;nextstate = 4'b0010; end
        4'b0100:begin busy = 0;en1 = 0;en2 = 0;en3 = 0;en4 = 1;en5 = 0;en6 = 0;en7 = 0;en8 = 0;nextstate = 4'b0010; end
        4'b0101:begin busy = 0;en1 = 0;en2 = 1;en3 = 0;en4 = 0;en7 = 0;nextstate = 4'b0001;en5 = 1;en6 = 0;en8 = 0;end
        4'b0110:begin busy = 0;en1 = 0;en2 = 1;en3 = 0;en4 = 0;en7 = 0;nextstate = 4'b0001;en6 = 1; en5 = 0;en8 = 0;end
        4'b0111:begin
            busy = 0;
            if(rd0 < rd1) begin
                en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0;en8 = 1;nextstate = 4'b1000; 
            end else begin
                en8 = 0;if(ra == 30) begin
                    en1 = 1;en2 = 0;en3 = 0;en4 = 0;en7 = 0;en5 = 0;en6 = 0;nextstate = 4'b0010; 
                end else begin
                    en5 = 1;nextstate = 4'b0111;en1 = 0;en2 = 0;en3 = 0;en4 = 0;en6 = 0;en7 = 0;en8 = 0;
                end
            end
        end
        4'b1000:begin
        busy = 1;
            en8 = 0;nextstate = 4'b0111;
            if(ra > 0)begin
                en6 = 1;
                en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en7 = 0;
            end else begin
                en1 = 0;
                en2 = 0;
                en3 = 0;
                en4 = 0;
                en7 = 0;
                en6 = 0;
                en5 = 0;
            end
        end
        default:begin nextstate = 0;en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0;en8 = 0; end
    endcase
end
endmodule
