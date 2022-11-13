

module tb_cla_4bit;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;

integer i;
cla_4bit dut(a,b,cin,sum,carry);

initial begin for(i=0;i<(2**9);i=i+1) begin {cin,a,b}=i; #10; end 
			  #100 $finish;
			  end
			 endmodule