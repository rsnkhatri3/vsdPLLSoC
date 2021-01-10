#set script_dir [file dirname [file normalize [info script]]]

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hvl"


set ::env(DESIGN_NAME) vsdPLLSoC

set verilog_root designs/vsdPLLSoC/src/verilog
set lef_root designs/vsdPLLSoC/src/lef
set gds_root designs/vsdPLLSoC/src/gds
# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/verilog/rtl/vsdPLLSoC.v]

set ::env(SYNTH_READ_BLACKBOX_LIB) 1

set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/verilog/rtl/chip_io.v]
set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/verilog/rtl/simple_por.v]
set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/src/verilog/rtl/avsdpll_1v8.v]

set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/lef/*.lef]
	

set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/gds/*.gds]

# # !!!
# if { [info exists ::env(LVS_RUN_DIR)] || [info exists ::env(CONNECTIVITY_RUN)] } {
# 	# if running to get a full floorplan, need the original pads due to
# 	# missing pins in the abstracted version
# 	set ::env(GPIO_PADS_LEF) [glob "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/lef/s8iom0s8/*.lef"]
# }

set ::env(SYNTH_TOP_LEVEL) 1
set ::env(SYNTH_FLAT_TOP) 1
set ::env(LEC_ENABLE) 0

set ::env(FP_SIZING) absolute

set ::env(DIE_AREA) "0 0 3588 5188"



set ::env(CELL_PAD) 0
set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0

set ::env(GLB_RT_ALLOW_CONGESTION) 1
set ::env(GLB_RT_OVERFLOW_ITERS) 50
set ::env(GLB_RT_TILES) 30
set ::env(GLB_RT_MAXLAYER) 5
# set ::env(ROUTING_OPT_ITERS) 7
# set ::env(GLB_RT_UNIDIRECTIONAL) 0

set ::env(FILL_INSERTION) 0

# DON'T PUT CELLS ON THE TOP LEVEL
set ::env(LVS_INSERT_POWER_PINS) 0
