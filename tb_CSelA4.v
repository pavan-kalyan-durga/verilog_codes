
module tb_CSelA4;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
integer i;
CSelA4 dut(sum,cout,a,b,cin);

initial begin for(i=0;i<512;i=i+1) begin {cin,a,b}=i; #10; end end

endmodule