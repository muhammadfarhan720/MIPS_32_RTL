

module ALU(
     Read_data_1,
     Read_data_2,
     ALUControl,
     ALUresult,
     isZero
    );
input [31:0] Read_data_1, Read_data_2;
input [3:0] ALUControl;
output [31:0]ALUresult;
output reg isZero;
reg [31:0] ALUresult;
reg [3:0] addcode, subcode, andcode, orcode, sltcode;
initial begin
addcode[3:0] <= 4'b0010;
subcode[3:0] <= 4'b0110;
andcode[3:0] <= 4'b0000;
orcode[3:0] <= 4'b0001;
sltcode[3:0] <= 4'b0111;
end
always @(Read_data_1, Read_data_2, ALUControl)
if (ALUControl == addcode) //add
ALUresult = Read_data_1 + Read_data_2;
else if(ALUControl == subcode) //sub
ALUresult = Read_data_1 - Read_data_2;
else if(ALUControl == andcode) //and
ALUresult = Read_data_1 & Read_data_2;
else if(ALUControl == orcode) //or
ALUresult = Read_data_1 | Read_data_2;
else if(ALUControl == sltcode) //slt
if(Read_data_1 < Read_data_2)
ALUresult = 32'b00000000000000000000000000000001;
else
ALUresult = 32'b00000000000000000000000000000000;
always @(Read_data_1, Read_data_2, ALUControl,ALUresult)
if(ALUresult == 32'b0)
isZero = 1;
else
isZero = 0;
endmodule
 