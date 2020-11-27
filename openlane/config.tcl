# User config
set ::env(DESIGN_NAME) pll_soc

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/pll_soc.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/avsdpll_1v8.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/simple_por.blackbox.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_gpiov2.blackbox.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_ground_hvc_wpad.blackbox.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_ground_lvc_wpad.blackbox.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_power_hvc_wpad.blackbox.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_power_lvc_wpad.blackbox.v]


set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/avsdpll_1v8.lef] 

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/simple_por.lef] 

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_gpiov2.lef] 

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_ground_hvc_wpad.lef] 

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_ground_lvc_wpad.lef]

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_power_hvc_wpad.lef]

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/pll_soc/src/sky130_fd_io__top_power_lvc_wpad.lef]



# Fill this
set ::env(CLOCK_PERIOD) "200"
set ::env(CLOCK_PORT) "REF"


set filename $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/$::env(PDK)_$::env(PDK_VARIANT)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}


