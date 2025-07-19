

module ALU(
     Read_data_1,
     Read_data_2,
     ALUControl,
     ALUresult,
     isZero
    );
input [31:0] Read_data_1, Read_data_2;
input [3:0] ALUControl;
output reg [31:0] ALUresult;
output isZero;
//reg [31:0] ALUresult;
//reg [3:0] addcode, subcode, andcode, orcode, sltcode;


parameter [3:0] addcode = 4'b0010;
parameter [3:0] subcode = 4'b0110;
parameter [3:0] andcode = 4'b0000;
parameter [3:0] orcode = 4'b0001;
parameter [3:0] sltcode= 4'b0111;

always @(*)begin
casez (ALUControl) 

addcode: ALUresult = Read_data_1 + Read_data_2;
subcode: ALUresult = Read_data_1 - Read_data_2;
andcode: ALUresult = Read_data_1 & Read_data_2;
orcode: ALUresult = Read_data_1 | Read_data_2;
sltcode: begin //slt
if(Read_data_1 < Read_data_2)
ALUresult = 32'b00000000000000000000000000000001;
else
ALUresult = 32'b00000000000000000000000000000000;
end
default : ALUresult=32'b0; 
endcase
end

assign isZero= (ALUresult == 32'b0)? 1:0;


endmodule
 