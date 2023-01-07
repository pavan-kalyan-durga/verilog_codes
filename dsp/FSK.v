
module FSK(out,Din,clk);                //FSK Modulator
input Din,clk;                          //Din=input data stream 
output [15:0] out;                      //Modulated signal

wire clk_b2,clk_b4,CLK;                 
wire [5:0]t;

T_FF tff_1(clk_b2,1'b1,clk);            //clk_b2=clk/2
T_FF tff_2(clk_b4,1'b1,clk_b2);         //clk_b4=clk_b2/2=clk/4

mux mux_1(CLK,clk_b4,clk,Din);          //Din=1 => CLK=clk , Din=0 => CLK=clk_b4
counter count_1(t,CLK);                 //t counts 0->63 based on CLK
sine_wave_generator SWG(out,t);         //out=sine value corresponding to t
endmodule
