module Modulator_Assemblage(out,Din,Mod,Freq,clk);
input Din;                              //Input Data stream
input [1:0]Freq,Mod;                    //Freq selects frequency range of output modulated wave, Mod selects type of modulation
input clk;
output [15:0] out;                      //output modulated signal


wire [5:0]clk_;
wire CLK;
wire [15:0] w1,w2,w3,w4;                //w1-BPSK Modulated Signal, w2-QPSK Modulated Signal, w3-FSK Modulated Signal, w4-ASK Modulated Signal   

counter CLK_divide(clk_,clk);                           //clk_[0]=clk/2 clk_[1]=clk/4 clk_[2]=clk/8  <= in terms of frequencies
mux_4w mux_1(CLK,clk,clk_[0],clk_[1],clk_[2],Freq);     //Selects clock of appropriate frequency based on input Freq 

FSK fsk(w1,Din,CLK);                    //FSK Modulator
ASK ask(w2,Din,CLK);                    //ASK Modulator
BPSK bpsk(w3,Din,CLK);                  //BPSK Modulator
QPSK qpsk(w4,Din,CLK,clk_[5]);          //QPSK Modulator


mux_16_4w mux_16_4w_1(out,w1,w2,w3,w4,Mod);         //Selects appropriate modulation based on input Mod

endmodule