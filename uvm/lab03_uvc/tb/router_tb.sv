//  Class: router_tb
//
class router_tb extends uvm_env;
    `uvm_component_utils(router_tb);
  
    yapp_tx_env yapp; 
    
    //  Constructor: new
    function new(string name = "router_tb", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
        super.build_phase(phase);
        yapp = new("yapp", this);
        `uvm_info("REPORT", "build phase in testbench router_tb has been executed", UVM_HIGH)
        
    endfunction: build_phase  

endclass: router_tb