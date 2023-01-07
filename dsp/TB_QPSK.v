
module TB_QPSK;
reg Din,clk,pulse;
wire [15:0] out;
QPSK qpsk_1(out,Din,clk,pulse);
initial
begin
$monitor("pulse=%b Din=%b out=%d",pulse,Din,out);
    clk=0;Din=0;pulse=0;
end
always
begin
    #4 clk=~clk;
end
always
begin
    #200 pulse=~pulse;
end
always
begin
    #32 Din=1;
    #32 Din=0;
    #32 Din=1;
    #128 Din=0;
    #32 Din=1;
    #32 Din=0;
    #64 Din=1;
    #96 Din=0;
end
endmodule