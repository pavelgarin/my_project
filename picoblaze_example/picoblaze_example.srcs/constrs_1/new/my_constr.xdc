# PART is xc7k325tffg900-1

#
####
#######
##########
#############
#################
## System level constraints


########## GENERAL IO CONSTRAINTS FOR THE KC705 BOARD ##########
set_property PACKAGE_PIN AD12     [get_ports clk_p]
set_property PACKAGE_PIN AD11     [get_ports clk_n]
set_property IOSTANDARD  LVDS     [get_ports clk_p]
set_property IOSTANDARD  LVDS     [get_ports clk_n]

# Rev B board
#set_property PACKAGE_PIN AK4      [get_ports glbl_rst]
# Rev C or later
set_property PACKAGE_PIN AB7      [get_ports reset]
set_property IOSTANDARD  LVCMOS15 [get_ports reset]
set_false_path -from [get_ports reset]


#### Module LEDs_8Bit constraints
set_property PACKAGE_PIN AB8      [get_ports led_out[0]]
set_property PACKAGE_PIN AA8      [get_ports led_out[1]]
set_property PACKAGE_PIN AC9      [get_ports led_out[2]]
set_property PACKAGE_PIN AB9      [get_ports led_out[3]]
set_property PACKAGE_PIN AE26     [get_ports led_out[4]]
set_property PACKAGE_PIN G19      [get_ports led_out[5]]
set_property PACKAGE_PIN E18      [get_ports led_out[6]]
set_property PACKAGE_PIN F16      [get_ports led_out[7]]


set_property IOSTANDARD  LVCMOS15      [get_ports led_out[0]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[1]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[2]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[3]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[4]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[5]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[6]]
set_property IOSTANDARD  LVCMOS15      [get_ports led_out[7]]
