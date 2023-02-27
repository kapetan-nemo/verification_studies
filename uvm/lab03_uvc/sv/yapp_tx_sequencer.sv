//  Class: yapp_tx_sequencer
//
class yapp_tx_sequencer extends uvm_sequencer #(yapp_packet);
    `uvm_component_utils(yapp_tx_sequencer);

    //  Constructor: new
    function new(string name = "yapp_tx_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), {"Start of simulation phase from ", get_full_name()}, UVM_HIGH)
    endfunction: start_of_simulation_phase
    

endclass: yapp_tx_sequencer