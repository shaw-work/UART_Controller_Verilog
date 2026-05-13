`timescale 1ns / 1ps

module uart_tb;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire tx;
wire [7:0] data_out;
wire done;
wire busy;

uart_top DUT (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .tx(tx),
    .data_out(data_out),
    .done(done),
    .busy(busy)
);

// Clock generation: 1 MHz => 1000 ns period
always #500 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    start = 0;
    data_in = 8'h00;

    #2000;
    rst = 0;

    #2000;
    data_in = 8'h41;   // ASCII 'A'
    start = 1;

    #1000;
    start = 0;

    #3000000;;

    $finish;
end

endmodule