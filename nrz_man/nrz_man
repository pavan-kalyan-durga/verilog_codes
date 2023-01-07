module nrz_man(input nrz,clk, output reg man);
parameter s0=2'b0, s1=2'b1, s2=2'd2,s3=2'd3;
reg [1:0]state=s0;
reg [1:0]nxtstate=s0;



always@(posedge clk) 
begin state<=nxtstate; end 

always@(state)
begin 
man=1'b0;
case(state)
s0: nxtstate=nrz?s3:s1;
s1: nxtstate=nrz?s1:s2;
s2: begin man=1'b1; nxtstate=nrz?s3:s1; end
s3: begin man=1'b1; nxtstate=nrz?s0:s3; end
default:begin man=1'b0; nxtstate=s0; end
endcase

end
endmodule

