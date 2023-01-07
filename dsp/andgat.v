
module andgat(o,a,b);                   //andgate using nand gate
input a,b;
output o;
wire x;
nand(x,a,b);
nand(o,x,x);
endmodule
