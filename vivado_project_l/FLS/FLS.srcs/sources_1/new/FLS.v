`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/05 14:09:10
// Design Name: 
// Module Name: FLS
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


module FLS (
    input clk,rstn,en,
    input [7:0] d,
    output reg [7:0] f,
    output err
);
reg [7:0] ff;
reg [1:0] state;
reg [1:0] nextstate;
reg [7:0] df;
always@(posedge clk or posedge rstn) begin
    if(rstn) begin state <= 0;f <= 0; end
    else begin
        if(!err)begin
        state <= nextstate;
        f <= df;end
        else f <= ff;
    end
end
wire [7:0] pf;
wire [7:0] x;
wire [7:0] d1;
wire [7:0] d2;
mux d4(d,x,state,d2);
d_trigger d5(d2,clk,rstn,d1);
d_trigger d6(pf,clk,rstn,x);
ALU d7(d1,x,pf,err);
always@(*) begin
    if(en) begin
        case(state)
        2'b00:begin
            df = d;
            nextstate = 2'b01;
        end
        2'b01:begin
            df = d;
            nextstate = 2'b10;
        end
        2'b10:begin
            if(!err)begin
                df = pf;
                ff = pf;
                nextstate = 2'b10;
            end
        end
        endcase
    end
end 
endmodule