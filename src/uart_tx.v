module uart_tx(
    input clk,
    input rst,
    input tick,
    input start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

reg [3:0] bit_count;
reg [7:0] data_reg;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        tx <= 1;
        busy <= 0;
        bit_count <= 0;
        data_reg <= 0;
    end
    else if(start && !busy)
    begin
        busy <= 1;
        data_reg <= data_in;
        bit_count <= 0;
    end
    else if(tick && busy)
    begin
        case(bit_count)
            0: tx <= 0;
            1: tx <= data_reg[0];
            2: tx <= data_reg[1];
            3: tx <= data_reg[2];
            4: tx <= data_reg[3];
            5: tx <= data_reg[4];
            6: tx <= data_reg[5];
            7: tx <= data_reg[6];
            8: tx <= data_reg[7];
            9: tx <= 1;
        endcase

        if(bit_count < 9)
            bit_count <= bit_count + 1;
        else
        begin
            bit_count <= 0;
            busy <= 0;
        end
    end
end

endmodule