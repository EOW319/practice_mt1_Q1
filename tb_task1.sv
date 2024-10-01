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
            // 1. From State E: N=1 -> Transition E -> F
        #10 begin
            $display("\n--- Test 1: E -> F by setting N=1 ---");
            N <= 1; D <= 0;
        end

        // 2. From State F: N=0 -> Transition F -> G
        #10 begin
            $display("--- Test 2: F -> G by setting N=0 ---");
            N <= 0;
        end

        // 3. From State G: D=1 -> Transition G -> H
        #10 begin
            $display("--- Test 3: G -> H by setting D=1 ---");
            D <= 1;
        end

        // 4. From State H: D=0 & N=0 -> Transition H -> E
        #10 begin
            $display("--- Test 4: H -> E by setting D=0 & N=0 ---");
            D <= 0; N <= 0;
        end

        // 5. From State E: D=1 -> Transition E -> H
        #10 begin
            $display("--- Test 5: E -> H by setting D=1 ---");
            D <= 1; N <= 0;
        end

        // 6. From State H: N=1 (D=1) -> Stay in H
        #10 begin
            $display("--- Test 6: H stays H by setting N=1 (D=1) ---");
            D <= 1; N <= 1;
        end

        // 7. From State H: D=0 (N=1) -> Stay in H
        #10 begin
            $display("--- Test 7: H stays H by setting D=0 (N=1) ---");
            D <= 0; N <= 1;
        end

        // 8. From State H: D=0 & N=0 -> Transition H -> E
        #10 begin
            $display("--- Test 8: H -> E by setting D=0 & N=0 ---");
            D <= 0; N <= 0;
        end

        // 9. From State E: No change (N=0, D=0) -> Stay in E
        #10 begin
            $display("--- Test 9: E stays E by keeping N=0 & D=0 ---");
            D <= 0; N <= 0;
        end

        // 10. From State E: N=1 & D=1 -> E should prioritize N=1 and transition E -> F
        #10 begin
            $display("--- Test 10: E -> F by setting N=1 (D=1 also set) ---");
            D <= 1; N <= 1;
        end

        // 11. From State F: N=1 -> Stay in F
        #10 begin
            $display("--- Test 11: F stays F by keeping N=1 ---");
            D <= 1; N <= 1;
        end

        // 12. From State F: N=0 -> Transition F -> G
        #10 begin
            $display("--- Test 12: F -> G by setting N=0 ---");
            D <= 1; N <= 0;
        end

        // 13. From State G: N=0 & D=0 -> Stay in G
        #10 begin
            $display("--- Test 13: G stays G by setting D=0 & N=0 ---");
            D <= 0; N <= 0;
        end

        // 14. From State G: N=1 -> Transition G -> H
        #10 begin
            $display("--- Test 14: G -> H by setting N=1 ---");
            D <= 0; N <= 1;
        end

        // 15. From State H: D=1 & N=1 -> Stay in H
        #10 begin
            $display("--- Test 15: H stays H by keeping D=1 & N=1 ---");
            D <= 1; N <= 1;
        end

        // 16. From State H: D=0 & N=1 -> Stay in H
        #10 begin
            $display("--- Test 16: H stays H by setting D=0 & keeping N=1 ---");
            D <= 0; N <= 1;
        end

        // 17. From State H: D=0 & N=0 -> Transition H -> E
        #10 begin
            $display("--- Test 17: H -> E by setting D=0 & N=0 ---");
            D <= 0; N <= 0;
        end


    // end of your code

        wait (V==1) $display("done at time (%0d ps), ND V=%0d", $time, V);
        #10 D <= 0; N <= 0; #10 D <= 1; #10 D <= 0;
        wait (V==0) $display("V=0 @ %0d", $time);
        $display ("Simulation end time is (%0d ps)", $time);
        #30 $finish;
    end

    task1 dut( .* );
endmodule