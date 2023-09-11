module seq_001 (inp,clk,rst,det);
input inp,clk,rst;
output reg det;
reg [1:0] pr_state,nxt_state;
parameter s0=2'b00 , s1=2'b01 , s2= 2'b10;
always @(posedge clk)
if (rst)
pr_state = s0;
else
pr_state = nxt_state;
always @(inp,pr_state)
case (pr_state)
s0 : if (inp)
nxt_state = s0;
else
nxt_state = s1;
s1 : if (inp)
nxt_state = s0;
else
nxt_state = s2;
s2 : if (inp)
nxt_state = s0;
else
nxt_state = s2;
default : nxt_state =s0;
endcase
always @(inp,pr_state)
case(pr_state)
s0 : det = 0;
s1 : det = 0;
s2: if(inp)
det = 1;
else
det = 0;
default det =0;
endcase
endmodule

