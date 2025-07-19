`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2025 08:23:45 PM
// Design Name: 
// Module Name: SIGNEXTEND
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module SIGNEXTEND(sign_in, sign_out);
input [15:0] sign_in;
output [31:0] sign_out;

assign sign_out=(sign_in[15] == 0)?{32'b000000000000000000,sign_in}:{32'b111111111111111111,sign_in};

endmodule
