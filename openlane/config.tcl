# User config
set ::env(DESIGN_NAME) pll_soc



# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/pll_soc.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/avsdpll_1v8.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/simple_por.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_gpiov2.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_ground_hvc_wpad.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_ground_lvc_wpad.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_power_hvc_wpad.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_power_lvc_wpad.v]





set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/avsdpll_1v8.lef]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/simple_por.lef]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_gpiov2.lef]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_ground_hvc_wpad.lef]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_ground_lvc_wpad.lef]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_power_hvc_wpad.lef]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_power_lvc_wpad.lef]



set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/simple_por.gds]



set ::env(SYNTH_READ_BLACKBOX_LIB) 1

set ::env(DESIGN_IS_CORE) 0

set ::(PL_BASIC_PLACEMENT) 0
set ::(PL_SKIP_INITIAL_PLACEMENT) 1


# Fill this
set ::env(CLOCK_PERIOD) "200"
set ::env(CLOCK_PORT) "REF_CLK"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)


set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}


