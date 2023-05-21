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
 
  virtual function void do_copy(uvm_object rhs);
  	my_object temp;
    $cast(temp, rhs);
    super.do_copy(rhs);
    
    this.a = temp.a;
    this.b = temp.b;
    this.c = temp.c;
    
  endfunction
  
  `uvm_object_utils_begin(my_object)
  `uvm_field_int(a, UVM_DEFAULT);
  `uvm_field_int(b, UVM_DEFAULT);
  `uvm_field_int(c, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
 
module tb;
 
  my_object o1;
  my_object o2;
  int status;
  
  initial begin
    o1 = my_object::type_id::create("o1");
    o1.randomize();
    $cast(o2,o1.clone());
    status = o1.compare(o2);
    $display("status = %0d",status);
  end
  
endmodule
