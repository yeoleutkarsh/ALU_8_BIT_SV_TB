
class transaction;
  rand logic [7:0] a;
  rand logic [7:0] b;
  rand logic en;
  rand logic [3:0] sel;
  logic [15:0] out;
  
  function void display( string name );
    $display("%s\t:: a=%0d   b=%0d   en=%0d   sel=%0d -> out=%0d",name, a, b, en, sel, out);
  endfunction
  
endclass
