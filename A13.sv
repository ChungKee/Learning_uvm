`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  task run();
    `uvm_warning("DRV","Potential error1");
    `uvm_warning("DRV","Potential error2");
    `uvm_warning("DRV","Potential error3");
    `uvm_warning("DRV","Potential error4");
  endtask

endclass
 
module tb;
  driver d;
  
  initial begin
    d = new("DRV", null);
    d.set_report_max_quit_count(4);
    d.set_report_severity_action(UVM_WARNING, UVM_COUNT);
    d.run();
  end
  
endmodule
