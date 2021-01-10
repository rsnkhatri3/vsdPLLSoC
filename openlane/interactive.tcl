package require openlane

prep -design vsdPLLSoC -tag vsdPLLSoC -overwrite
set save_path vsdPLLSoC/../..

set ::env(SYNTH_DEFINES) "TOP_ROUTING"
verilog_elaborate
#logic_equiv_check -lhs $top_rtl -rhs $::env(yosys_result_file_tag).v

init_floorplan

add_macro_placement PADFRAME 0 0 N
add_macro_placement PLL 1700 2590 N
add_macro_placement POR 3270.880 522.711 MX

manual_macro_placement f

# modify to a different file
remove_pins -input $::env(CURRENT_DEF)
remove_empty_nets -input $::env(CURRENT_DEF)


li1_hack_start
global_routing
detailed_routing
li1_hack_end

run_magic

save_views       -lef_path $::env(magic_result_file_tag).lef \
                 -def_path $::env(tritonRoute_result_file_tag).def \
                 -gds_path $::env(magic_result_file_tag).gds \
                 -mag_path $::env(magic_result_file_tag).mag \
				 -verilog_path $::env(CURRENT_NETLIST) \
                 -save_path $save_path \
                 -tag $::env(RUN_TAG)
