/*-----------------------------------------------------------------
File name     : top.sv
Description   : lab01_data top module template file
Notes         : From the Cadence "SystemVerilog Advanced Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module top;
	// import the UVM library
	import uvm_pkg::*;
	// include the UVM macros
	`include "uvm_macros.svh"

	// import the YAPP package
	import yapp_pkg::*;

	// the order of includes is very important
	`include "router_tb.sv"
	`include "router_test_lib.sv"

	yapp_packet packet; 
	yapp_packet packet_clone; 
	yapp_packet packet_copy; 



	initial begin
	// generate 5 random packets and use the print method
	// to display the results
/* 		for (int i = 0; i < 5; i++) begin
			packet = new($sformatf("packet_%0d", i)); 
			$display("created packet #%d\n", i);
			// packet.randomize(); 
			packet.print(uvm_default_table_printer); 
			packet.print(uvm_default_tree_printer); 
			packet.print(uvm_default_line_printer); 
		end	

	// experiment with the copy, clone and compare UVM method
	$display("COPY packet \n");
	packet_copy = new("packet_copy");

	packet_copy.copy(packet); 
	packet_copy.print(); 

	$display("CLONE packet \n");
	$cast(packet_clone, packet.clone()); 
	packet_clone.print();

	$display("good COMPARE packet \n");
	packet_clone.compare(packet_copy); 

	$display("bad COMPARE packet \n");
	packet_clone.length = '0; 
	packet_clone.compare(packet_copy); 
	 */
	run_test(); 
	end

endmodule : top
