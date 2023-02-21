//  Class: router_tb
//
class router_tb extends uvm_env;
    `uvm_component_utils(router_tb);

    //  Group: Configuration Object(s)


    //  Group: Components


    //  Group: Variables


    //  Group: Functions

    //  Constructor: new
    function new(string name = "router_tb", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    /*---  UVM Build Phases            ---*/
    /*------------------------------------*/
    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    //  Function: connect_phase
    //  Function: end_of_elaboration_phase

    /*---  UVM Run Phases              ---*/
    /*------------------------------------*/
    //  Function: start_of_simulation_phase
    //  Function: reset_phase
    //  Function: configure_phase
    //  Function: main_phase
    //  Function: shutdown_phase

    /*---  UVM Cleanup Phases          ---*/
    /*------------------------------------*/
    //  Function: extract_phase
    //  Function: report_phase
    
endclass: router_tb


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void router_tb::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    `uvm_info("REPORT", "build phase in testbench router_tb has been executed", UVM_HIGH)
    
endfunction: build_phase