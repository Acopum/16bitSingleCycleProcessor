module ALU(ALUOP,readReg1,readReg2,resultALU,ZERO,NEG);

input [2:0] ALUOP;
input signed [7:0] readReg1;
input signed [7:0] readReg2;

output reg signed [7:0] resultALU;

output reg ZERO;
output reg NEG;

initial begin
	resultALU <= 0;
	ZERO <= 0;
	NEG <= 0;
end

always @(ALUOP) begin
	
	case(ALUOP)
		default://NOP 
				  resultALU = 0;
		3'b001://ADD
				 begin
					resultALU = readReg1+readReg2;
					if(resultALU[7]==1) begin
						NEG <= 1;
					end
					else if(~(|resultALU)) begin
						ZERO <= 1;
					end
					else begin
						ZERO <= 0;
						NEG <= 0;
					end
				 end
		3'b010://SUB
				 begin
					resultALU = readReg1-readReg2;
					if(resultALU[7]==1) begin
						NEG <= 1;
					end
					else if(~(|resultALU)) begin
						ZERO <= 1;
					end
					else begin
						ZERO <= 0;
						NEG <= 0;
					end
				 end
		3'b011://NAND
				 begin
					resultALU = ~(readReg1&readReg2);
					if(resultALU[7]==1) begin
						NEG <= 1;
					end
					else if(~(|resultALU)) begin
						ZERO <= 1;
					end
					else begin
						ZERO <= 0;
						NEG <= 0;
					end
				 end
		3'b100://SHL
				 begin
					resultALU = readReg1<<1;
					if(readReg1[7]==1) begin
						ZERO <= 1;
					end
					else begin
						ZERO <= 0;
					end
				 end
		3'b101://SHR
				 begin
					resultALU = readReg1>>1;
					if(readReg1[0]==1) begin
						ZERO <= 1;
					end
					else begin
						ZERO <= 0;
					end
				 end
	endcase
end

endmodule