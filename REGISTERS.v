
module REGISTERS(
     ReadRegister1,
     ReadRegister2,
     WriteRegister,
     WriteData_reg,
     RegWrite,
     ReadData1,
     ReadData2
    );
input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
input [31:0] WriteData_reg;
input RegWrite;
output [31:0] ReadData1, ReadData2;
reg [31:0] ReadData1, ReadData2; 
reg [31:0] REG[0:31];
integer i;
initial
begin
for(i=0;i<32;i=i+1)
REG[i]=0;
end
initial begin
REG[32'd10]=32'd11;
REG[32'd17]=32'd5;
REG[32'd18]=32'd6;
REG[32'd19]=32'd3;
REG[32'd20]=32'd4;
end
always@(posedge clock)
begin
if(RegWrite==1'b1)

REG[WriteRegister]=WriteData_reg;


ReadData1 <= REG[ReadRegister1];
ReadData2 <= REG[ReadRegister2];

end
endmodule