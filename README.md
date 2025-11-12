# Title : 8 - Bit ALU ( Arithmetic Logic Unit ) Design & Verification using System Verilog.
# **1) Introduction**
- The Arithmetic Logic Unit (ALU) is an important part of digital systems that performs math and logic operations.  
- This project designs an **8-bit ALU** in **Verilog HDL** that can do addition, subtraction, multiplication, division, logic, and shift operations.  
- It takes two 8-bit inputs (`a`, `b`), a 4-bit control signal (`sel`) to choose the operation, and an enable signal (`en`).  
- The result is a 16-bit output (`out`).  

**Operation Performed By ALU**

i. Arithmetic Operators -
| Operation                | Description                            | Symbol / Expression |
| ------------------------ | -------------------------------------- | ------------------- |
| **Addition (ADD)**       | Adds two 8-bit numbers                 | `a + b`             |
| **Subtraction (SUB)**    | Subtracts b from a                     | `a - b`             |
| **Multiplication (MUL)** | Multiplies a and b, result is 16-bit   | `a * b`             |
| **Division (DIV)**       | Divides a by b, handles divide-by-zero | `a / b`             |
| **Increment (INC)**      | Increments input by 1                  | `b + 1`             |
| **Decrement (DEC)**      | Decrements input by 1                  | `b - 1`             |
| **Modulus (MOD)**        | Finds remainder of a divided by b      | `a % b`             |

ii. Logical Operators -
| Operation              | Description              | Expression |    
| ---------------------- | ------------------------ | ---------- | 
| **AND**                | Bitwise AND of a and b   | `a & b`    |   
| **OR**                 | Bitwise OR of a and b    | `a | b`    |
| **NAND**               | Bitwise NOT of (a AND b) | `~(a & b)` | 
| **NOR**                | Bitwise NOT of (a OR b)  | `~(a | b)` |
| **XOR**                | Bitwise Exclusive OR     | `a ^ b`    |
| **XNOR**               | Bitwise Exclusive NOR    | `a ~^ b`   | 
| **NOT / Invert (INV)** | Bitwise inversion of a   | `~a`       | 

iii. Shift Operators -
| Operation             | Description                   | Expression |
| --------------------- | ----------------------------- | ---------- |
| **Shift Left (SHL)**  | Shifts bits of a left by one  | `a << 1`   |
| **Shift Right (SHR)** | Shifts bits of a right by one | `b >> 1`   |


