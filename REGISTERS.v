
module REGISTERS(
     ReadRegister1,
     ReadRegister2,
     WriteRegister,
     WriteData_reg,
     RegWrite,
     clock,
     ReadData1,
     ReadData2
    
    );
input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
input [31:0] WriteData_reg;
input RegWrite;
input clock; 
output [31:0] ReadData1, ReadData2;
reg [31:0] ReadData1, ReadData2; 
reg [31:0] REG[0:31];


initial begin
    REG[0]  = 32'd0;
    REG[1]  = 32'd0;
    REG[2]  = 32'd0;
    REG[3]  = 32'd0;
    REG[4]  = 32'd0;
    REG[5]  = 32'd0;
    REG[6]  = 32'd0;
    REG[7]  = 32'd0;
    REG[8]  = 32'd0;
    REG[9]  = 32'd0;
    REG[10] = 32'd11; // custom init
    REG[11] = 32'd0;
    REG[12] = 32'd0;
    REG[13] = 32'd0;
    REG[14] = 32'd0;
    REG[15] = 32'd0;
    REG[16] = 32'd0;
    REG[17] = 32'd5;  // custom init
    REG[18] = 32'd6;  // custom init
    REG[19] = 32'd3;  // custom init
    REG[20] = 32'd4;  // custom init
    REG[21] = 32'd0;
    REG[22] = 32'd0;
    REG[23] = 32'd0;
    REG[24] = 32'd0;
    REG[25] = 32'd0;
    REG[26] = 32'd0;
    REG[27] = 32'd0;
    REG[28] = 32'd0;
    REG[29] = 32'd0;
    REG[30] = 32'd0;
    REG[31] = 32'd0;
end



always@(posedge clock)

begin
if(RegWrite==1'b1)

REG[WriteRegister]<=WriteData_reg;

else
begin
ReadData1 <= REG[ReadRegister1];
ReadData2 <= REG[ReadRegister2];
end
end
endmodule