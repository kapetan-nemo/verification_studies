//  Class: yapp_tx_env
//
class yapp_tx_env extends uvm_env;
    `uvm_component_utils(yapp_tx_env);

    yapp_tx_agent tx_agent; 
    function new(string name = "yapp_tx_env", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
        super.build_phase(phase);
        tx_agent = new("tx_agent", this); 
    endfunction: build_phase
        
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction: end_of_elaboration_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), {"Start of simulation phase from ", get_full_name()}, UVM_HIGH)
    endfunction: start_of_simulation_phase


endclass: yapp_tx_env
