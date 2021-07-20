# Clock pin
set_property LOC N18 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# LEDs
set_property LOC H17 [get_ports {led[0]}]
set_property LOC D20 [get_ports {led[1]}]
set_property LOC D18 [get_ports {led[2]}]
set_property LOC H18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

# Clock constraints
create_clock -period 30.0 [get_ports {clk}]
