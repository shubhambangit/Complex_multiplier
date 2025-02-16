# Complex Number Multiplier

A Verilog-based **Complex Number Multiplier** that computes the product of two complex numbers using a structured **datapath** and **finite state machine (FSM) control unit**.

## Features
- Implements complex multiplication: **(ar + ai*j) * (br + bi*j)**
- Uses **structural modeling** with **datapath** and **FSM-based control**.
- Includes **clock-enabled registers** for efficient data handling.
- **Testbench** for verification with waveform generation.

## File Structure
```
├── datapath.v         # Arithmetic operations for complex multiplication
├── control_unit.v     # FSM to control data flow
├── top.v              # Integration of datapath and control unit
├── top_tb.v           # Testbench for simulation
└── README.md          # Project documentation
```

## Installation
Please make sure you have a Verilog simulator like **Intel Quartus** installed.

## Example Input & Output
### Inputs:
```
ar = 15, ai = 10, br = 5, bi = 3
```
### Expected Outputs:
```
Pr = 45, Pi = 25
```

## Author
**Shubhang Bandyopadhyay**

## License
This project is open-source, feel free to use😇😇.
