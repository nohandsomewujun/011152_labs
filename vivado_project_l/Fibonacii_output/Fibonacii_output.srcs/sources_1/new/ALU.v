`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/30 10:49:20
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] a,
    input [3:0] b,
    input [2:0] s,
    output reg [3:0] y,
    output reg cf,
    output reg of,
    output reg zf
    );
    wire [3:0] j;
    wire[3:0] y_add;
    wire cf_add;
    wire of_add;
    wire zf_add;
    wire [3:0] y_minus;
    wire cf_minus;
    wire of_minus;
    wire zf_minus;
    assign j = -b;
    a_b_add d1(a,b,y_add,cf_add,of_add,zf_add);
    a_b_add d2(a,j,y_minus,cf_minus,of_minus,zf_minus);
    always@(*) begin         //000+  001-  100&   101|  111~  110^
        case(s)
            4:begin y = a&b;cf = 0;of = 0;zf = 0;end
            5:begin y = a|b;cf = 0;of = 0;zf = 0;end
            7:begin y = ~a;cf = 0;of = 0;zf = 0;end
            6:begin y = a^b;cf = 0;of = 0;zf = 0;end
            0:begin y = y_add;cf = cf_add;of = of_add;zf = zf_add;end
            1:begin y = y_minus;cf = ~cf_minus;of = of_minus;zf = zf_minus;end
            default begin y = 0;cf = 0;of = 0;zf = 1;end
        endcase
    end
endmodule
