`timescale 1ns / 1ps
module int_to_fp(
	input [7:0] integ,
	output reg[12:0] fp	
    );
	 integer i; 
	 reg finish;
	 
	 always @(integ) 
	 begin
	 fp=13'b0;
	 i=0;
	 finish=1'b0;
	 fp[12]=integ[7];      //sign bit of fp is same with integ
	 for(i=6;i>=0;i=i-1)   //find loc of first bit 1 in the integ
		 if(integ[i]==1'b1 && finish==1'b0) begin
		 	fp[7:0] = {1'b0,integ[6:0]}<<(7-i); 
/*8 bit frac value of fp must be normalized so the first bit "1"(excluding the signed bit) of integ 
must moved to 8th bit*/
			fp[11:8] = i+1;  
/* 4 bit exp value e.g. integ 0000_1111(i=3) willl become fp frac of .1111_0000 when normalized so an exp must be 3+1=4*/
			finish=1'b1;
		 end
	 end
endmodule


module fp_to_int(
	input [12:0] fp,
	output reg[7:0] integ,
	output reg over,under
    );
	 reg[3:0] exp;
	 reg[7:0] frac;
	 always@(fp) 
	 begin
		 integ=8'b0;
		 over=1'b0;
		 under=1'b0;
		 frac=fp[7:0];
		 exp=fp[11:8];
		 integ[7]=fp[12];  		 //sign bit of fp is same with int
		 
		 if(exp>7 && frac[7]) begin //overflow
			integ[6:0]=7'b111_1111;  
			over=1'b1;
		 end
		 
		 else if(exp==0 && frac[7]) begin //underflow
			integ[6:0]=7'b000_0000;
			under=1'b1;
		 end
		 
		 else if(exp<=7 && frac[7]) begin
			integ[6:0]=frac>>(8-exp);
		 end
	 end
	 
endmodule

module int_to_fp_to_int_TB;
reg [7:0] integ;
	wire [12:0] fp;
	reg[12:0] fp_new;
	wire[7:0] integ_new;
	wire over,under;
	int_to_fp uut (.integ(integ), .fp(fp));
	fp_to_int uut2(.fp(fp_new),.integ(integ_new), .over(over), .under(under));
	 
	initial begin
		integ = 0;
		#100;
		for(integ={8{1'b1}};integ>0;integ=integ-1) begin 
			#5
			fp_new=fp;
			if(fp[12])
			$display("integer=%d,  floatingpoint= -%dE%d , outinteger=%d",integ+1'b1,fp[7:0],fp[11:8],integ_new);
			else
			$display("integer=%d,  floatingpoint= +%dE%d , outinteger=%d",integ+1'b1,fp[7:0],fp[11:8],integ_new);
		end
		#100 $finish;
	end
   
endmodule

