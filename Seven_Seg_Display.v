module Seven_Seg_Display( output reg [6: 0] Display, input[3: 0] BCD ); 
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

always @ (BCD) 
case (BCD) 
0:Display = ZERO;
1:Display = ONE;
2: Display = TWO; 
3:Display = THREE;
 4: Display = FOUR; 
 5: Display = FIVE; 6: Display = SIX;
7: Display = SEVEN;8: Display = EIGHT; 9: Display = NINE;
default: Display = BLANK; endcase endmodule

