
module tb_Seven_Seg_Display();
wire [6: 0] Display; reg [3: 0] BCD;
parameter BLANK = 7'b000_0000; 
parameter ZERO = 7'b111_1110;
parameter ONE  = 7'b011_0000;
parameter TWO = 7'b110_1101;
parameter THREE   = 7'b111_1001;
parameter FOUR = 7'b011_0011;
parameter FIVE = 7'b101_1011;
parameter SIX= 7'b001_1111;
parameter SEVEN  = 7'b111_0000;
parameter EIGHT = 7'b111_1111;
parameter NINE = 7'b111_1011;
Seven_Seg_Display M0(Display,BCD);

integer i;

initial
begin for(i=0;i<10;i=i+1) begin
BCD=i;
#10; end
end
// initial
 // fork 
 // #10 BCD = 0; #20 BCD = 1; #30 BCD = 2; #40 BCD = 3; #50 BCD = 4; #60 BCD = 5; #70 BCD = 6; #80 BCD = 7; #90 BCD = 8; #100 BCD = 9;
// join 

endmodule

