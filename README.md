# 4×4 Synchronous FIFO using Verilog HDL

## Overview

This project implements a 4×4 Synchronous FIFO (First-In First-Out) memory in Verilog HDL.

A FIFO is a memory structure in which the first data written into the buffer is the first data read from it. FIFOs are widely used in digital systems for temporary data storage, buffering, and data transfer between modules operating at different processing rates. The fundamental FIFO principle is "First In, First Out," ensuring data ordering is preserved throughout storage and retrieval operations.

This design implements a synchronous FIFO where both read and write operations are controlled by a common clock signal. The FIFO uses a circular buffer architecture with independent read and write pointers to manage data storage efficiently.

The project includes RTL design, functional verification through simulation, waveform analysis, and synthesis results generated using Quartus II and ModelSim-Altera.

---

## Design Specifications

| Parameter            | Value              |
| -------------------- | ------------------ |
| FIFO Depth           | 4 Locations        |
| Data Width           | 4 Bits             |
| Read Pointer Width   | 2 Bits             |
| Write Pointer Width  | 2 Bits             |
| Count Register Width | 3 Bits             |
| Clock Type           | Single Clock       |
| Reset Type           | Asynchronous Clear |
| Architecture         | Circular Buffer    |

---

## Features

* Synchronous FIFO operation
* Circular buffer implementation
* Independent read and write pointers
* Full flag generation
* Empty flag generation
* Simultaneous read/write support
* Memory occupancy tracking using counter
* Asynchronous reset functionality
* Simple and modular RTL design

---

## FIFO Architecture

The FIFO consists of:

### Memory Array

A 4-location memory array stores incoming data.

```verilog
reg [3:0] mem [0:3];
```

Each location stores one 4-bit data word.

### Write Pointer

The write pointer tracks the next available memory location for incoming data.

### Read Pointer

The read pointer tracks the next data location to be read.

### Occupancy Counter

A counter keeps track of the number of stored elements.

```text
count = Number of valid entries in FIFO
```

The counter is updated during write and read operations.

### Status Flags

Two status flags indicate FIFO condition:

#### Full Flag

```text
Full = 1 when count = 4
```

Prevents further write operations.

#### Empty Flag

```text
Empty = 1 when count = 0
```

Prevents invalid read operations.

---

## Working Principle

### Write Operation

A write occurs when:

```text
wenable = 1
full = 0
```

The FIFO:

1. Stores input data at the write pointer location.
2. Increments the write pointer.
3. Increments the occupancy counter.

### Read Operation

A read occurs when:

```text
renable = 1
empty = 0
```

The FIFO:

1. Reads data from the read pointer location.
2. Updates output data.
3. Increments the read pointer.
4. Decrements the occupancy counter.

### FIFO Behaviour

The FIFO follows strict First-In First-Out ordering:

```text
Write Order:
D1 → D2 → D3 → D4

Read Order:
D1 → D2 → D3 → D4
```

The earliest written data is always read first.

---

## RTL Design Components

### Memory Block

Stores incoming FIFO data.

### Read Pointer Logic

Controls sequential data retrieval.

### Write Pointer Logic

Controls sequential data insertion.

### Counter Logic

Tracks FIFO occupancy.

### Flag Generation Logic

Generates:

* FULL flag
* EMPTY flag

based on FIFO occupancy.

---

## Testbench Verification

The testbench verifies FIFO functionality under multiple operating conditions.

### Test Cases

#### Reset Verification

Checks:

* Pointer initialization
* Counter reset
* Output reset
* Flag initialization

#### Multiple Write Operations

Writes the following data sequence:

```text
0001
0010
0011
```

Verifies:

* Data storage
* Pointer increment
* Counter increment

#### Read Operation

Reads stored data and verifies FIFO ordering.

#### Additional Write Operations

Writes:

```text
0100
0101
```

Verifies circular buffer operation.

#### Multiple Read Operations

Reads all remaining entries and verifies:

* FIFO sequence preservation
* Proper pointer updates
* Counter decrements

#### Empty Condition Verification

Ensures:

```text
empty = 1
```

after all data has been read.

---

## Simulation Results

Simulation confirms:

* Correct FIFO ordering
* Proper write functionality
* Proper read functionality
* Correct pointer movement
* Accurate count tracking
* Correct Full flag generation
* Correct Empty flag generation
* Reliable reset operation

---

## Synthesis Results

Logic synthesis was performed using Quartus II.

Generated outputs include:

* RTL Viewer
* Compilation Report
* Resource Utilization Summary

---

## Applications

Synchronous FIFOs are widely used in:

* Digital communication systems
* FPGA and ASIC designs
* Processor data buffering
* DMA controllers
* Packet processing systems
* Embedded systems
* High-speed data acquisition
* Data streaming applications

---

## Reference

FIFO architecture concepts were studied using Texas Instruments FIFO documentation and application notes.

---

## Author

Shaan Garg
