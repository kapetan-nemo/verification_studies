//  Class: yapp_tx_monitor
//
class yapp_tx_monitor extends uvm_monitor;
    `uvm_component_utils(yapp_tx_monitor);

    function new(string name = "yapp_tx_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern task run_phase(uvm_phase phase);
endclass: yapp_tx_monitor

task yapp_tx_monitor::run_phase(uvm_phase phase);
    `uvm_info("MSG", "That's monitor", UVM_LOW)
endtask: run_phase