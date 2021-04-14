//Memoria de dados 16x4 bits.
module Dados_16x4(
input logic [3:0]endereco,
input logic write, read,
input logic [3:0]dado_in,
input logic clock,
output logic [3:0]dado_out
);

logic [3:0] RAM [15:0];

always_ff @ (posedge clock)
begin
if(write)
	begin
	RAM[endereco] <= dado_in;
	end
end

always_comb
begin
	if(read)
	begin
	dado_out <= RAM[endereco];
	end
	else
	begin
	dado_out <= 4'bzzzz;
	end
end

endmodule
