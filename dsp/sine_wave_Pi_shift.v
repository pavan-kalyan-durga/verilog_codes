module sine_wave_Pi_shift(o,t);             //SWG generating sinusoidal wave with phase diff of Pi
input [5:0]t;
output [15:0]o;
wire [5:0]t_;
wire c;
adder_6b add_1(t_,c,t,6'b100000);           //t_=t+32
sine_wave_generator SWG(o,t_);
endmodule
