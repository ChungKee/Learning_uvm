`timescale 1ns/1ns

`include "uvm_macros.svh"
import uvm_pkg::*;
 
class my_object extends uvm_object;
  rand logic[1:0] a;
  rand logic[3:0] b;
  rand logic[7:0] c;
  
  function new(string path = "my_object");
    super.new(path);
  endfunction
 
  `uvm_object_utils_begin(my_object)
  `uvm_field_int(a, UVM_DEFAULT);
  `uvm_field_int(b, UVM_DEFAULT);
  `uvm_field_int(c, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
 
module tb;
 
  my_object o;
  initial begin
    o = new("my_object");
    o.randomize();
    o.print();
  end
  
endmodule
