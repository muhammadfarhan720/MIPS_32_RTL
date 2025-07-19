module INSTRUCTIONMEMORY(
     ReadAddress,
     Instruction
    );
input [31:0] ReadAddress;
output wire [31:0] Instruction;

reg [31:0] Imemory[0:64];  // Instruction memory

initial begin
    // Manual initialization of memory values
    Imemory[0]  = 32'b00000010001100100100000000100000; // add $t0, $s1, $s2
    Imemory[1]  = 32'b0;
    Imemory[2]  = 32'b0;
    Imemory[3]  = 32'b0;
    Imemory[4]  = 32'b00000010011101000100100000100000; // add $t1, $s3, $s4
    Imemory[5]  = 32'b0;
    Imemory[6]  = 32'b0;
    Imemory[7]  = 32'b0;
    Imemory[8]  = 32'b00000001000010011000000000100010; // sub $s0, $t0, $t1
    Imemory[9]  = 32'b0;
    Imemory[10] = 32'b0;
    Imemory[11] = 32'b0;
    Imemory[12] = 32'b00010010100100000000000000001100; // beq $s4, $s0, else[12]
    Imemory[13] = 32'b0;
    Imemory[14] = 32'b0;
    Imemory[15] = 32'b0;
    Imemory[16] = 32'b10101110000010100000000000000000; // sw $t3, 0($s0)
    Imemory[17] = 32'b0;
    Imemory[18] = 32'b0;
    Imemory[19] = 32'b0;
    Imemory[20] = 32'b0;
    Imemory[21] = 32'b0;
    Imemory[22] = 32'b0;
    Imemory[23] = 32'b0;
    Imemory[24] = 32'b0;
    Imemory[25] = 32'b0;
    Imemory[26] = 32'b0;
    Imemory[27] = 32'b0;
    Imemory[28] = 32'b0;
    Imemory[29] = 32'b0;
    Imemory[30] = 32'b0;
    Imemory[31] = 32'b0;
    Imemory[32] = 32'b0;
    Imemory[33] = 32'b0;
    Imemory[34] = 32'b0;
    Imemory[35] = 32'b0;
    Imemory[36] = 32'b0;
    Imemory[37] = 32'b0;
    Imemory[38] = 32'b0;
    Imemory[39] = 32'b0;
    Imemory[40] = 32'b0;
    Imemory[41] = 32'b0;
    Imemory[42] = 32'b0;
    Imemory[43] = 32'b0;
    Imemory[44] = 32'b0;
    Imemory[45] = 32'b0;
    Imemory[46] = 32'b0;
    Imemory[47] = 32'b0;
    Imemory[48] = 32'b0;
    Imemory[49] = 32'b0;
    Imemory[50] = 32'b0;
    Imemory[51] = 32'b0;
    Imemory[52] = 32'b0;
    Imemory[53] = 32'b0;
    Imemory[54] = 32'b0;
    Imemory[55] = 32'b0;
    Imemory[56] = 32'b0;
    Imemory[57] = 32'b0;
    Imemory[58] = 32'b0;
    Imemory[59] = 32'b0;
    Imemory[60] = 32'b0;
    Imemory[61] = 32'b0;
    Imemory[62] = 32'b0;
    Imemory[63] = 32'b0;
    Imemory[64] = 32'b00000010001100100100000000100000; // else: add $t0, $s1, $s2
end

assign Instruction = Imemory[ReadAddress];

endmodule
