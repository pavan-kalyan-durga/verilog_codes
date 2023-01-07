
module mux_16_4w(o,i1,i2,i3,i4,s);  //4x1 MUX with 16-bit I/O
input [15:0]i1,i2,i3,i4;
input [1:0]s;
output [15:0]o;
wire [15:0]w1,w2;

mux_16 mux_1(w1,i1,i2,s[0]);
mux_16 mux_2(w2,i3,i4,s[0]);
mux_16 mux_3(o,w1,w2,s[1]);
endmodule
