module uart_rx(
    input clk,
    input rst,
    input tick,
    input rx,
    output reg [7:0] data_out,
    output reg done
);

reg [3:0] bit_count;
reg receiving;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        bit_count  <= 0;
        receiving  <= 0;
        data_out   <= 0;
        done       <= 0;
    end
    else
    begin
        done <= 0;

        if(!receiving && rx == 0)
        begin
            receiving <= 1;
            bit_count <= 0;
        end
        else if(tick && receiving)
        begin
            case(bit_count)

            0: bit_count <= 1;   // skip start bit timing

            1: begin data_out[0] <= rx; bit_count <= 2; end
            2: begin data_out[1] <= rx; bit_count <= 3; end
            3: begin data_out[2] <= rx; bit_count <= 4; end
            4: begin data_out[3] <= rx; bit_count <= 5; end
            5: begin data_out[4] <= rx; bit_count <= 6; end
            6: begin data_out[5] <= rx; bit_count <= 7; end
            7: begin data_out[6] <= rx; bit_count <= 8; end
            8: begin data_out[7] <= rx; bit_count <= 9; end

            9:
            begin
                receiving <= 0;
                done <= 1;
                bit_count <= 0;
            end

            endcase
        end
    end
end

endmodule