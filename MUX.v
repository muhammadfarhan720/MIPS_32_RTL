module MUX(mux_in_1,mux_in_2,sel,mux_out);
input [31:0] mux_in_1;
input [31:0] mux_in_2;
input sel;
output [31:0] mux_out;

assign mux_out=(sel==0)?mux_in_1:mux_in_2;

endmodule

