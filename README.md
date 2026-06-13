# ⚡ RISC-V Soft Core

A simple RISC-V processor implemented in Verilog — ALU, Register File, and CPU with simulation testbenches.

## 🏗️ Components
- **ALU** — ADD, SUB, AND, OR, XOR, SLT, SLL, SRL
- **Register File** — 32 x 32-bit registers (x0 hardwired to 0)
- **CPU** — Instruction fetch, decode, execute with PC counter

## ✅ Simulation Results
ADD: 10 + 5 = 15 | SUB: 10 - 3 = 7 | SLT: 5 < 10 = 1 | PC increments: 0x4, 0x8, 0xc

## 🛠️ Tools
Icarus Verilog (iverilog), VVP simulator

## ▶️ Quick Start
iverilog -o sim/alu_sim tests/alu_tb.v rtl/alu.v && vvp sim/alu_sim
iverilog -o sim/cpu_sim tests/cpu_tb.v rtl/cpu.v rtl/alu.v rtl/regfile.v && vvp sim/cpu_sim

## 👨‍💻 Author
Yuvraj | ECE @ Manipal University Jaipur
