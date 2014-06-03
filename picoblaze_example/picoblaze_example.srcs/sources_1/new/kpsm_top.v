`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2014 11:25:30 AM
// Design Name: 
// Module Name: kpsm_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module kpsm_top(
    input wire clk_p,
    input wire clk_n,
    input wire reset,
    output wire [7:0] led_out
    );
wire clk;
wire locked;


clk_wiz_0 instance_name
   (
    .clk_in1_p(clk_p),    // input clk_in1_p
    .clk_in1_n(clk_n),    // input clk_in1_n
    .clk_out1(clk),     // output clk_out1
    .reset(reset),// input reset
    .locked(locked));      // output locked
    
kpsm6_design_template kpsm6_design_template_inst
    (
    .clk(clk),
    .cpu_reset(reset),
    .input_port_a(),
    .input_port_b(),
    .input_port_c(),
    .input_port_d(),
    .output_port_w(led_out),
    .output_port_x(),
    .output_port_y(),
    .output_port_z(),
    .output_port_k(),
    .output_port_c() 
    );   
endmodule
