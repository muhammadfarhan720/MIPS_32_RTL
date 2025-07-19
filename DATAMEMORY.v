
module DATAMEMORY(
     Address,
     MemWrite,
     MemRead,
     WriteData,
     clock,
     ReadData
    );
input [31:0] Address;
input MemWrite;
input MemRead;
input [31:0] WriteData;
input clock;
output [31:0] ReadData;
reg [31:0] ReadData;
reg [31:0] RAM[0:63];
integer i;
initial
begin
for(i=0;i<64;i=i+1)
RAM[i]=0;
end
always @(posedge clock)begin
if(MemWrite==1'b1)
RAM[Address]<=WriteData;
else if(MemRead==1'b1)
ReadData<=RAM[Address];

else 
begin
RAM[Address]<=32'bx;
ReadData<=32'bx;
end
end
endmodule

