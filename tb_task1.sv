module tb_task1 ();

    reg clk=0;
    reg resetb=0;
    reg D,N;
    reg V;
    reg [7:0] tag;

    always #5 clk = ~clk;  // Create clock with period=10

    initial begin
        #0 resetb <= 0;
        #10 resetb <= 1; D <= 0; N <= 0;

    // beginning of your code
        // only insert code here
    

    // end of your code

        wait (V==1) $display("done at time (%0d ps), ND V=%0d", $time, V);
        #10 D <= 0; N <= 0; #10 D <= 1; #10 D <= 0;
        wait (V==0) $display("V=0 @ %0d", $time);
        $display ("Simulation end time is (%0d ps)", $time);
        #30 $finish;
    end

    task1 dut( .* );
endmodule