# RISCV 32-bit RTL CPU Design

The project features a 32-bit MIPS CPU designed to execute instructions in a single clock cycle. It is built from scratch using Verilog. The processor is inspired by MIPS/RISC-V architecture principles and supports a subset of R-type and I-type instructions, consisting of core processor components and essential operations like instruction fetching, arithmetic computations, and memory access.

# RISCV_32_RTL Architecture (Vivado Schematic)

![CPU_synthesis_picture](https://github.com/user-attachments/assets/47b53ce0-1d1e-4cbc-953d-b07b1fb17403)


## Core Modules and Functionality

- **Program Counter (PC)**  
  Advances instruction execution by updating the address for the next instruction.

- **Instruction Memory**  
  Holds the instruction set. Instructions are fetched based on the current PC value.

- **Register File**  
  Includes 32 general-purpose registers. Supports synchronous write and asynchronous read.

- **ALU (Arithmetic Logic Unit)**  
  Performs arithmetic and logic operations such as addition and subtraction.

- **Control Unit**  
  Decodes instructions and generates necessary control signals for other components.

- **Data Memory**  
  Used for load (`lw`) and store (`sw`) operations. Supports read and write based on control signals.

- **Multiplexers (MUX)**  
  Directs the correct data flow for operands and addresses.

- **Branching Logic**  
  Implements branch decision-making using ALU Zero flag, Sign Extension, Shift Unit, and Branch Adder.


## Verification and Testing

The design was tested and verified by hardcoding the following instruction opcodes in the Instruction memory and by supplying a global clock from testbench in Xilinx Vivado Simulator. Coverage focused on:

- Correct execution of R-type and I-type instructions.
- Accurate memory access and data routing.
- Validation of branch and jump conditions.

Test instructions include:
- `add`
- `sub`
- `lw`
- `sw`
- Condition branching i.e. `beq`

  
## Verification Demo 

- **Click the following thumbnail to see verification demo of the RISCV CPU**  

[![Thumbnail for video demo](https://github.com/muhammadfarhan720/RISCV_32_RTL/blob/main/images/thumbnail.jpg)](https://drive.google.com/file/d/1yRraBUmZkpqJb0yo4v_YvGIFItMjVyWn/view?usp=sharing)
*Click the thumbnail to view the executions of R & I type Instructions and their verification*
