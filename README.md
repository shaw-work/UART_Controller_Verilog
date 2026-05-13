# UART Controller in Verilog

## Overview
This project implements a UART (Universal Asynchronous Receiver Transmitter) communication controller using Verilog HDL.

The design includes:
- Baud Rate Generator
- UART Transmitter (TX)
- UART Receiver (RX)
- UART Loopback Verification
- Testbench Simulation

## Tools Used
- Vivado
- Verilog HDL

## Features
- 32-bit simulation environment
- Serial data transmission and reception
- Loopback communication
- Behavioral simulation verification

## Project Structure

```text
src/
 ├── baud_gen.v
 ├── uart_tx.v
 ├── uart_rx.v
 └── uart_top.v

tb/
 └── uart_tb.v
```

## Simulation Result
UART successfully transmitted and received:
```text
8'h41
```

## Author
Shaw
