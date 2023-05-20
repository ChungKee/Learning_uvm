`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
module tb;
  
  initial begin
    uvm_top.set_report_verbosity_level(UVM_DEBUG);
    uvm_top.get_report_verbosity_level();
    $display("The verbosity level = %0d",uvm_top.get_report_verbosity_level());
  end
  
endmodule
