//  Class: yapp_tx_agent
//
class yapp_tx_agent extends uvm_agent;
    `uvm_component_utils_begin(yapp_tx_agent)
        `uvm_field_enum     (uvm_active_passive_enum, is_active,  UVM_ALL_ON)
    `uvm_component_utils_end

    yapp_tx_driver    driver; 
    yapp_tx_monitor   monitor; 
    yapp_tx_sequencer sequencer; 

    function new(string name = "yapp_tx_agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    
endclass: yapp_tx_agent


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void yapp_tx_agent::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    monitor   = new("monitor",   this); 
    if (is_active == UVM_ACTIVE) begin
        driver    = new("driver",    this); 
        sequencer = new("sequencer", this);
    end 
endfunction: build_phase


function void yapp_tx_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (is_active == UVM_ACTIVE) begin
        driver.seq_item_port.connect(sequencer.seq_item_export);
        `uvm_info("MSG", "driver connected to sequencer", UVM_HIGH)
    end 

endfunction: connect_phase