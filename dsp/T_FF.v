module T_FF(q,t,clk);           //T-FlipFlop
input t,clk;
output q;
reg q;
initial
begin
    q=0;
end
always @(posedge clk)
begin
    if(t==1)
        q=~q; 
end
endmodule
