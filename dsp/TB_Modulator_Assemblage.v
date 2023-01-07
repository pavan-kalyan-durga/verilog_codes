module TB_Modulator_Assemblage;
reg Din;
reg [1:0]Freq,Mod;
reg clk;
wire [15:0] out;

Modulator_Assemblage Modulate(out,Din,Mod,Freq,clk);

initial
begin

$monitor("out=%d Din=%d Mod=%d Freq=%d clk=%b",out,Din,Mod,Freq,clk);
    clk=0;Din=0;
    Mod=2'b00;          //FSK
        Freq=2'b00;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b01;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b10;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b11;
            #512 Din=1;
            #512 Din=0;
    Mod=2'b01;          //ASK
        Freq=2'b00;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b01;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b10;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b11;
            #512 Din=1;
            #512 Din=0;

    Mod=2'b10;          //BPSK
        Freq=2'b00;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b01;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b10;
            #512 Din=1;
            #512 Din=0;
        Freq=2'b11;
            #512 Din=1;
            #512 Din=0;
    Mod=2'b11;          //QPSK
        Freq=2'b00;
            #64 Din=1;
            #64 Din=0;
            #512 Din=1;
            #512 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=1;
            #64 Din=1;
            #64 Din=0;
            #64 Din=1;
            #64 Din=0;
        Freq=2'b01;
            #64 Din=1;
            #64 Din=0;
            #512 Din=1;
            #512 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=1;
            #64 Din=1;
            #64 Din=0;
            #64 Din=1;
            #64 Din=0;
        Freq=2'b10;
            #64 Din=1;
            #64 Din=0;
            #512 Din=1;
            #512 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=1;
            #64 Din=1;
            #64 Din=0;
            #64 Din=1;
            #64 Din=0;
        Freq=2'b11;
            #64 Din=1;
            #64 Din=0;
            #512 Din=1;
            #512 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=0;
            #64 Din=1;
            #64 Din=1;
            #64 Din=0;
            #64 Din=1;
            #64 Din=0;
end
always
begin
    #1 clk=~clk;
end
endmodule
