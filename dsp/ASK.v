
module ASK(out,Din,clk);                //ASK Modulator
input Din,clk;                          //Din=input data stream 
output [15:0] out;                      //Modulated signal

wire [15:0] wave,HA_wave;               //wave-normal amplitude sinusoidal wave, HA_wave-High amplitude sinusoidal wave
wire [5:0]t;                            //t - running variable(0->63) that selects appropriate sine value from sine wave generator

counter count_1(t,clk);                 //t counts 0->63 based on clk
sine_wave_generator SWG(wave,t);                        //wave=sine value corresponding to t
mult_16 mult_1(HA_wave,wave,16'b0000000000001010);      //HA_wave=10xwave
mux_16 mux_1(out,16'b00010011100010000,HA_wave,Din);                     //Din=1 => High amplitude , Din=0 => Zero amplitude 
endmodule
