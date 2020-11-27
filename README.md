




# Table of Contents


* # Introduction

* # [Testboard Schematic](https://github.com/rsnkhatri3/pllsoc#testboard-schematic)

* # [Procedure](https://github.com/rsnkhatri3/pllsoc#procedure)

* ## [For Observing PLL Locking](https://github.com/rsnkhatri3/pllsoc#for-observing-pll-locking)
   
* ## [For Settling Time](https://github.com/rsnkhatri3/pllsoc#for-settling-time)

* ## [For VCO linearity and gain](https://github.com/rsnkhatri3/pllsoc#for-vco-linearity-and-gain)

* # [PLL](https://github.com/rsnkhatri3/pllsoc#pll)

* # [SoC Package](https://github.com/rsnkhatri3/pllsoc#soc-package)

* # [IO and PG PAD cells](https://github.com/rsnkhatri3/pllsoc#io-and-pg-pad-cells)








# Testboard schematic
![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/pll_testboard.png)



Here, we are testing the PLL with reference clock generated from Pulse generator which is present outside the SoC.



# Procedure:
 

Connect 1.8V, 3.3V, GND and 5V power supply for testing and also 0.2V to 1.2V varying power supply generator at specified positions in schematic.

## For Observing PLL Locking

1. EN_VCO is made HIGH and EN_CP is made HIGH with switches S1 and S2. GND is applied at VCO_IN through switch S3. 

2. Pass  10uA current through B_CP with switch S4 HIGH. 

3. Connect indicated position CLK’ to Oscilloscope CH. II to observe the output. 

4. Adjust the value of Variable(Trimming) Capacitors as calculated by equation 1 connected to the crystal, which will cause a sinusoidal wave to be applied to PLL inside SoC and observe the PLL input signal on oscilloscope CH.I  which is available as REF (put oscilloscope in dual mode). 


The value of  C1  and  C2   are kept same for simplicity. Need not be always true.
PLL is locked when the phase difference between the REF and CLK’ signals are constant.




Let, N = 5 for below figure, 

![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/pll_locking.png)


# For Settling Time


Similarly, settling time can be measured  by observing the output in oscilloscope. Here, Tlock is the settling time for the observed frequency.  After Tlock , the PLL is phase locked.



# For VCO linearity and gain 


1. EN_CP  is made LOW and EN_VCO  is made HIGH. 

2. VCO control voltage is applied at  VCO_IN.

3.  A voltage V1 is forced onto the  VCO_IN. 

4. After settling, the corresponding output frequency F1 of the VCO is measured at pin5 from oscilloscope. 

5. A higher voltage V2 is then forced onto the pin4. 

6. After settling, the corresponding output frequency F2 of the VCO is measured.


After taking the above measurements the VCO gain can be determined using the following relationship.


![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/vco_gain.png)


 
In certain applications it may be necessary to determine VCO non-linearity, this can be determined by taking incremental measurements of the VCO gain between the points V1 and V2.


![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/vco_linearity.png)


![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/vco_output.png)



# PLL

The PLL IP  to be tested is considered as the one given in figure below:

![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/pll.png)


# SoC Package

The SoC package used for testing of PLL IP is SOIC-24 shown below:

![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/soc_package.png)


# IO and PG PAD cells

Here, we are using the SKY130 IO and Periphery PAD cells for developing the SoC package. The PAD cells used are shown below and also a table for their reason of use.

![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/pads.png)  


The PAD cells used are listed below:


![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/io_pg_cells.png)



For developing the SoC, we use opensource flow Openlane. Here, we have done till synthesis and floorplannnig through Openlane. 

To perform the above mentioned operation, we use verilog blackbox technique. Here, we consider the IO and Periphery cells used, PLL IP to be tested and 

the Power on Reset circuit as a black box. For this we use their .lef and verilog files containing only the input output port description.



we follow the below mentioned steps:


1. Create a folder with the name of top level verilog file in design directory.
               
                      cd vsdflow/work/tools/openlane_working_dir/openlane/designs/

                      mkdir pll_soc
2. Again create a new folder src inside pll_soc
                      
                      cd pll_soc
                      
                      mkdir src

3. Inside the src directory place .lef files of all the IO and Periphery PAD cells used, the PLL IP to be tested and the Power on Reset circuit used.

                     avsdpll_1v8.lef

                     simple_por.lef

                     sky130_fd_io__top_gpiov2.lef

                     sky130_fd_io__top_ground_hvc_wpad.lef

                     sky130_fd_io__top_ground_lvc_wpad.lef

                     sky130_fd_io__top_power_hvc_wpad.lef

                     sky130_fd_io__top_power_lvc_wpad.lef

4. Place the top level verilog file pll_soc.v in the src directory.

   Also, place the verilog files with extension .blackbox.v  present in the SKY130 IO and Periphery PAD cells library. For PLL IP to be tested and the 
   
   Power on Reset circuit used, the verilog files with only the input output port description is placed.

                    pll_soc.v

                    avsdpll_1v8.v

                    simple_por.blackbox.v

                    sky130_fd_io__top_gpiov2.blackbox.v

                    sky130_fd_io__top_ground_hvc_wpad.blackbox.v

                    sky130_fd_io__top_ground_lvc_wpad.blackbox.v

                    sky130_fd_io__top_power_hvc_wpad.blackbox.v

                    sky130_fd_io__top_power_lvc_wpad.blackbox.v

   Above mentioned files are present under pllsoc/openlane/verilog.

5. Now, we have to add a config.tcl file in pll_soc directory. So, go to the terminal and run the following:

                    cd vsdflow/work/tools/openlane_working_dir/openlane/
                    
      and execute:

                    export PDK_ROOT=<absolute path to where skywater-pdk and open_pdks reside>

                    docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) openlane:rc2

                     ./flow.tcl -design pll_soc -init_design_config   



This will create `config.tcl` file with default settings. We then modify the file with required configuration variables that can be seen from 
[here](https://github.com/rsnkhatri3/pllsoc/blob/main/openlane/config.tcl). The information about configuration variables can be found [here] 
(https://github.com/efabless/openlane/blob/master/configuration/README.md). We have basically pointed the location of verilog and lef files 
present in src directory in config.tcl.          

6. Repeat the commands mentioned in step 5 till the bash window opens. In the bash window, the interactive flow is executed.

                                 ./flow.tcl -design pll_soc -interactive

7. Run the below mentioned commands sequentially.

                                  package require openlane 0.9                                           //Setting up flow

                                  prep -design pll_soc -overwrite
                                  
                                  
                                  set lefs 	 [glob $::env(DESIGN_DIR)/src/*.lef]                     //The LEF file for macro

                                  add_lefs -src $lefs
                                  

                                  run_synthesis                                                          //Synthesis
                                   
The output file can be found [here](https://github.com/rsnkhatri3/pllsoc/blob/main/openlane/results/synthesis/pll_soc.synthesis.v).

                           
                                  init_floorplan_or                                                      //Floorplanning
The output DEF file can be found [here](https://github.com/rsnkhatri3/pllsoc/blob/main/openlane/results/floorplan/pll_soc.floorplan.def)
