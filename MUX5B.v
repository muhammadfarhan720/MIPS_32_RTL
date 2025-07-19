

module MUX5B(mux_in_1,mux_in_2,sel,mux_out);
input [4:0] mux_in_1;
input [4:0] mux_in_2;
input sel;
output [4:0] mux_out;

assign mux_out= (sel)? mux_in_2:mux_in_1;


endmodule
