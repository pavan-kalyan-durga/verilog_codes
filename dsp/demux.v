
module demux(o1,o2,i,s);            //1x2 DEMUX

input i,s;
output o1,o2;
wire x,s_,w1,w2,w3,w4;

not(s_,s);
and(w1,s_,i);
and(w2,s,i);
and(w3,s,x);
and(w4,s_,x);
or(o1,w1,w3);
or(o2,w2,w4);
endmodule
