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