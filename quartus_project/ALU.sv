// ALU
module ALU(
input logic S0, S1,
input logic Cin,
input logic [3:0]A,
input logic [3:0]B,
output logic Cout, Z,
output logic [3:0]G,
output logic N
);
always@*
begin
Cout <= 1'b0;
Z <= 1'b0;
N <= 1'b0;
if(S0 == 0 & S1 == 0)
begin
	if(Cin)
	begin
		G <= A + 4'b0001;
	end
	else
	begin
		G <= B;
	end
end
if(S0==1 & S1 == 0 )
begin
	if(Cin)
	begin
		G <= A << 1;
	end
	else
	begin
		G <= A + B;
		if (A[3] & B[3])
		begin
			Cout <= 1'b1;		//Carry out da soma
		end
	end
end
if(S0==0 & S1 == 1 )
begin
	if(Cin)
	begin
		G <= A - B;
		if (B > A)
		begin
			N <= 1'b1;	//Flag N
		end
		if(G == 4'b0000)
		begin
			Z <= 1'b1;	//Flag ZERO
		end
	end
	else
	begin
		G <= A >> 1;
	end
end
if(S1==1 & S0 ==1 )
begin
	if(Cin)
	begin
		G <= 4'b0000;
	end
	else
	begin
	if (A == 4'b0001)
	begin
		Z <= 1;		//Flag ZERO
	end
	if (A == 4'b0000)
	begin
		N <= 1'b1;
	end
		G <= A - 4'b0001;
	end
end
end
endmodule