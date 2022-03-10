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
parameter b = 4'b0000;
parameter c = 4'b0001;
parameter d = 4'b0010;
parameter e = 4'b0011;
parameter f = 4'b0100;
parameter g = 4'b0101;
parameter h = 4'b0110;
parameter i = 4'b0111;
parameter j = 4'b1000;
parameter k = 4'b1001;
parameter l = 4'b1010;
parameter m = 4'b1011;
reg [3:0] state;
reg [3:0] nextstate;
integer flag = 0;
reg py;
always @(posedge clk or posedge rstn) begin
    if(rstn) begin state <= m;y<=0;rx <= 0;ry <= 0;end
    else  begin state <= nextstate;
        y <= py;
        if(x) rx <= rx*2+1;
        else  rx <= rx*2;
        if(y) ry <= ry*2+1;
        else  ry <= ry*2; 
        if(nextstate == m) y <= 0;
        else if(nextstate == g) y <= 1;end
end
always@(*) begin
    case(state)
        b:  begin if(x) nextstate = c;else nextstate = h;
        end
        c: begin if(x) nextstate = d;else nextstate = h;
        end
        d: begin if(x) nextstate = e;else nextstate = h;
        end
        e:begin if(x) nextstate = f;else nextstate = h;
        end
        f: begin if(x)begin nextstate = g;py = 1; end else nextstate = h;
        end
        g:  begin if(x) begin nextstate = g;end else nextstate = h;
        end
        h: begin if(x) nextstate = b;else nextstate = i;
        end
        i:begin if(x) nextstate = b;else nextstate = j;
        end
        j:  begin if(x) nextstate = b;else nextstate = k;
        end
        k: begin if(x) nextstate = b;else nextstate = l;
        end
        l: begin if(x) nextstate = b;else begin nextstate = m;py = 0;end
        end
        m: begin if(x) begin nextstate = b;end else  begin nextstate = m;end
        end
    endcase
end
endmodule
