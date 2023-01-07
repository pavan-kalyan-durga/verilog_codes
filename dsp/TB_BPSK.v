
module TB_BPSK;
reg Din,clk;
wire [15:0] out;
BPSK bpsk_1(out,Din,clk);
initial
begin
$monitor("Din=%b out=%d",Din,out);
    clk=0;Din=0;
end
always
begin
    #1 clk=~clk;
end
always
begin
    #100 Din=~Din;
end
endmodule
