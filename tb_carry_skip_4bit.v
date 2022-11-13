
module tb_carry_skip_4bit;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

integer i;
carry_skip_4bit dut(a,b,cin,sum,cout);

initial begin for(i=0;i<(2**9);i=i+1) begin {cin,a,b}=i; #10; end 
			  #100 $finish;
			  end
			 endmodule
			 
			 