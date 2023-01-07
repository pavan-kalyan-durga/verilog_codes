
module TB_ASK;
reg Din,clk;
wire [15:0] out;
ASK ask_1(out,Din,clk);
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
    #1000 Din=~Din;
end
endmodule