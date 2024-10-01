module task1(clk, resetb, D, N, V, tag);
    
    // THIS IS THE DESIGN UNDER TEST
    // DO NOT MODIFY IT

    input clk, resetb, D, N;
    output V;
    output [7:0] tag;
    reg V;
    enum {RESET, E, F, G, H} current_state;

     always @(posedge clk) begin
        if( resetb==0 ) begin
            current_state <= E;
            V <= 0;
        end else begin
            case( current_state )
                E: if( N )
                       current_state <= F;
                	else if ( D ) begin
                       current_state <= H;
                       V <= 1;
                	end
                F: if( !N ) current_state <= G;
                G: if( D | N ) begin
                    current_state <= H;
                    V <= 1;
                end
                default: // captures case H:
                    if( !D & !N ) begin
                        current_state <= E;
                        V <= 0;
                    end else
                        V <= 1;
            endcase
      	end
    end
    assign tag = 8'h9A; // DO NOT CHANGE THIS
endmodule