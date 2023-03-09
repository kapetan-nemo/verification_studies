//  Class: router_test_lib
//
class base_test extends uvm_test;
    `uvm_component_utils(base_test);

    router_tb tb; 

    //  Constructor: new
    function new(string name = "base_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    /*---  UVM Build Phases            ---*/
    /*------------------------------------*/
    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);

endclass: base_test


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void base_test::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    
    uvm_config_wrapper::set(this,   "my_tb.yapp.tx_agent.sequencer.run_phase",
                                    "default_sequence", 
                                    yapp_5_packets::type_id::get());
                                    
    tb = new("my_tb", this); 
    
    `uvm_info("REPORT", "build phase in test base test has been executed", UVM_HIGH)
endfunction: build_phase

function void base_test::end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology(); 
    `uvm_info("REPORT", "end_of_elaboration_phase in test base test has been executed", UVM_HIGH)
endfunction: end_of_elaboration_phase


//  Class: test2
//
class test2 extends base_test;
    `uvm_component_utils(test2);

    //  Constructor: new
    function new(string name = "test2", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);

endclass: test2


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void test2::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("UVM_MSG", "test2 build_phase executed", UVM_HIGH)
    
endfunction: build_phase
