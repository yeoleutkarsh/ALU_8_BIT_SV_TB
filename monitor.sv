

class monitor;
    virtual intf vif;
    mailbox #( transaction ) mon2scb;
    
    
    function new( virtual intf vif,
                  mailbox #( transaction ) mon2scb
    );
        this.vif        = vif;
        this.mon2scb    = mon2scb;
    endfunction

    task main();
      repeat( 15 ) 
          #1
          begin
            transaction trans;
            trans = new();
            trans.a	   = vif.a;
            trans.b    = vif.b;
            trans.en   = vif.en;
            trans.sel  = vif.sel;
            trans.out  = vif.out;
            mon2scb.put( trans );
            trans.display("MONITOR VALUES    ");
        end
    endtask

endclass
