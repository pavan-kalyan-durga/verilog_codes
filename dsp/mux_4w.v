
module mux_4w(o,i1,i2,i3,i4,s);         //4x1 MUX
input i1,i2,i3,i4;
input [1:0]s;
output o;
wire w1,w2;

mux mux_1(w1,i1,i2,s[0]);
mux mux_2(w2,i3,i4,s[0]);
mux mux_3(o,w1,w2,s[1]);
endmodule
