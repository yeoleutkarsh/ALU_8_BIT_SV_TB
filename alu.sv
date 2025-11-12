`timescale 1ns/1ps

module alu( a, b, en, out, sel );
  input [7:0] a, b;
  input en;
  input [3:0] sel;
  output reg [15:0] out;
  
  // ALU Operation Codes
  parameter ADD   = 4'b0000,
            SUB   = 4'b0001,
            MUL   = 4'b0010,
            DIV   = 4'b0011,
            INV   = 4'b0100,   
            INC   = 4'b0101,   
            DEC   = 4'b0110,  
            SHL   = 4'b0111,   
            SHR   = 4'b1000,   
            AND   = 4'b1001,
            OR    = 4'b1010,
            NAND  = 4'b1011,
            NOR   = 4'b1100,
            XOR   = 4'b1101,
            XNOR  = 4'b1110,
            MOD   = 4'b1111;   
  
  // Intermediate register to hold data
  reg [15:0] y;
  
  // logic
  always @(*)
    begin
      case(sel)
        ADD 	: y = a + b;
        SUB 	: y = a - b;
        MUL 	: y = a * b;
        DIV 	: y = (b != 0) ? (a / b) : 16'hXXXX;
        INV 	: y = ~ a;
        INC 	: y = b + 1;
        DEC 	: y = b - 1;
        SHL 	: y = a << 1;
        SHR 	: y = b >> 1;
        AND 	: y = a & b;
        OR 		: y = a | b;
        NAND 	: y = ~(a & b);
        NOR 	: y = ~(a | b);
        XOR     : y = a ^ b;
        XNOR 	: y = a ~^ b;
        MOD 	: y = (b != 0) ? (a % b) : 16'hXXXX;
      endcase
    end
  
  assign out = ( en == 1'b1 ) ? y : 16'bz;
  
endmodule
