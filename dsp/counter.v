
module counter(out,clk);            //counter that counts from 0 to 63 (6-bit)
input clk;
output [5:0]out;
wire [5:0]out_;
T_FF tff_1(out_[0],1'b1,clk);
T_FF tff_2(out_[1],1'b1,out_[0]);
T_FF tff_3(out_[2],1'b1,out_[1]);
T_FF tff_4(out_[3],1'b1,out_[2]);
T_FF tff_5(out_[4],1'b1,out_[3]);
T_FF tff_6(out_[5],1'b1,out_[4]);
not(out[0],out_[0]);
not(out[1],out_[1]);
not(out[2],out_[2]);
not(out[3],out_[3]);
not(out[4],out_[4]);
not(out[5],out_[5]);
endmodule
