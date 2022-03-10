`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/06 12:20:08
// Design Name: 
// Module Name: PCU
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


module PCU(
    input clk,
    input rstn,
    input [4:0] direction,
    input [11:0] rgb,
    input [11:0] initialdata,
    input delete,
    input draw,
    output [14:0] outadress,
    output reg [11:0] outputdata,
    output reg we,
    output reg [7:0] x,y
    );
    
    always @(posedge clk) begin
        if(rstn)begin
            x <= 75;
            y <= 100;
        end
        else begin
            if(direction[0]) begin
                if(x > 0) begin
                    x <= x-1;
                end
            end
            else if(direction[1]) begin
                if(x < 148) begin
                   x <= x+1;
                end
            end 
            else if(direction[2]) begin
                if(y > 0) begin
                    y <= y-1;
                end
            end 
            else if(direction[3]) begin
                if(y < 199) begin
                    y <= y+1;
                end    
            end
        end
    end

    always @(*) begin
        if(draw) begin
            we = 1;
            outputdata = rgb;
        end
        else if(delete) begin
            we = 1;
            outputdata = initialdata;
        end
        else begin
            we = 0;
            outputdata = rgb;
        end
    end

    assign outadress = x*200+y;

endmodule
