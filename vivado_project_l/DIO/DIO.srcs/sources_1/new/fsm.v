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
    input [15:0] d,
    input bs,
    input pre,
    input next,
    input rst,
    input clk,
    output reg en1, //置AR为0，相当于AR的rst
    output reg en2, //寄存器堆的写使能
    output reg en3, //DR的左移使能
    output reg en4, //DR的右移使能
    output reg en5, //AR的加一使能
    output reg en6, //AR的减一使能
    output reg en7
);
reg [2:0] state;
reg [2:0] nextstate;
always @(posedge clk or posedge rst) begin
    if(rst) state <= 0;
    else state <= nextstate;
end
always @(*) begin
    case(state)
        3'b000:begin en1 = 1;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0; nextstate = 3'b001; end
        3'b001:begin en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 1; nextstate = 3'b010; end
        3'b010:begin en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0;
                     if(d != 0) nextstate = 3'b011;
                     else if(next) nextstate = 3'b101;
                     else if(pre) nextstate = 3'b110;
                     else if(bs) nextstate = 3'b100;
                     else nextstate = 3'b010;
                    end
        3'b011:begin en1 = 0;en2 = 0;en3 = 1;en4 = 0;en5 = 0;en6 = 0;en7 = 0;nextstate = 3'b010; end
        3'b100:begin en1 = 0;en2 = 0;en3 = 0;en4 = 1;en5 = 0;en6 = 0;en7 = 0;nextstate = 3'b010; end
        3'b101:begin en1 = 0;en2 = 1;en3 = 0;en4 = 0;en7 = 0;nextstate = 3'b001;en5 = 1;en6 = 0;end
        3'b110:begin en1 = 0;en2 = 1;en3 = 0;en4 = 0;en7 = 0;nextstate = 3'b001;en6 = 1; en5 = 0;end
        default:begin nextstate = 0;en1 = 0;en2 = 0;en3 = 0;en4 = 0;en5 = 0;en6 = 0;en7 = 0;end
    endcase
end
endmodule