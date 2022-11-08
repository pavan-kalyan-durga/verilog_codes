module tb_bcd_add_sub;
reg [3:0]a,b;
reg mode;
wire [3:0]sum;
wire cout;
integer i;

bcd_add_sub dut(a,b,mode,sum,cout);

initial
begin
for(i=0;i<512;i=i+1)
begin
{mode,a,b}=i;
#10;
end end

endmodule