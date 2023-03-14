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

    //  Function: check_phase
    extern function void check_phase(uvm_phase phase);
    

endclass: base_test


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void base_test::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    
                          
    uvm_config_int::set(this, "*", "recording_detail", 1); 
    // tb = new("my_tb", this);
    tb = router_tb::type_id::create(.name("my_tb"), .parent(this));
     
    
    `uvm_info("REPORT", "build phase in test base test has been executed", UVM_HIGH)
endfunction: build_phase

function void base_test::end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology(); 
    `uvm_info("REPORT", "end_of_elaboration_phase in test base test has been executed", UVM_HIGH)
endfunction: end_of_elaboration_phase

function void base_test::check_phase(uvm_phase phase);
    super.check_phase(phase);
    check_config_usage(); 
endfunction: check_phase



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




//  Class: short_packet_test
//
class short_packet_test extends base_test;
    `uvm_component_utils(short_packet_test);


    //  Constructor: new
    function new(string name = "short_packet_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    /*---  UVM Build Phases            ---*/
    /*------------------------------------*/
    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    
endclass: short_packet_test


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void short_packet_test::build_phase(uvm_phase phase);
    /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
    /*  For more information see UVM Cookbook v1800.2 p.503  */
    
    yapp_packet::type_id::set_type_override(short_yapp_packet::get_type());
    super.build_phase(phase);
    
    uvm_config_wrapper::set(this,   "my_tb.yapp.tx_agent.sequencer.run_phase",
                                    "default_sequence", 
                                    yapp_5_packets::type_id::get());


endfunction: build_phase


class set_config_test extends base_test;
    `uvm_component_utils(set_config_test);

    function new(string name = "set_config_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern function void check_phase(uvm_phase phase);
    
endclass: set_config_test


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void set_config_test::build_phase(uvm_phase phase);
    uvm_config_int::set(this, "my_tb.yapp.tx_agent", "is_active", UVM_PASSIVE);
    super.build_phase(phase); 
    

endfunction: build_phase

function void set_config_test::check_phase(uvm_phase phase);
    check_config_usage();
endfunction