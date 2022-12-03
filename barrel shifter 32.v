`timescale 1ns / 1ps
module barrel_shifter_32(
		input wire[31:0] num,
		input wire[4:0] amt,
		input wire LR,
		output wire[31:0] real_out);
		wire[31:0] out_1,out_2;
		Rotate_R32 m0(num,amt,out_1);
		Rotate_L32 m1(num,amt,out_2);
		assign real_out=LR?out_2:out_1;  //MUX for left or right 16-bit shifter
endmodule

module Rotate_R32(
	input wire[31:0] num, 
	input wire[4:0] amt,
	output wire[31:0] out
    );
	 wire[31:0] s0,s1,s2,s3,s4;
	 assign s0=amt[0]?{num[0],num[31:1]}:num; //1 move
	 assign s1=amt[1]?{s0[1:0],s0[31:2]}:s0;   //2 moves
	 assign s2=amt[2]?{s1[3:0],s1[31:4]}:s1;   //4 moves
	 assign s3=amt[3]?{s2[7:0],s2[31:8]}:s2;   //8 moves
	 assign s4=amt[4]?{s2[15:0],s3[31:16]}:s3; //16 bits
	 assign out=s4;

endmodule

module Rotate_L32(
	input wire[31:0] num, 
	input wire[4:0] amt,
	output wire[31:0] out
    );
	 wire[31:0] s0,s1,s2,s3,s4;
	 assign s0=amt[0]?{num[30:0],num[31]}:num; //1 move
	 assign s1=amt[1]?{s0[29:0],s0[31:30]}:s0;  //2 moves
	 assign s2=amt[2]?{s1[27:0],s1[31:28]}:s1;  //4 moves
	 assign s3=amt[3]?{s2[23:0],s2[31:24]}:s2;  //8 moves
	 assign s4=amt[4]?{s3[15:0],s3[31:16]}:s3;  //16 moves
	 assign out=s4;


endmodule

module tb_barreLshifter;

	// Inputs
	reg [31:0] num;
	reg [4:0] amt;
	reg LR;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Multi_Barrel_Shifter8x16x32x #(.N(32),.M(5)) uut (
		.num(num), 
		.amt(amt), 
		.LR(LR), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
			num = 0;
			amt = 0;
			LR = 0; //0=right, 1=left

			#100
			#10 num=32'b1111111111111111_0000000000000000;
			
			//Rotate right bit by bit
			$display("ROTATE RIGHT");
			for(amt=5'd0;amt<5'b11111;amt=amt+1) begin
				#5 $display("%b",out);
			end
			#5 $display("%b",out);
			
			
			
			//Rotate left bit by bit
			$display(" ");
			$display("ROTATE LEFT");
			LR=1;
			for(amt=5'd0;amt<5'b11111;amt=amt+1) begin
				#5 $display("%b",out);
			end
			#5 $display("%b",out);
			
		#100 $finish;
		end
			
endmodule


