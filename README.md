# 🔢 N×N MAC (Multiply-Accumulate) Array in Verilog

This project implements a parameterized N×N Multiply-Accumulate (MAC) array using Verilog RTL. It is optimized for AI/ML inference, signal processing, and embedded applications where efficient computation is crucial.

## 📁 Project Structure

```
mac_array_project/
├── src/
│   ├── mac_unit.v          # 1x1 MAC unit module
│   └── mac_array.v         # N×N MAC array using generate block
├── tb/
│   └── mac_array_tb.v      # Testbench for simulation
├── sim/
│   └── mac_array.vcd       # VCD output for waveform analysis
├── README.md
└── LICENSE
```

## 🚀 Features

- Combinational logic-based MAC unit: `(A × B) + C`
- Parameterized design for flexible N×N array sizes
- Synthesizable Verilog RTL code
- Ready for simulation and waveform generation
- Scalable and power-efficient for ASIC/FPGA

## 📌 MAC Unit Overview

Each MAC unit performs:
```
result = (A * B) + C
```

### Inputs
- `A` (16-bit)
- `B` (16-bit)
- `C` (32-bit)

### Output
- `result` (32-bit)

## 🧮 Verilog Code Snippet

### mac_unit.v
```verilog
module mac_unit(
    input [15:0] A,
    input [15:0] B,
    input [31:0] C,
    output reg [31:0] result
);
always @(*) begin
    result = (A * B) + C;
end
endmodule
```

### mac_array.v
```verilog
module mac_array #(
    parameter N = 4
)(
    input [15:0] A [0:N-1],
    input [15:0] B [0:N-1],
    input [31:0] C [0:N-1],
    output [31:0] result [0:N-1]
);
genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin : mac_unit_gen
        mac_unit mac_inst (
            .A(A[i]),
            .B(B[i]),
            .C(C[i]),
            .result(result[i])
        );
    end
endgenerate
endmodule
```

## 🧪 Simulation and Waveform Analysis

### Step-by-step:

```bash
# Compile the design and testbench
iverilog -o mac_array_8x8_tb.out mac_array_8x8_tb.v mac_array_8x8.v

# Run the simulation
vvp mac_array_8x8_tb.out

# Open waveform viewer (GTKWave)
gtkwave mac_array_8x8_tb.vcd
```

### Output Screenshot

![Simulation Screenshot](mac_array_8x8_simulation.png)

## 🛠️ Installing Icarus Verilog and GTKWave (Windows)

1. Download **Icarus Verilog** from:
   [http://iverilog.icarus.com/](http://iverilog.icarus.com/)
2. Download **GTKWave** from:
   [http://gtkwave.sourceforge.net/](http://gtkwave.sourceforge.net/)
3. Add the installation paths to your system `PATH` environment variable. Example:
   ```
   C:\iverilog\bin
   C:\gtkwave\bin
   ```

## 📦 Use Cases

- Deep Learning Accelerators (e.g., TPUs)
- Digital Signal Processing (DSP)
- Edge AI and IoT devices
- Matrix multiplication hardware blocks

## 📜 License

This project is licensed under the MIT License. See `LICENSE` for more information.

## 🙌 Acknowledgments

- Based on concepts from NVIDIA Tensor Core MAC designs
- Supported by Yarok14 VLSI Research and Design

---

## 📧 Contact

For collaboration, support, or business inquiries: **contacts.yarok14@gmail.com**


