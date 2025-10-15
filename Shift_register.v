// 4-bit Serial In Serial Out (SISO) Shift Register
module Shift_register (
    input clk,          // Clock input
    input reset,        // Asynchronous reset
    input serial_in,    // Serial input
    output serial_out   // Serial output
);

    reg [3:0] shift_reg;   // 4-bit register

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 4'b0000;          // Clear register
        else
            shift_reg <= {shift_reg[2:0], serial_in}; // Shift left
    end

    assign serial_out = shift_reg[3];  // MSB as serial output

endmodule
