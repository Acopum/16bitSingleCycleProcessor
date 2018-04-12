module instControl(opcode,brx,BROP,REGOP,WRITEREG,ALUOP,DATAOP,BYPASSMEM);

input [3:0] opcode;
input brx;

output reg [2:0] BROP;
output reg [2:0] REGOP;
output reg WRITEREG;
output reg [2:0]ALUOP;
output reg DATAOP;
output reg BYPASSMEM;

initial begin
	WRITEREG <= 0;
	BYPASSMEM <= 1;
	REGOP <= 3'b000;
	ALUOP <= 3'b000;
	DATAOP <= 0;
	BROP <= 3'b000;
end

always @(*) begin
	case(opcode)
		4'b0000://NOP
				  begin
				   WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0001://ADD
				  begin
				   WRITEREG <= 1;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b001;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0010://SUB
				  begin
					WRITEREG <= 1;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b010;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0011://NAND
				  begin
				   WRITEREG <= 1;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b011;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0100://SHL
				  begin
				   WRITEREG <= 1;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b100;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0101://SHR
				  begin
				   WRITEREG <= 1;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b101;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0110://OUT
				  begin
				   WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b110;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b0111://IN
				  begin
					WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b111;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b1000://MOV
				  begin
				   WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b101;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b1001://BR
				  begin
				   WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b100;
				  end
		4'b1010://BRX
				  begin
				   if(brx==0) begin //ZERO
						WRITEREG <= 0;
						BYPASSMEM <= 1;
						REGOP <= 3'b000;
						ALUOP <= 3'b000;
						DATAOP <= 0;
						BROP <= 3'b001;
					end
					else begin //NEG
						WRITEREG <= 0;
						BYPASSMEM <= 1;
						REGOP <= 3'b000;
						ALUOP <= 3'b000;
						DATAOP <= 0;
						BROP <= 3'b010;
					end
				  end
		4'b1011://BRSUB
				  begin
						WRITEREG <= 0;
						BYPASSMEM <= 1;
						REGOP <= 3'b000;
						ALUOP <= 3'b000;
						DATAOP <= 0;
						BROP <= 3'b011;
				  end
		4'b1100://RETURN
				  begin
						WRITEREG <= 0;
						BYPASSMEM <= 1;
						REGOP <= 3'b000;
						ALUOP <= 3'b000;
						DATAOP <= 0;
						BROP <= 3'b101;
				  end
		4'b1101://LOAD
				  begin
					WRITEREG <= 1;
					BYPASSMEM <= 0;
					REGOP <= 3'b000;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		4'b1110://STORE
				  begin
					WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b000;
					DATAOP <= 1;
					BROP <= 3'b000;
				  end
		
		4'b1111://LOADIMM
				  begin
					WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b100;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
		default://NOP
				  begin
				   WRITEREG <= 0;
					BYPASSMEM <= 1;
					REGOP <= 3'b000;
					ALUOP <= 3'b000;
					DATAOP <= 0;
					BROP <= 3'b000;
				  end
	endcase
end

endmodule