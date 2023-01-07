
module QPSK(out,Din,clk,pulse);             //QPSK Modulator
input Din,clk,pulse;                        //pulse varies in every 64ps
output [15:0]out;

wire [5:0]r;
reg [5:0]t;
reg [1:0]s;                     //stores 2-bit symbol
reg q1,q2;

initial
begin
    t=0;
end
always@(posedge clk)
begin
    t=t+1;
end
always@(negedge pulse)          //symbol is obtained on negative edge of pulse
begin
    s[1]=q2;
    s[0]=q1;
    if(s==2'b01)
        t=t+16;
    else if(s==2'b10)
        t=t+32;
    else if(s==2'b11)
        t=t+48;
end
always@(pulse)
begin
    if(pulse==0)                //pulse=0 value stored in q1
        q1=Din;
    else
        q2=Din;                  //pulse=1 value stored in q2
end
andgat and_1[5:0](r,6'b111111,t);
sine_wave_generator SWG_1(out,r);
endmodule
