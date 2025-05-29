
module INSTRUCTIONMEMORY(
     ReadAddress,
     Instruction
    );
input [31:0] ReadAddress;
output [31:0] Instruction;
reg [31:0] Instruction ;
reg [31:0] Imemory[0:64];
integer i;
initial begin
for(i=0;i<64;i=i+1)
Imemory[i]=32'b0;
end
initial begin
Imemory[0] = 32'b00000010001100100100000000100000; //add $t0, $s1, $s2

Imemory[4] = 32'b00000010011101000100100000100000; //add $t1,$s3,$s4

Imemory[8] = 32'b00000001000010011000000000100010; //sub $s0,$t0,$t1



Imemory[12] =32'b00010010100100000000000000001100; //beq $s4,$s0, else[12]

Imemory[16]= 32'b10101110000010100000000000000000; //sw $t3,0($s0)


Imemory[64]=32'b00000010001100100100000000100000; //else{ add $t0, $s1, $s2}
end 
always @(ReadAddress)
Instruction=Imemory[ReadAddress];
endmodule
