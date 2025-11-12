
class scoreboard;
  
  transaction trans;
  mailbox #( transaction ) mon2scb;
  
  // ALU operation codes
  parameter ADD  = 4'b0000,
            SUB  = 4'b0001,
            MUL  = 4'b0010,
            DIV  = 4'b0011,
            INV  = 4'b0100,
            INC  = 4'b0101,
            DEC  = 4'b0110,
            SHL  = 4'b0111,
            SHR  = 4'b1000,
            AND  = 4'b1001,
            OR   = 4'b1010,
            NAND = 4'b1011,
            NOR  = 4'b1100,
            XOR  = 4'b1101,
            XNOR = 4'b1110,
            MOD  = 4'b1111;
  
  logic [15:0] y;
  
  function new(mailbox #( transaction ) mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main;
    repeat( 15 )
    begin
      mon2scb.get(trans);
      trans.display("SCOREBOARD DATA   ");
      if (trans.en)
      begin
        case (trans.sel)
          ADD  : y = trans.a + trans.b;
          SUB  : y = trans.a - trans.b;
          MUL  : y = trans.a * trans.b;
          DIV  : y = (trans.b != 0) ? (trans.a / trans.b) : 16'hXXXX;
          INV  : y = ~trans.a;
          INC  : y = trans.b + 1;
          DEC  : y = trans.b - 1;
          SHL  : y = trans.a << 1;
          SHR  : y = trans.b >> 1;
          AND  : y = trans.a & trans.b;
          OR   : y = trans.a | trans.b;
          NAND : y = ~(trans.a & trans.b);
          NOR  : y = ~(trans.a | trans.b);
          XOR  : y = trans.a ^ trans.b;
          XNOR : y = ~(trans.a ^ trans.b);
          MOD  : y = (trans.b != 0) ? (trans.a % trans.b) : 16'hXXXX;
        endcase
      end
      else
        y = 16'bz;
      
      if (y === trans.out)
        $display("---------- PASS --------------");
      else
       $display("---------- FAIL --------------");
      
      trans.out = y;
      $display("/////////// TRANSACTION DONE //////////////");
    end
  endtask
  
endclass
