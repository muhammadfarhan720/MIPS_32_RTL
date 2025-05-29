

module MUX5B(mux_in_1,mux_in_2,sel,mux_out);
input [4:0] mux_in_1;
input [4:0] mux_in_2;
input sel;
output [4:0] mux_out;
reg [4:0] mux_out;
always @(*)
if(sel==1'b0)
mux_out=mux_in_1;
else
mux_out=mux_in_2;
endmodule
