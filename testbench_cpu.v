
  
module tb_cpu;

reg globalclock;
reg globalreset;
wire [31:0] _mux_out_alusrc;
wire [31:0] _Instruction;
wire [31:0] _ReadData1;
wire [31:0] _ReadData2;
wire [4:0] _mux_out_regfiledest_5b;
wire [31:0] _ALUresult;
wire [31:0] _shift_out;
wire [31:0] _pcout  ;
wire _sel_branchornot;
wire  _isZero;
wire _Branch;
wire [31:0] _sum_branchadder;
myCirc_cpu cpu_tb (globalclock, globalreset, _mux_out_alusrc,_Instruction, _ReadData1,_ReadData2,_mux_out_regfiledest_5b,_ALUresult,_shift_out,_pcout,_sel_branchornot, _isZero,_Branch, _sum_branchadder );

initial 
begin
globalreset<=1;
#0.01;
globalreset<=0;
end

always
begin
globalclock = 1'b0;
forever begin #50 globalclock = ~globalclock;

end 
end
endmodule 
