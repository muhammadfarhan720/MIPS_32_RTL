
module CONTROL(
     opcode,
     RegDst,
     Branch,
     MemRead,
     MemtoReg,
     MemWrite,
     ALUSrc,
     RegWrite,
     ALUOp
    );
    input [5:0] opcode;
output RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output [1:0] ALUOp;
reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
reg [1:0] ALUOp;
always @(opcode)
begin
if(opcode==6'b000000) //r controls
begin
RegDst<=1'b1;
ALUSrc<=1'b0;
MemtoReg<=1'b0;
RegWrite<=1'b1;
MemRead<=1'b0;
MemWrite<=1'b0;
Branch<=1'b0;
ALUOp<=2'b10;
end
if(opcode==6'b100011) //lw controls
begin
RegDst<=1'b0;
ALUSrc<=1'b1;
MemtoReg<=1'b1;
RegWrite<=1'b1;
MemRead<=1'b1;
MemWrite<=1'b0;
Branch<=1'b0;
ALUOp<=2'b00;
end
if(opcode==6'b101011) //sw controls
begin
RegDst<=1'bx;
ALUSrc<=1'b1;
MemtoReg<=1'bx;
RegWrite<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b1;
Branch<=1'b0;
ALUOp<=2'b00;
end
if(opcode==6'b000100) //beq controls
begin
RegDst<=1'bx;
ALUSrc<=1'b0;
MemtoReg<=1'bx;
RegWrite<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
Branch<=1'b1;
ALUOp<=2'b01;
end
end
endmodule
