//Program Counting
module PC(
output logic [5:0]endereco_instrucao,
input logic clock, write, clear,
input logic [5:0]salto,
output logic write_memoria
);

logic [5:0] endereco;
logic auxiliar;
logic [5:0] auxiliar2;
initial endereco = 6'b000000;



always_ff @(negedge clock)
begin
	if (write)
	begin
		auxiliar <= 1;
		auxiliar2 <= salto;
		
	end
	else
	begin
		auxiliar <= 0;
	end
end

always_ff @ (posedge clock)
begin
	if (auxiliar ==1)
	begin
	endereco_instrucao <= auxiliar2;
	endereco <= auxiliar2 + 1;
	end
	else
	begin
		endereco_instrucao <= endereco;
		endereco <= endereco +1;
		if(endereco == 6'd63)
		begin
		endereco <= 6'b000000;
		end
	end
end




/*
always_ff @(negedge clock)
begin
	if (clear)
	begin
	auxiliar <= 1;
	end
	else
	begin
	auxiliar <= 0;
	end
end
	
always_ff @ (posedge clock)
begin
	if (auxiliar ==1)
	begin
	endereco <= 5'b00000;
	endereco_instrucao <= endereco;
	end
	if(~write)
	begin
		write_memoria <= 1;
		endereco_instrucao <= endereco;
		endereco <= endereco +1;
		if(endereco == 5'd19)
		begin
		endereco <= 5'b00000;
		end
	end
	else if (write)
	begin
		write_memoria <= 1;
		endereco <= salto;
		endereco_instrucao <= salto;
	end
end
*/
endmodule
