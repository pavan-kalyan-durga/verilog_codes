module tb_bcd_adder_beh;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;
integer i;

bcd_adder_beh dut(a,b,cin,sum,carry);

initial begin
for(i=0;i<128;i=i+1)
begin {cin,a,b}=i; #10;
end
end

endmodule