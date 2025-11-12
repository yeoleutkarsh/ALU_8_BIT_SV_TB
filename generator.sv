
  class generator;
    transaction trans;
    mailbox #( transaction ) gen2drv;

    function new( mailbox #( transaction ) gen2drv );
      this.gen2drv = gen2drv;
    endfunction

    task main();
      repeat( 15 )
        begin
          trans = new();
          assert( trans.randomize() );
          gen2drv.put( trans );
          trans.display("GENERATOR VALUES");
        end
      $display("----------------------------------------------");
    endtask

  endclass
