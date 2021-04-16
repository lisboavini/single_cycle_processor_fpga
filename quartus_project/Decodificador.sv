// Decodificador
module Decodificador(
input logic [16:0] codigo_maquina,
input logic zero,
output logic [3:0]Const_in,
output logic S2,S1,S0,Enable_Write,A2,A0,A1,B0, B1,B2, Mux_Imediato, Cin,ALU0,ALU1,Mux_Memoria, Write_Pc, clear, Write_RAM, Read_RAM,
output logic [5:0]endereco_Salto, //O endereco servira para a memoria de instrucao.
output logic [3:0]endereco_dados,
output logic externo
);

logic [16:0]codigo_maquina2;

always
begin
codigo_maquina2 <= codigo_maquina;
case(codigo_maquina2[16:12])

	5'b00000: begin // ADD
	S0 <= codigo_maquina2[6];
	S1 <= codigo_maquina2[7];
	S2 <= codigo_maquina2[8];
	A0 <= codigo_maquina2[3];
	A1 <= codigo_maquina2[4];
	A2 <= codigo_maquina2[5];
	B0 <= codigo_maquina2[0];
	B1 <= codigo_maquina2[1];
	B2 <= codigo_maquina2[2];
	Cin <= 0;
	ALU1 <= 0;
	ALU0 <= 1;
	Mux_Imediato <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	//endereco_dados <= 4'b0000;
	//endereco_Salto <= 5'b00000;
	//Const_in <= 4'b0000;
	end
	
	5'b00001:begin // SUB
	S0 <= codigo_maquina2[6];
	S1 <= codigo_maquina2[7];
	S2 <= codigo_maquina2[8];
	A0 <= codigo_maquina2[3];
	A1 <= codigo_maquina2[4];
	A2 <= codigo_maquina2[5];
	B0 <= codigo_maquina2[0];
	B1 <= codigo_maquina2[1];
	B2 <= codigo_maquina2[2];
	ALU1 <= 1;
	ALU0 <= 0;
	Cin <= 1;
	Mux_Imediato <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
	endereco_Salto <= 5'b00000;
	Const_in <= 4'b0000;
	end
	
	5'b00010:begin  // ADDi
	S0 <= codigo_maquina2[7];
	S1 <= codigo_maquina2[8];
	S2 <= codigo_maquina2[9];
	A0 <= codigo_maquina2[4];
	A1 <= codigo_maquina2[5];
	A2 <= codigo_maquina2[6];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 0;
	ALU0 <= 1;
	Cin <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
//	endereco_Salto <= 5'b00000;
	Const_in <= codigo_maquina2[3:0];
	end
	
	5'b00011:begin // SUBi
	S0 <= codigo_maquina2[7];
	S1 <= codigo_maquina2[8];
	S2 <= codigo_maquina2[9];
	A0 <= codigo_maquina2[4];
	A1 <= codigo_maquina2[5];
	A2 <= codigo_maquina2[6];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 0;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
//	endereco_Salto <= 5'b00000;
	Const_in <= codigo_maquina2[3:0];
	end
	
	5'b00100:begin // Mul
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	A0 <= codigo_maquina2[6];
	A1 <= codigo_maquina2[7];
	A2 <= codigo_maquina2[8];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 0;
	ALU1 <= 0;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
//	endereco_Salto <= 5'b00000;
	//Const_in <= codigo_maquina2[3:0];
	end
	
	5'b00101:begin //Div
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	A0 <= codigo_maquina2[6];
	A1 <= codigo_maquina2[7];
	A2 <= codigo_maquina2[8];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 0;
	Cin <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
//	endereco_Salto <= 5'b00000;
	//Const_in <= codigo_maquina2[3:0];
	end
	
	5'b00110:begin //Clr
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	//A0 <= codigo_maquina2[2];
	//A1 <= codigo_maquina2[3];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
//	endereco_Salto <= 5'b00000;
	//Const_in <= codigo_maquina2[3:0];
	end
	
	5'b00111:begin //Rst
	//S0 <= codigo_maquina2[4];
	//S1 <= codigo_maquina2[5];
	//A0 <= codigo_maquina2[2];
	//A1 <= codigo_maquina2[3];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 0;
	clear <= 1;
	Write_Pc <= 1;
	Write_RAM <= 0;
	Read_RAM <= 0;
	//endereco_dados <= 4'b0000;
	endereco_Salto <= 6'b000000;
	//Const_in <= codigo_maquina2[3:0];
	end
	
	5'b01000:begin //MOv
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	A0 <= codigo_maquina2[6];
	A1 <= codigo_maquina2[7];
	A2 <= codigo_maquina2[8];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 0;
	ALU0 <= 0;
	Cin <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
//	endereco_Salto <= 5'b00000;
	//Const_in <= codigo_maquina2[3:0];
	end
	5'b01001:begin // JMP
//	S0 <= codigo_maquina2[4];
//	S1 <= codigo_maquina2[5];
//	A0 <= codigo_maquina2[2];
//	A1 <= codigo_maquina2[3];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 0;
	clear <= 0;
	Write_Pc <= 1;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
	endereco_Salto <= codigo_maquina2[11:6];
	//Const_in <= codigo_maquina2[3:0];
	end
	
	5'b01010:begin // CMP
//	S0 <= codigo_maquina2[6];
//	S1 <= codigo_maquina2[7];
//	S2 <= codigo_maquina2[8];
	A0 <= codigo_maquina2[9];
	A1 <= codigo_maquina2[10];
	A2 <= codigo_maquina2[11];
	B0 <= codigo_maquina2[6];
	B1 <= codigo_maquina2[7];
	B2 <= codigo_maquina2[8];
	ALU1 <= 1;
	ALU0 <= 0;
	Cin <= 1;
	Mux_Imediato <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 0;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
	endereco_Salto <= 5'b00000;
	Const_in <= 4'b0000;
	end
	
	5'b01011:begin //JZ
//	S0 <= codigo_maquina2[4];
//	S1 <= codigo_maquina2[5];
//	A0 <= codigo_maquina2[2];
//	A1 <= codigo_maquina2[3];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 0;
	clear <= 0;
	if (zero)
	begin
	Write_Pc <= 1;
	end
	else
	begin
	Write_Pc <= 0;
	end
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
	endereco_Salto <= codigo_maquina2[11:6];
	//Const_in <= codigo_maquina2[3:0];
	end
	5'b01100:begin // Incremento
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	A0 <= codigo_maquina2[6];
	A1 <= codigo_maquina2[7];
	A2 <= codigo_maquina2[8];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 0;
	ALU1 <= 0;
	ALU0 <= 0;
	Cin <= 1;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
	//endereco_Salto <= codigo_maquina2[4:0];
	//Const_in <= codigo_maquina2[3:0];
	end
	5'b01101:begin //Decremento
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	A0 <= codigo_maquina2[6];
	A1 <= codigo_maquina2[7];
	A2 <= codigo_maquina2[8];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 0;
	Mux_Memoria <= 0;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	endereco_dados <= 4'b0000;
	//endereco_Salto <= codigo_maquina2[4:0];
	//Const_in <= codigo_maquina2[3:0];
	end
	5'b01110:begin //Load
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	//A0 <= codigo_maquina2[2];
	//A1 <= codigo_maquina2[3];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 1;
	externo <= 0;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 1;
	endereco_dados <= codigo_maquina2[8:5];
	//endereco_Salto <= codigo_maquina2[4:0];
	//Const_in <= codigo_maquina2[3:0];
	end
	5'b01111:begin //Store
	//S0 <= codigo_maquina2[4];
	//S1 <= codigo_maquina2[5];
	A0 <= codigo_maquina2[9];
	A1 <= codigo_maquina2[10];
	A2 <= codigo_maquina2[11];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 1;
	externo <= 0;
	Enable_Write <= 0;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 1;
	Read_RAM <= 0;
	endereco_dados <= codigo_maquina2[8:5];
	//endereco_Salto <= codigo_maquina2[4:0];
	//Const_in <= codigo_maquina2[3:0];
	end
	5'b10000:begin // RIO
	S0 <= codigo_maquina2[9];
	S1 <= codigo_maquina2[10];
	S2 <= codigo_maquina2[11];
	//A0 <= codigo_maquina2[4];
	//A1 <= codigo_maquina2[5];
	//B0 <= codigo_maquina2[0];
	//B1 <= codigo_maquina2[1];
	Mux_Imediato <= 1;
	ALU1 <= 1;
	ALU0 <= 1;
	Cin <= 1;
	Mux_Memoria <= 1;
	externo <= 1;
	Enable_Write <= 1;
	clear <= 0;
	Write_Pc <= 0;
	Write_RAM <= 0;
	Read_RAM <= 0;
	//endereco_dados <= codigo_maquina2[3:0];
	//endereco_Salto <= codigo_maquina2[4:0];
	//Const_in <= codigo_maquina2[3:0];
	end
endcase
end
endmodule