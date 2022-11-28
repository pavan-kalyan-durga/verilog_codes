module a_fifo5(d_out,f_full_flag,f_half_full_flag,f_empty_flag,
f_almost_full_flag,f_almost_empty_flag,d_in,r_en,w_en,r_clk,w_clk,reset);

parameter f_width=8; //FIFO width
parameter f_depth=16; //FIFO depth
parameter f_ptr_width=4; //because depth =16;
parameter f_half_full_value=8;
parameter f_almost_full_value=14;
parameter f_almost_empty_value=2;


output reg [f_width-1:0] d_out; 
output f_full_flag,f_half_full_flag,f_almost_full_flag,f_empty_flag,f_almost_empty_flag;
input [f_width-1:0] d_in;
input r_en,w_en,r_clk,w_clk;
input reset;


wire [f_ptr_width-1:0] r_ptr,w_ptr;
reg r_next_en,w_next_en;
reg [f_ptr_width-1:0] ptr_diff;
reg [f_width-1:0] f_memory[f_depth-1:0];


assign f_full_flag=(ptr_diff==(f_depth-1)); //assign FIFO status
assign f_empty_flag=(ptr_diff==0);
assign f_half_full_flag=(ptr_diff==f_half_full_value);
assign f_almost_full_flag=(ptr_diff==f_almost_full_value);
assign f_almost_empty_flag=(ptr_diff==f_almost_empty_value);

always @(posedge w_clk) //write to memory
begin
if(w_en) begin
if(!f_full_flag)
f_memory[w_ptr]<=d_in; end
end

always @(posedge r_clk) //read from memory
begin
if(reset)
d_out<=0; //f_memory[r_ptr];
else if(r_en) begin
if(!f_empty_flag)
d_out<=f_memory[r_ptr]; end
else d_out<=0;
end


always @(*) //ptr_diff changes as read or write clock change
begin
if(w_ptr>r_ptr)
ptr_diff<=w_ptr-r_ptr;
else if(w_ptr<r_ptr)
begin
ptr_diff<=((f_depth-r_ptr)+w_ptr);
end
else ptr_diff<=0;
end

always @(*) //after empty flag activated fifo read counter should not increment;
begin if(r_en && (!f_empty_flag))
r_next_en=1;
else r_next_en=0;
end

always @(*) //after full flag activated fifo write counter should not increment;
begin if(w_en && (!f_full_flag))
w_next_en=1;
else w_next_en=0;
end

b_counter r_b_counter(.c_out(r_ptr),.c_reset(reset),.c_clk(r_clk),.en(r_next_en));
b_counter w_b_counter(.c_out(w_ptr),.c_reset(reset),.c_clk(w_clk),.en(w_next_en));

endmodule


module b_counter(c_out,c_reset,c_clk,en);
parameter c_width=4; //counter width
output [c_width-1:0] c_out; reg [c_width-1:0] c_out;
input c_reset,c_clk,en;


always @(posedge c_clk or posedge c_reset)
if (c_reset)
c_out <= 0;
else if(en)
c_out <= c_out + 1;
endmodule



module fifo_top(x,y,z,d_out,f_full_flag,f_half_full_flag,f_empty_flag,
f_almost_full_flag,f_almost_empty_flag,d_in,r_en,w_en,CLKIN_IN,RST_IN,reset);


parameter f_width=8;
parameter f_depth=16;
parameter f_ptr_width=4;
parameter f_half_full_value=8;
parameter f_almost_full_value=14;
parameter f_almost_empty_value=2;


output [f_width-1:0] d_out; //reg [f_width-1:0] d_out; //outputs
output f_full_flag,f_half_full_flag,f_almost_full_flag,f_empty_flag,f_almost_empty_flag;
output x,y,z;
input [f_width-1:0] d_in;
input r_en,w_en,CLKIN_IN,RST_IN;
input reset;


a_fifo5 a_fifo55(d_out,f_full_flag,f_half_full_flag,f_empty_flag,
f_almost_full_flag,f_almost_empty_flag,d_in,r_en,w_en,CLK0_OUT,CLKDV_OUT,reset); 

endmodule


module ta_fifo5();
parameter f_width=8;
parameter f_depth=16;

wire [f_width-1:0] d_out;
wire f_full_flag,f_half_full_flag,f_almost_full_flag,f_empty_flag,f_almost_empty_flag;
reg [f_width-1:0] d_in;
reg r_en,w_en,r_clk,w_clk;
reg reset;
wire [3:0] r_ptr,w_ptr,ptr_diff;
assign r_ptr=ta_fifo5.r_ptr;
assign w_ptr=ta_fifo5.w_ptr;
assign ptr_diff=ta_fifo5.ptr_diff;
assign r_next_en=ta_fifo5.r_next_en;
assign w_next_en=ta_fifo5.w_next_en;

a_fifo5 ta_fifo5(d_out,f_full_flag,f_half_full_flag,f_empty_flag,

f_almost_full_flag,f_almost_empty_flag,d_in,r_en,w_en,r_clk,w_clk,reset);

initial #5000 $stop;
initial begin #10 r_clk=0; forever #10 r_clk=~r_clk; end
initial begin #5 w_clk=0; forever #50 w_clk=~w_clk; end

initial begin d_in=1;
@(posedge w_en);
repeat(20) @(posedge w_clk) d_in=d_in+2;
repeat(20) @(posedge w_clk) d_in=d_in-1;
end

initial begin reset=1;#30 reset=0;end
initial begin fork #50 w_en=1; #1800 w_en=0; #2500 w_en=1 ; join end
initial begin fork #50 r_en=0; #1850 r_en=1; #2400 r_en=0; #2500 r_en=1; join end
endmodule