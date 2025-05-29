`timescale 1ns / 1ps

module myCirc_cpu(
    input globalclock,
    input globalreset,
    

output _mux_out_alusrc,_Instruction,_ReadData1,_ReadData2,_mux_out_regfiledest_5b,_ALUresult,_shift_out,_pcout,_sel_branchornot,_Branch,_isZero,_sum_branchadder
);
wire [31:0] _Instruction;
wire [31:0] _pcout  ;
wire [31:0] _mux_out_branchornot;
wire [3:0] _ALUControl;  
wire [31:0] _mux_out_regfiledata;
wire [31:0] _ReadData1;
wire [31:0] _ReadData2;
wire _RegDst,_Branch,_MemRead,_MemtoReg,_MemWrite,_ALUSrc,_RegWrite;
wire [1:0] _ALUOp;
wire [31:0] _sign_out;
wire [31:0] _shift_out;
wire [31:0] _sum_pcplus4;
wire [31:0] _sum_branchadder;
wire _sel_regfiledest;
wire [31:0] _mux_out_alusrc;
wire Branch;
wire _sel_alusrc;
wire _sel_branchornot;

wire [4:0] _mux_out_regfiledest_5b;

wire [31:0] _ReadData;
wire [31:0] _ALUresult;
wire  _isZero;


PC mypc(.clock(globalclock),.reset(globalreset),.pcin(_mux_out_branchornot),.pcout(_pcout));
INSTRUCTIONMEMORY myinstructionmemory(.ReadAddress(_pcout),.Instruction(_Instruction));
REGISTERS myregisters(.ReadRegister1(_Instruction[25:21]),.ReadRegister2(_Instruction[20:16]),.WriteRegister(_mux_out_regfiledest_5b),.WriteData_reg(_mux_out_regfiledata),.RegWrite(_RegWrite),.ReadData1(_ReadData1),.ReadData2(_ReadData2),.clock(globalclock));
CONTROL mycontrol(.opcode(_Instruction[31:26]),.RegDst(_RegDst),.Branch(_Branch),.MemRead(_MemRead),.MemtoReg(_MemtoReg),.ALUOp(_ALUOp),.MemWrite(_MemWrite),.ALUSrc(_ALUSrc),.RegWrite(_RegWrite));
SIGNEXTEND mysignextend( .sign_in(_Instruction[15:0]), .sign_out(_sign_out) );
SHIFTLEFT myshiftleft( .shift_in(_sign_out), .shift_out(_shift_out) );
ADDPLUS4 myadd_pc_plus4(.data1(_pcout),.data2(32'd4),.sum(_sum_pcplus4));
ADD myadd_branchadder(.data1(_sum_pcplus4), .data2(_shift_out), .sum(_sum_branchadder));
MUX5B mymux_regfiledest( .mux_in_1(_Instruction[20:16]), .mux_in_2(_Instruction[15:11]), .sel(_RegDst), .mux_out(_mux_out_regfiledest_5b) );
MUX mymux_alusrc( .mux_in_1(_ReadData2), .mux_in_2(_sign_out), .sel(_ALUSrc), .mux_out(_mux_out_alusrc) );
AND a(.e(_Branch),.f(_isZero),.g(_sel_branchornot));
MUX mymux_branchornot( .mux_in_1(_sum_pcplus4), .mux_in_2(_sum_branchadder), .sel(_sel_branchornot), .mux_out(_mux_out_branchornot) );
MUX mymux_regfiledata( .mux_in_1(_ALUresult), .mux_in_2(_ReadData), .sel(_MemtoReg), .mux_out(_mux_out_regfiledata) );
ALUCONTROL myalucontrol( .ALUop(_ALUOp), .Funct(_Instruction[5:0]), .ALUControlout(_ALUControl) );
DATAMEMORY mydatamemory(.Address(_ALUresult),.MemWrite(_MemWrite),.MemRead(_MemRead),.WriteData(_ReadData2),.clock(globalclock),.ReadData(_ReadData));
ALU myalu( .Read_data_1(_ReadData1), .Read_data_2(_mux_out_alusrc), .ALUControl(_ALUControl), .ALUresult(_ALUresult),.isZero(_isZero) );    
    
endmodule