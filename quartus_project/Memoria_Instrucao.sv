//Memória de Instrucao 20x10 Bits
module Instrucao_20x10(
input logic [4:0] endereco,
output logic [9:0] instrucao,
input logic read
);
logic [9:0] RAM [19:0];
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


