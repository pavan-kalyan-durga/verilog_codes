
module nrz_man_tb;
reg nrz,clk;
wire man;
nrz_man dut(nrz,clk,man);
initial begin clk=0; nrz=0; end

initial begin forever  #10 clk=~clk; end

initial begin  
nrz=0; #190 nrz=1'b1;#200 nrz=0;#200 nrz=1'b1;#200 nrz=0;#20 nrz=1'b1;#30 nrz=0; #100 $finish; end endmodule