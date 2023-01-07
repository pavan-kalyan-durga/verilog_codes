
module TB_FSK;
reg Din,clk;
wire [15:0] out;
FSK fsk_1(out,Din,clk);
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
    #2000 Din=~Din;
end
endmodule