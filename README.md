Verilog code for a 32-bit pipelined MIPS processor.

Datapath diagram with control signals is included in PDF format.

Combination of gate-level, dataflow and behavioural modelling.

Remarks:
* Instruction Memory for 32 32-bit MIPS instructions.
* 32 32-bit Data Memory locations.
* Instruction Memory consisting of arithmetic, logical, branch, jump, and memory-access instructions. Immediate arguments and argument registers are hard-coded.
* TRAP destination is generally OS-specific, and has been left to zero here.
* 5-stage pipelining; stages are:
  - Instruction Fetch   (IF)
  - Instruction Decode  (ID)
  - Execute             (EX)
  - Memory Access       (MEM)
  - Writeback           (WB)
* *Data Forwarding Unit* to partially resolve hazards in R-type instructions.
* *Hazard Detection Unit* to insert stalls (nop cycles) wherever required.
