
 module ALUCONTROL(ALUop,Funct,ALUControlout);  
 
 input [1:0] ALUop;  
 input [5:0] Funct;  
 output  reg [3:0] ALUControlout;  
 wire [7:0] ALUControlIn; 
// reg [3:0] ALUControlout; 
 assign  ALUControlIn = {ALUop,Funct};  
 always @(*)begin
   
 casez (ALUControlIn)  
  8'b00??????: ALUControlout=4'b0010;  
  8'b01??????: ALUControlout=4'b0110;  
  8'b10100000: ALUControlout=4'b0010;  
  8'b10100010: ALUControlout=4'b0110;  
  8'b10100100: ALUControlout=4'b0000;
  8'b10100101: ALUControlout=4'b0001;
  8'b10101010: ALUControlout=4'b0111;  
  default: ALUControlout=4'b0000;  
  endcase  
 end
 endmodule  