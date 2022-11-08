module bcd_add_sub(a,b,mode,sum,cout);
input [3:0]a,b;
input mode;
output [3:0]sum;
output cout;

wire [3:0]comp9,muxout;

comp9ckt g1(comp9,b);
mux2_1 g2(comp9,b,muxout,mode);
bcd_adder g3(muxout,a,mode,sum,cout);
endmodule


/*
module bcd_adder( input [3:0]a,b,
input cin,
output [3:0] sum,
output carry
);
*/






module comp9ckt( output reg[3:0] comp9, input [3:0]b);
always@(b)
begin
case(b) 
4'b0000: comp9 = 4'b1001; 
4'b0001: comp9 = 4'b1000; 
4'b0010: comp9 = 4'b0111; 
4'b0011: comp9 = 4'b0110; 
4'b0100: comp9 = 4'b1001; 
4'b0101: comp9 = 4'b0100; 
4'b0110: comp9 = 4'b0011; 
4'b0111: comp9 = 4'b0010; 
4'b1000: comp9 = 4'b0001; 
4'b1001: comp9 = 4'b0000; 
default: comp9 = 4'b1111;
endcase
end
endmodule

module mux2_1(input [3:0]a,b, output reg [3:0] muxout , input sel);
always@(*)
case(sel)
1:muxout=a;
0:muxout=b;
endcase
endmodule

module bcd_adder( input [3:0]a,b,
input cin,
output [3:0] sum,
output carry
);

wire [3:0]z;
wire cout;
wire cout1;
wire [3:0]carrytemp;
supply0 gnd;

assign cout1= (z[3]&z[2] )| (z[3]&z[1]) | cout ;
assign carrytemp={1'b0,cout1,cout1,1'b0};

fulladdr g1(a,b,cin,z,cout);
fulladdr g2(z,carrytemp,gnd,sum,carry);
endmodule

module fulladdr(input [3:0]a,b, input cin , output [3:0] sum, output carry);
assign {carry,sum}= a+b+cin;
endmodule

