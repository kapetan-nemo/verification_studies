//-------------------------------------------------------------------------
// Packet 
//-------------------------------------------------------------------------
class packet;
    rand bit [7:0] addr;
    rand bit [7:0] data;

    //Displaying randomized values
    function void post_randomize();
        $display("%0d: Packet::Packet Generated", $time);
        $display("%0d: Packet::Addr=%0d,Data=%0d",addr,data, $time);
    endfunction
endclass

//-------------------------------------------------------------------------
//Generator - Generates the transaction packet and send to driver
//-------------------------------------------------------------------------
class generator;
    packet pkt;
    mailbox m_box;
    event handshake_gen;
    event handshake_dri;

    //constructor, getting mailbox handle
    function new(mailbox m_box, event handshake_gen, event handshake_dri);
        this.m_box         = m_box;
        this.handshake_gen = handshake_gen;
        this.handshake_dri = handshake_dri;
    endfunction

    task run;
        repeat(2) begin
            pkt = new();
            pkt.randomize(); //generating packet
            m_box.put(pkt);  //putting packet into mailbox
            $display("%0d: Generator::Packet Put into Mailbox", $time);
            ->handshake_gen; 
            wait(handshake_dri.triggered); 
            $display("%0d: Generator::Packet got from Mailbox by Driver", $time);
            #5;
    end
    endtask
endclass

//-------------------------------------------------------------------------
// Driver - Gets the packet from generator and display's the packet items
//-------------------------------------------------------------------------
class driver;
    packet pkt;
    mailbox m_box;
    event handshake_gen;
    event handshake_dri;

    //constructor, getting mailbox handle
    function new(mailbox m_box, event handshake_gen, event handshake_dri);
        this.m_box         = m_box;
        this.handshake_gen = handshake_gen;
        this.handshake_dri = handshake_dri;
    endfunction

    task run;
        repeat(1) begin
            wait(handshake_gen.triggered); 
            $display("%0d: Driver::Packet put in Mailbox by Generator", $time);
            m_box.get(pkt); //getting packet from mailbox
            $display("%0d: Driver::Packet Recived", $time);
            $display("%0d: Driver::Addr=%0d,Data=%0d\n",pkt.addr,pkt.data, $time);
            ->handshake_dri; 
        end
    endtask
endclass

//-------------------------------------------------------------------------
//     tbench_top  
//-------------------------------------------------------------------------
module mailbox_ex;
    generator gen;
    driver    dri;
    mailbox m_box; //declaring mailbox m_box

    event handshake_gen;
    event handshake_dri;

    initial begin
        //Creating the mailbox, Passing the same handle to generator and driver, 
        //because same mailbox should be shared in-order to communicate.
        m_box = new(); //creating mailbox

        gen = new(.m_box(m_box), .handshake_dri(handshake_dri), .handshake_gen(handshake_gen)); //creating generator and passing mailbox handle
        dri = new(.m_box(m_box), .handshake_dri(handshake_dri), .handshake_gen(handshake_gen)); //creating driver and passing mailbox handle
        $display("%0d: ------------------------------------------", $time);
        fork
            gen.run(); //Process-1
            dri.run(); //Process-2
        join
        $display("%0d: ------------------------------------------", $time);
    end
endmodule