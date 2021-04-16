//Memória de Instrucao 64x17 Bits
module Instrucao_64x17(
input logic [5:0] endereco,
output logic [16:0] instrucao,
input logic read
);
logic [16:0] RAM [64:0];
initial
$readmemb("bin.txt", RAM);
assign instrucao = RAM[endereco];
/*
always_comb
begin
RAM[0] <= 10'b0010111010;
RAM[1] <= 10'b0000000011;
RAM[2] <= 10'b0010101010;
instrucao <= RAM[endereco];
end
*/
endmodule


