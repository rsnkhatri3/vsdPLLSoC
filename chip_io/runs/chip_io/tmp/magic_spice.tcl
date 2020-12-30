
lef read /home/roshan/Desktop/vsdflow/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
if {  [info exist ::env(EXTRA_LEFS)] } {
	set lefs_in $::env(EXTRA_LEFS)
	foreach lef_file $lefs_in {
		lef read $lef_file
	}
}
def read /openLANE_flow/designs/chip_io/runs/chip_io/results/routing/chip_io.def
load chip_io -dereference
cd /openLANE_flow/designs/chip_io/runs/chip_io/results/magic/
extract do local
extract no capacitance
extract no coupling
extract no resistance
extract no adjust
extract unique
# extract warn all
extract

ext2spice lvs
ext2spice chip_io.ext
feedback save /openLANE_flow/designs/chip_io/runs/chip_io/logs/magic/magic_ext2spice.feedback.txt
# exec cp chip_io.spice /openLANE_flow/designs/chip_io/runs/chip_io/results/magic/chip_io.spice

