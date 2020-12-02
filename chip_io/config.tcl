# User config
set ::env(DESIGN_NAME) chip_io

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/chip_io.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_gpiov2.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_ground_hvc_wpad.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_ground_lvc_wpad.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_power_hvc_wpadv2.v]

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/sky130_fd_io__top_power_lvc_wpad.v]



set ::env(DESIGN_IS_PADFRAME) 1
set ::env(SYNTH_FLAT_TOP) 1
set ::env(USE_GPIO_PADS) 1

set ::env(FP_SIZING) absolute





# Fill this
set ::env(CLOCK_PERIOD) "200"
set ::env(CLOCK_PORT) "REF_CLK"

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

