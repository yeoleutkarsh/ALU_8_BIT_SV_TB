
class driver;
  virtual intf vif;
  mailbox #( transaction ) gen2drv;
  transaction trans;
  
  function new( virtual intf vif,
  			    mailbox #( transaction ) gen2drv
   );
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    repeat( 15 ) begin
      gen2drv.get( trans );
      vif.a		<= trans.a;
      vif.b		<= trans.b;
      vif.en	<= trans.en;
      vif.sel	<= trans.sel;
      #1
//       trans.out	<= vif.out;
      trans.display("DRIVER VALUES     ");
    end
  endtask
  
endclass
