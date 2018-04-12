module ablProcessor(clk,rst,out,in);

input clk;
input rst;

//ALU flags
wire ZERO;
wire NEG;

//board terminals
input [7:0] in;
output [7:0] out;
wire [7:0] OUTTERMINAL;

//GPRs
wire [7:0] A;
wire [7:0] B;
wire [7:0] C;
wire [7:0] D;

wire [7:0] effectiveAddress;
wire [7:0] nextAddress;
wire [15:0] instruction;
wire [2:0] branchOP;
wire [2:0] registerOP;
wire writeEnable;
wire [2:0] aluOP;
wire dataOP;
wire bypassData;
wire [7:0] multiplexOut;
wire [7:0] RA;
wire [7:0] RB;
wire [7:0] aluOut;
wire [7:0] dataOut;

branchUnit newAddress(
.clk(clk),
.rst(rst),
.BROP(branchOP),
.ZERO(ZERO),
.NEG(NEG),
.brAddr(instruction[7:0]),
.currAddr(nextAddress),
.effAddr(effectiveAddress)
);

programCounter PC(
.clk(clk),
.rst(rst),
.effAddr(effectiveAddress),
.currAddr(nextAddress)
);

instructionMem getInstruction(
.clk(clk),
.currAddr(nextAddress),
.inst(instruction)
);

instControl signalComp(
.opcode(instruction[15:12]),
.brx(instruction[11]),
.BROP(branchOP),
.REGOP(registerOP),
.WRITEREG(writeEnable),
.ALUOP(aluOP),
.DATAOP(dataOP),
.BYPASSMEM(bypassData)
);

registerMem getReg(
.rst(rst),
.clk(clk),
.regAddr1(instruction[11:10]),
.regAddr2(instruction[9:8]),
.immVal(instruction[7:0]),
.WRITEREG(writeEnable),
.REGOP(registerOP),
.readReg1(RA),
.readReg2(RB),
.inTerminal(in),
.outTerminal(OUTTERMINAL),
.outReg0(A),
.outReg1(B),
.outReg2(C),
.outReg3(D),
.wrData(multiplexOut)
);

assign out = OUTTERMINAL;

ALU numberCrunch(
.ALUOP(aluOP),
.readReg1(RA),
.readReg2(RB),
.resultALU(aluOut),
.ZERO(ZERO),
.NEG(NEG)
);

dataMem RAM(
.clk(clk),
.rst(rst),
.DATAOP(dataOP),
.useAddr(instruction[7:0]),
.readReg1(RA),
.dataOut(dataOut)
);


multiplexer2In dataORalu(
.resultData(dataOut),
.resultALU(aluOut),
.select(bypassData),
.dataOut(multiplexOut)
);

endmodule