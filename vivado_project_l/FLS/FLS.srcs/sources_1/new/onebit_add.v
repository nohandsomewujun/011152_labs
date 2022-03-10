module onebit_add(
    input a,
    input b,
    input c,
    output s,
    output c0
    );
assign s = a^b^c;
assign c0 = (a&b)|((a^b)&c);
endmodule