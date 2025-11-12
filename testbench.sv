`include "interface.sv"
`include "test.sv"

module testbench;

    intf if_uut ();
    test t1 ( if_uut );
    alu dut (
        .a  ( if_uut.a ),
        .b  ( if_uut.b ),
        .en ( if_uut.en ),
        .sel( if_uut.sel ),
        .out( if_uut.out )
    );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule

