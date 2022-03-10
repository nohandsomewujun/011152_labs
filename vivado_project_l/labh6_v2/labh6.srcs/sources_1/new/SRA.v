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
    input [10:0] haddress,
    input [10:0] vaddress,
    input [11:0] rdata,
    input [7:0] xad,
    input [7:0] yad,
    output [14:0] raddress,
    output reg [11:0] pdata
    );
    
    reg [11:0] h,v;
    
    always @(*) begin
        if(v == xad && h == yad) begin
            pdata=12'hf00;
        end
        else if(v == xad && h == yad - 1 ) begin
            pdata=12'h0f0;
        end
        else if(v == xad && h == yad + 1 ) begin
            pdata=12'h00f;
        end
        else if(v == xad - 1 && h == yad) begin
            pdata=12'hff0;  
        end
        else if(v == xad + 1 && h == yad) begin
            pdata = 12'hfff;  
        end
        else begin
            pdata = rdata;
        end
    end

    always @(*) begin
        if(haddress < 184 || vaddress < 29) begin
            h = 0;
            v = 0;
        end
        else begin
            h = (haddress - 184) / 4;
            v = (vaddress - 29) / 4;
        end
    end
    
    assign raddress = v*200 + h;
    
endmodule
