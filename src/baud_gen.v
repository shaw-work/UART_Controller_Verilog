module baud_gen(
    input clk,
    input rst,
    output reg tick
);

reg [6:0] count;   // enough for 0 to 103

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count <= 0;
        tick  <= 0;
    end
    else
    begin
        if(count == 103)
        begin
            count <= 0;
            tick  <= 1;
        end
        else
        begin
            count <= count + 1;
            tick  <= 0;
        end
    end
end

endmodule