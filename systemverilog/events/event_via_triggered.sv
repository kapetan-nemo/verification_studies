//  Module: event_via_at
//
module event_via_triggered; 
    event e1, e2; 

    initial begin : first_initial
        $display("@%d: frst before events", $time); 
        ->e1; 
        wait(e2.triggered); 
        $display("@%d: frst after events", $time); 
    end : first_initial

    initial begin : second_initial
        $display("@%d: scnd before events", $time); 
        ->e2; 
        wait(e1.triggered); 
        $display("@%d: scnd before events", $time); 
    end : second_initial

endmodule: event_via_triggered
