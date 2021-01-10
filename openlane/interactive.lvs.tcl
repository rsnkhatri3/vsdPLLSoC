package require openlane
## ORIGINAL FLOORPLAN FOR CONNECTIVITY INFO
set ::env(CONNECTIVITY_RUN) 1

prep -design vsdPLLSoC -tag vsdPLLSoC_lvs -overwrite
set top_rtl designs/vsdPLLSoC/src/verilog/rtl/vsdPLLSoC.v

set ::env(SYNTH_DEFINES) "USE_POWER_PINS"
verilog_elaborate

logic_equiv_check -lhs $top_rtl -rhs $::env(yosys_result_file_tag).v

init_floorplan

if { [info exists ::env(LVS_RUN_DIR)] } {
	file copy -force $::env(CURRENT_DEF) $::env(LVS_RUN_DIR)/lvs.def
	file copy -force $::env(CURRENT_NETLIST) $::env(LVS_RUN_DIR)/lvs.v
	file copy -force $::env(MERGED_LEF_UNPADDED) $::env(LVS_RUN_DIR)/lvs.lef
} else {
	puts "Warning: LVS_RUN_DIR not defined"
}
