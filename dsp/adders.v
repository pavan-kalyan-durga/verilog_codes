
module adder_6b(s,c,a,b);                   //6-bit Adder
input [5:0]a,b;                             //input 6-bit Nos
output [5:0]s;                              //6-bit sum
output c;
wire c1,c2,c3,c4,c5;
half_adder HA_1(s[0],c1,a[0],b[0]);
full_adder FA_1(s[1],c2,a[1],b[1],c1);
full_adder FA_2(s[2],c3,a[2],b[2],c2);
full_adder FA_3(s[3],c4,a[3],b[3],c3);
full_adder FA_4(s[4],c5,a[4],b[4],c4);
full_adder FA_5(s[5],c,a[5],b[5],c5);
endmodule

module half_adder(s,c,i1,i2);               //Half_Adder
input i1,i2;
output s,c;
xor(s,i1,i2);
and(c,i1,i2);
endmodule

module full_adder(s,c,i1,i2,cin);           //Full_Adder
input i1,i2,cin;
output s,c;
wire s1,c1,c2;
half_adder HF_1(s1,c1,i1,i2);
half_adder HF_2(s,c2,s1,cin);
or(c,c1,c2);
endmodule


module adder_4b(s,c,i1,i2);                     //4-bit Adder
input [3:0]i1,i2;
output [3:0]s;
output c;
wire c1,c2,c3;
half_adder half_adder_1(s[0],c1,i1[0],i2[0]);
full_adder full_adder_1(s[1],c2,i1[1],i2[1],c1);
full_adder full_adder_2(s[2],c3,i1[2],i2[2],c2);
full_adder full_adder_3(s[3],c,i1[3],i2[3],c3);
endmodule

module full_adder_4b(s,c,i1,i2,cin);        //4-bit Adder with Carry in
input [3:0]i1,i2;
input cin;
output [3:0]s;
output c;
wire c1,c2,c3;
full_adder full_adder_1(s[0],c1,i1[0],i2[0],cin);
full_adder full_adder_2(s[1],c2,i1[1],i2[1],c1);
full_adder full_adder_3(s[2],c3,i1[2],i2[2],c2);
full_adder full_adder_4(s[3],c,i1[3],i2[3],c3);
endmodule

module adder_16b(s,c,i1,i2);                //16-bit Adder
input [15:0]i1,i2;
output [15:0]s;
output c;
wire c1,c2,c3;
adder_4b adder_4b_1(s[3:0],c1,i1[3:0],i2[3:0]);
full_adder_4b full_adder_4b_1(s[7:4],c2,i1[7:4],i2[7:4],c1);
full_adder_4b full_adder_4b_2(s[11:8],c3,i1[11:8],i2[11:8],c2);
full_adder_4b full_adder_4b_3(s[15:12],c,i1[15:12],i2[15:12],c3);
endmodule

module adder_32b(s,i1,i2);                  //32-bit Adder
input [31:0]i1,i2;
output [31:0]s;
wire c;
wire c1,c2,c3,c4,c5,c6,c7;
adder_4b adder_4b_1(s[3:0],c1,i1[3:0],i2[3:0]);
full_adder_4b full_adder_4b_1(s[7:4],c2,i1[7:4],i2[7:4],c1);
full_adder_4b full_adder_4b_2(s[11:8],c3,i1[11:8],i2[11:8],c2);
full_adder_4b full_adder_4b_3(s[15:12],c4,i1[15:12],i2[15:12],c3);

full_adder_4b full_adder_4b_4(s[19:16],c5,i1[19:16],i2[19:16],c4);
full_adder_4b full_adder_4b_5(s[23:20],c6,i1[23:20],i2[23:20],c5);
full_adder_4b full_adder_4b_6(s[27:24],c7,i1[27:24],i2[27:24],c6);
full_adder_4b full_adder_4b_7(s[31:28],c,i1[31:28],i2[31:28],c7);
endmodule
