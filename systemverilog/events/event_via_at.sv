//  Module: event_via_at
//
module event_via_at; 
    event e1, e2; 

    initial begin : first_initial
        $display("@%d: frst before events", $time); 
        ->e1; 
        @e2; 
        $display("@%d: frst after events", $time); 
    end : first_initial

    initial begin : second_initial
        $display("@%d: scnd before events", $time); 
        ->e2; 
        @e1; 
        $display("@%d: scnd before events", $time); 
    end : second_initial

endmodule: event_via_at
