module ALU (
    input [7:0] a,
    input [7:0] b,
    output [7:0] y,
    output reg cf
);
wire [8:0] c;
onebit_add d8(a[0],b[0],0,y[0],c[1]);
onebit_add d9(a[1],b[1],c[1],y[1],c[2]);
onebit_add d10(a[2],b[2],c[2],y[2],c[3]);
onebit_add d11(a[3],b[3],c[3],y[3],c[4]);
onebit_add d12(a[4],b[4],c[4],y[4],c[5]);
onebit_add d13(a[5],b[5],c[5],y[5],c[6]);
onebit_add d14(a[6],b[6],c[6],y[6],c[7]);
onebit_add d15(a[7],b[7],c[7],y[7],c[8]);
always@(*)begin
    cf = c[8];
end 
endmodule