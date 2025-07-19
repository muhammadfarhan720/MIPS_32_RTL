
module ADD(
     data1,
     data2,
     sum
    );
input [31:0] data1;
input [31:0] data2;
output [31:0]sum;

assign sum = data1 + data2 ;

endmodule
