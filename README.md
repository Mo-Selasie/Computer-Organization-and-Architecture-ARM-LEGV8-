# Computer-Organization-and-Architecture-ARM-LEGV8-
Final Project EE0025 with Professor Mark Hempstead

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Features](#features)
- [Architecture](#architecture)
- [Authors](#authors)

## Introduction
Hello! This project is a Pipelined ARM-LEGv8 CPU Architecture Implementation project, a comprehensive VHDL-based simulation of a modern pipelined processor. This project is an endeavor to create a fully functional model of a CPU based on the ARM architecture, specifically tailored to the LEGv8 instruction set, a learning-focused variant of ARMv8 that only implements a section of the alu operations. The primary goal is to provide a detailed and interactive educational tool that demonstrates the intricate workings of a pipelined CPU.
This project focuses on certain parts of a modern CPU including:
1. **Five-Stage Pipeline:** this is made up of the Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), 
and Write Back (WB) stages. 
2. **Hazard Detection and Resolution:** the cpu incorporates a hazard detection unit which predicts data hazards and reolves them with either 
a forwarding unit or stalling, depending on the instruction type.
3. **Memory and Register Modules:** the cpu entity uses entities which simulate data memory operations and register file interactions.

This current implementation does not make use of branch detection units, hence branches are a current bug in the simulation. It is adviced to not include branch instructions in any testing simulations.
A first version which does not include any pipelining is also included to test the basic functionality of the cpu. 

## Usage
Run the simulation using your preferred VHDL simulator (e.g., ModelSim, GHDL).
With GHDL, run *make p1* or *make p2* to run either imem entities, then run *make clean* to clean .ghw files afterwards.

## Features
- **Pipelined Architecture**: Implements a basic pipelined structure, enhancing processing speed and efficiency.
- **Probe Ports for Testing**: Includes debug ports like `DEBUG_FORWARDA`, `DEBUG_FORWARDB`, `DEBUG_PC`, etc., for observing the internal states and signals during simulation.
- **Customizable Components**: The entity is designed with modularity in mind, allowing for easy integration and replacement of sub-components like ALU, Registers, Program Counter, etc.
- **Signal Flow Control**: Implements various control signals for managing data flow and operations within the pipeline.

## Architecture
The architecture `structural` of the main `PipelinedCPU1` includes:
- Signal declarations for internal operations.
- Component definitions for Instruction Memory (IMEM), Program Counter (PC), ALU, Registers, and various multiplexers and control units.
- Mapping of these components to the defined signals.

## Author
Selasie Mortey
