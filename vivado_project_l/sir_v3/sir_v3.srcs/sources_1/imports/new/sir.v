`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 20:45:25
// Design Name: 
// Module Name: sir
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


module sir (
    input x,
    input rstn,
    input clk,
    output reg y,
    output reg [7:0] rx,
    output reg [7:0] ry
);
parameter b = 12'b000000000001;
parameter c = 12'b000000000010;
parameter d = 12'b000000000100;
parameter e = 12'b000000001000;
parameter f = 12'b000000010000;
parameter g = 12'b000000100000;
parameter h = 12'b000001000000;
parameter i = 12'b000010000000;
parameter j = 12'b000100000000;
parameter k = 12'b001000000000;
parameter l = 12'b010000000000;
parameter m = 12'b100000000000;
reg [11:0] state = m;
reg [11:0] nextstate = m;
/*always @(posedge clk,posedge rstn) begin
    if(rstn) state <= m;
    else state <= nextstate;
end*/
always @(posedge clk or posedge rstn) begin
    if(rstn) begin state <= m;y <= 0;rx <= 0;ry <= 0;end
    else  begin state <= nextstate;
        if(x) rx <= rx*2+1;
        else  rx <= rx*2;
        if(y) ry <= ry*2+1;
        else  ry <= ry*2; 
        if(nextstate == g) y <= 1;
        else if(nextstate == m) y <= 0;
    end
end
always@(*) begin
    case(state)
        b: if(x) nextstate = c;else nextstate = h;
        c: if(x) nextstate = d;else nextstate = h;
        d: if(x) nextstate = e;else nextstate = h;
        e: if(x) nextstate = f;else nextstate = h;
        f: if(x) nextstate = g;else nextstate = h;
        g: begin if(x) nextstate = g;else nextstate = h;
        end
        h: if(x) nextstate = b;else nextstate = i;
        i: if(x) nextstate = b;else nextstate = j;
        j: if(x) nextstate = b;else nextstate = k;
        k: if(x) nextstate = b;else nextstate = l;
        l: if(x) nextstate = b;else nextstate = m;
        m: begin if(x) nextstate = b;else nextstate = m;
        end
    endcase
end
   /* always @(*) begin
        if(rstn) y = 0;
        else begin
            if((state == m)&&(y == 1)) y = 0;
        else if((state == g)&&(y == 0)) y = 1;
        end
    end*/
endmodule