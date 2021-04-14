// Registrador 4 bits
module Register_4_bits(
input logic [3:0]A,
input logic clock, Clear,
output logic [3:0]O
);
logic [3:0]O_intermediario;

/*
always_ff @ (negedge clock)
begin
	O_intermediario <= A;

end
*/

always_ff @ (posedge clock)
begin
	O <= A;
	if (Clear)
	begin
	O <= 4'b0000;
	end
end

endmodule
