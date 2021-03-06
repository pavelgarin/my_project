# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k325tffg900-2
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:kc705:part0:1.0 [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]

read_ip c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property is_locked true [get_files c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/project/picoblaze_example/picoblaze_example.cache/wt [current_project]
set_property parent.project_dir C:/project/picoblaze_example [current_project]
synth_design -top clk_wiz_0 -part xc7k325tffg900-2 -mode out_of_context

rename_ref -prefix_all clk_wiz_0
write_checkpoint -noxdef clk_wiz_0.dcp
report_utilization -file clk_wiz_0_utilization_synth.rpt -pb clk_wiz_0_utilization_synth.pb
if { [catch {
  file copy -force C:/project/picoblaze_example/picoblaze_example.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp
  write_verilog -force -mode synth_stub c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
  write_vhdl -force -mode synth_stub c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
  write_verilog -force -mode funcsim c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_funcsim.v
  write_vhdl -force -mode funcsim c:/project/picoblaze_example/picoblaze_example.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_funcsim.vhdl
} _RESULT ] } { 
  error "ERROR: Unable to successfully create or copy supporting IP files."
}
