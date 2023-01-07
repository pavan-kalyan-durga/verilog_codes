/* Gate Level Multiplicator */

module mult_16(prod,a,b);
input [15:0]a,b;
output [15:0] prod;

wire [31:0]p;                       //Contains pruduct in 32bits

wire [31:0]w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15; //To store 16 product terms
wire [31:0]s0,s1,s2,s3,s4,s5,s6,s7;
wire [31:0]x0,x1,x2,x3;
wire [31:0]y0,y1;


andgat and_0[15:0](w0[31:16],16'b0,16'b0);          //setting initial 16 bits of w0,which are not required to zero

andgat and_1[14:0](w1[31:17],15'b0,15'b0);          //setting initial 15 bits and last 1 bit of w1,which are not required to zero
andgat and_1_1(w1[0],1'b0,1'b0);

andgat and_2[13:0](w2[31:18],14'b0,14'b0);          //setting initial 14 bits and last 2 bits of w2,which are not required to zero
andgat and_2_1[1:0](w2[1:0],2'b0,2'b0);

andgat and_3[12:0](w3[31:19],13'b0,13'b0);          //setting initial 13 bits and last 3 bits of w3,which are not required to zero
andgat and_3_1[2:0](w3[2:0],3'b0,3'b0);

andgat and_4[11:0](w4[31:20],12'b0,12'b0);          //setting initial 12 bits and last 4 bits of w4,which are not required to zero
andgat and_4_1[3:0](w4[3:0],4'b0,4'b0);

andgat and_5[10:0](w5[31:21],11'b0,11'b0);          //setting initial 11 bits and last 5 bits of w5,which are not required to zero
andgat and_5_1[4:0](w5[4:0],5'b0,5'b0);

andgat and_6[9:0](w6[31:22],10'b0,10'b0);           //setting initial 10 bits and last 6 bits of w6,which are not required to zero
andgat and_6_1[5:0](w6[5:0],6'b0,6'b0);

andgat and_7[8:0](w7[31:23],9'b0,9'b0);             //setting initial 9 bits and last 7 bits of w7,which are not required to zero
andgat and_7_1[6:0](w7[6:0],7'b0,7'b0);

andgat and_8[7:0](w8[31:24],8'b0,8'b0);             //setting initial 8 bits and last 8 bits of w8,which are not required to zero
andgat and_8_1[7:0](w8[7:0],8'b0,8'b0);

andgat and_9[6:0](w9[31:25],7'b0,7'b0);             //setting initial 7 bits and last 9 bits of w9,which are not required to zero
andgat and_9_1[8:0](w9[8:0],9'b0,9'b0);

andgat and_10[5:0](w10[31:26],6'b0,6'b0);           //setting initial 6 bits and last 10 bits of w10,which are not required to zero
andgat and_10_1[9:0](w10[9:0],10'b0,10'b0);

andgat and_11[4:0](w11[31:27],5'b0,5'b0);           //setting initial 5 bits and last 11 bits of w11,which are not required to zero
andgat and_11_1[10:0](w11[10:0],11'b0,11'b0);

andgat and_12[3:0](w12[31:28],4'b0,4'b0);           //setting initial 4 bits and last 12 bits of w12,which are not required to zero
andgat and_12_1[11:0](w12[11:0],12'b0,12'b0);

andgat and_13[2:0](w13[31:29],3'b0,3'b0);           //setting initial 3 bits and last 13 bits of w13,which are not required to zero
andgat and_13_1[12:0](w13[12:0],13'b0,13'b0);

andgat and_14[1:0](w14[31:30],2'b0,2'b0);           //setting initial 2 bits and last 14 bits of w14,which are not required to zero
andgat and_14_1[13:0](w14[13:0],14'b0,14'b0);

andgat and_15(w15[31],1'b0,1'b0);                   //setting initial 1 bit and last 15 bits of w15,which are not required to zero
andgat and_15_1[14:0](w15[14:0],15'b0,15'b0);


mux_16 mux_0(w0[15:0],16'b0,a,b[0]);                //a multiplied with each b[i] and product stored in corresponding wi's
mux_16 mux_1(w1[16:1],16'b0,a,b[1]);
mux_16 mux_2(w2[17:2],16'b0,a,b[2]);
mux_16 mux_3(w3[18:3],16'b0,a,b[3]);

mux_16 mux_4(w4[19:4],16'b0,a,b[4]);
mux_16 mux_5(w5[20:5],16'b0,a,b[5]);
mux_16 mux_6(w6[21:6],16'b0,a,b[6]);
mux_16 mux_7(w7[22:7],16'b0,a,b[7]);

mux_16 mux_8(w8[23:8],16'b0,a,b[8]);
mux_16 mux_9(w9[24:9],16'b0,a,b[9]);
mux_16 mux_10(w10[25:10],16'b0,a,b[10]);
mux_16 mux_11(w11[26:11],16'b0,a,b[11]);

mux_16 mux_12(w12[27:12],16'b0,a,b[12]);
mux_16 mux_13(w13[28:13],16'b0,a,b[13]);
mux_16 mux_14(w14[29:14],16'b0,a,b[14]);
mux_16 mux_15(w15[30:15],16'b0,a,b[15]);

adder_32b add_0(s0,w0,w1);                      //all wi's are added together  to obtain the product
adder_32b add_1(s1,w2,w3);
adder_32b add_2(s2,w4,w5);
adder_32b add_3(s3,w6,w7);
adder_32b add_4(s4,w8,w9);
adder_32b add_5(s5,w10,w11);
adder_32b add_6(s6,w12,w13);
adder_32b add_7(s7,w14,w15);

adder_32b add_8(x0,s0,s1);
adder_32b add_9(x1,s2,s3);
adder_32b add_10(x2,s4,s5);
adder_32b add_11(x3,s6,s7);

adder_32b add_12(y0,x0,x1);
adder_32b add_13(y1,x2,x3);

adder_32b add_14(p,y0,y1);

andgat and_32_to_16[15:0](prod,p[15:0],16'b1111111111111111);

endmodule