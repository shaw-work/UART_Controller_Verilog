module uart_top(
    input clk,
    input rst,
    input start,
    input [7:0] data_in,
    output tx,
    output [7:0] data_out,
    output done,
    output busy
);

wire tick;
wire tx_wire;

baud_gen U1 (
    .clk(clk),
    .rst(rst),
    .tick(tick)
);

uart_tx U2 (
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .start(start),
    .data_in(data_in),
    .tx(tx_wire),
    .busy(busy)
);

uart_rx U3 (
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .rx(tx_wire),
    .data_out(data_out),
    .done(done)
);

assign tx = tx_wire;

endmodule