
module BPSK(out,Din,clk);               //BPSK Modulator
input Din,clk;                          //Din=input data stream 
output [15:0] out;                      //Modulated signal

wire [15:0]wave,wave_Pi;                //wave_Pi=sinusoidal wave with a phase diff of Pi
wire [5:0]t;

counter count_1(t,clk);                 //t counts 0->63 based on CLK
sine_wave_generator SWG(wave,t);        //Generate sinusoidal wave in accordance to t
sine_wave_Pi_shift SWG_1(wave_Pi,t);    //Generate sinusoidal wave with a Pi phase diff
mux_16 mux_1(out,wave_Pi,wave,Din);     //Din=1 => phase diff=0  , Din=0 => phase diff=180 degreee
endmodule
