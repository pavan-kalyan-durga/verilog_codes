/*
module cla_4bit(a,b,cin,sum,carry);
input [3:0]a,b;
input cin;
output [3:0]sum;
output carry;

wire [3:0]p,g,c;

assign p=a^b;
assign g=a&b;

assign c[0]=cin;
assign c[1]=g[0] | (p[0]&c[0]);
assign c[2]=g[1] | (p[1]&g[0])| (p[1]&p[0]&c[0]);
assign c[3]=g[2] | (p[2]&g[1])| (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&c[0]);
assign carry=g[3] | (p[3]&g[2])| (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&c[0]);
assign sum=p^c;

endmodule
*/

module cla_4bit
(
  input [1:0] A,
  input [1:0] B,
  input CARRY_IN,
  output [1:0] SUM,
  output CARRY_OUT
);

  wire tmpsum;
  wire tmp1;
  wire tmp2;
  wire tmp3;
  wire tmp4;
  wire tmp5;
  wire tmp6;
  wire tmp7;

  xor A1 (tmpsum, A[0], B[0]);
  xor A2 (SUM[0], tmpsum, CARRY_IN);
  and A3 (tmp1, tmpsum, CARRY_IN);
  and A4 (tmp2, A[0], B[0]);
  xor A5 (tmp3, A[1], B[1]);
  xor A6 (tmp4, tmp2, tmp1);
  xor A7 (SUM[1], tmp3, tmp4);

  and B1 (tmp5, A[1], B[1]);
  or B2 (tmp6, tmp2, tmp1);
  and B3 (tmp7, tmp3, tmp6);
  or B4 (CARRY_OUT, tmp5, tmp7);
endmodule
