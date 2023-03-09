//  Class: yapp_tx_driver
//
class yapp_tx_driver extends uvm_driver #(yapp_packet);
    `uvm_component_utils(yapp_tx_driver);

    //  Constructor: new
    function new(string name = "yapp_tx_driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    task automatic send_to_DUT(yapp_packet packet);
        `uvm_info("MSG", $sformatf("Packet is: \n %s", packet.sprint()), UVM_LOW)
        #10ns; 
    endtask: send_to_DUT
    
    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), {"Start of simulation phase from ", get_full_name()}, UVM_HIGH)
    endfunction: start_of_simulation_phase


    task run_phase(uvm_phase phase);
        `uvm_info("MSG", "start of driver run phase", UVM_HIGH)
        forever begin
            `uvm_info("MSG", "one more cycle in driver run phase", UVM_HIGH)
            seq_item_port.get_next_item(req); 
            send_to_DUT(req);
            seq_item_port.item_done(); 
        end
    endtask: run_phase

endclass: yapp_tx_driver