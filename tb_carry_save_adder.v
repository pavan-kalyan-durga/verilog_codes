

module tb_carry_save_adder;
reg [3:0] a,b,c,d;
wire [4:0] sum;
wire cout;

integer i;
carry_skip_4bit dut(a,b,c,d,sum,cout);

initial begin for(i=0;i<(2**16);i=i+1) begin {a,b,c,d}=i; #10; end 
			  #100 $finish;
			  end
			 endmodule
			 
			 