
module PC (clock, reset, pcin, pcout);
	input clock, reset;
	input [31:0] pcin;
	output [31:0] pcout;
	reg [31:0] pcout;
	always @ (posedge clock or posedge reset)
	begin
		if(reset==1'b1)
			pcout<=0;
		else
			pcout<=pcin;
	end
endmodule