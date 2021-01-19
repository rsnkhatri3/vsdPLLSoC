


# Table of Contents


* ## [Introduction](https://github.com/rsnkhatri3/pllsoc/wiki#introduction)

* ##  [Testboard Schematic](https://github.com/rsnkhatri3/pllsoc#testboard-schematic)

* ##  [Procedure](https://github.com/rsnkhatri3/pllsoc#procedure)

* ### [For Observing PLL Locking](https://github.com/rsnkhatri3/pllsoc#for-observing-pll-locking)
   
* ### [For Settling Time](https://github.com/rsnkhatri3/pllsoc#for-settling-time)

* ###  [For VCO linearity and gain](https://github.com/rsnkhatri3/pllsoc#for-vco-linearity-and-gain)

* ##  [PLL](https://github.com/rsnkhatri3/pllsoc#pll)

* ##  [SoC Package](https://github.com/rsnkhatri3/pllsoc#soc-package)

* ##  [IO and PG PAD cells](https://github.com/rsnkhatri3/pllsoc#io-and-pg-pad-cells)

* ## [Using Openlane flow](https://github.com/rsnkhatri3/pllsoc/wiki#using-openlane-for-synthesis-and-floorplanning)





# Introduction


In this project we are planning to test a PLL IP. The PLL IP is developed using SKY130 PDK. For this, we first develop a testboard and the test flow. The PLL IP to be tested is included in the SOIC-24 package to communicate with external circuitry present in the testboard. The package consists of PAD cells from SKY130 IO and Periphery library. Similarly, Power on Reset circuit is used from Caravel repository to provide enable_h signal to PAD cells. Using LEF and Verilog files of PAD cells used, Power on Reset circuit and PLL IP to be tested and top level verilog module, we generate the GDSII file of the chip.









# Testboard schematic

![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/pll_testboard.png)



Here, we are testing the PLL with reference clock generated from Pulse generator which is present outside the SoC.



# Procedure:
 

Connect 1.8V, 3.3V, GND and 5V power supply for testing and also 0.2V to 1.2V varying power supply generator at specified positions in schematic.

## For Observing PLL Locking

1. EN_VCO is made HIGH and EN_CP is made HIGH with switches S1 and S2. GND is applied at VCO_IN through switch S3. 

2. Pass 10uA current through B_CP with switch S4 HIGH. 

3. Connect indicated position CLK’ to Oscilloscope CH. II to observe the output. 

4. Pulse generator will cause a sinusoidal wave(or square wave) to be applied to PLL inside SoC and observe the PLL input clock signal on oscilloscope CH.I  which is available as REF_CLK (put oscilloscope in dual mode). 



PLL is locked when the phase difference between the REF and CLK’ signals are constant.




Let, N = 5 for below figure, 

![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/pll_locking.png)


# For Settling Time


Similarly, settling time can be measured  by observing the output in oscilloscope. Here, Tlock is the settling time for the observed frequency.  After 
Tlock , the PLL is phase locked.



# For VCO linearity and gain 


1. EN_CP  is made LOW and EN_VCO  is made HIGH. 

2. VCO control voltage is applied at  VCO_IN.

3. A voltage V1 is forced onto the  VCO_IN. 

4. After settling, the corresponding output frequency F1 of the VCO is measured at pin5 from oscilloscope. 

5. A higher voltage V2 is then forced onto the pin4. 

6. After settling, the corresponding output frequency F2 of the VCO is measured.


After taking the above measurements the VCO gain can be determined using the following relationship.


![](https://github.com/rsnkhatri3/pllsoc/blob/main/images/vco_gain.png)


 
In certain applications it may be necessary to determine VCO non-linearity, this can be determined by taking incremental measurements of the VCO gain 
between the points V1 and V2.


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



# Using Openlane flow



For developing the SoC, we use opensource flow Openlane. Here, we have generated GDSII file for this chip using Openlane. 
To perform the above mentioned operation, the methodology used is given in Openlane git repository [here](https://github.com/efabless/openlane/blob/master/doc/chip_integration.md).

First of all, we have generated the padframe using SKY130 IO and Periphery library.
The configuration and other required files for generating padframe is given [here](https://github.com/rsnkhatri3/vsdPLLSoC/tree/main/chip_io).
The top-level verilog file is given as chip_io.v in chip_io folder above. The IO and Periphery cells used in padframe is included as black-box. We have to also include LEF files of the cells used for P&R. In the LEF file provided by the efabless sky130_ef_io.lef we have removed metal5 and metal4 pins of PG cells's specific pins(for example VDDIO metal5 and metal4 pin for sky130_ef_io_vddio_hvc_pad) for ease in routing. 

Then we run the Openlane flow with the interactive script given [here](https://github.com/rsnkhatri3/vsdPLLSoC/blob/main/chip_io/interactive.tcl).



![PADFRAME](https://github.com/rsnkhatri3/vsdPLLSoC/blob/main/images/chip_io.png)




The PLL and POR(Power on Reset) circuit we are using is already hardened which we have used from 

[PLL](https://github.com/lakshmi-sathi/avsdpll_1v8) 

[POR](https://github.com/efabless/caravel/blob/master/lef/simple_por.lef).

So, now we have to place these three instances(PADFRAME, PLL and POR) in right places and route.
For this, the required configuration file is given [here](https://github.com/rsnkhatri3/vsdPLLSoC/blob/main/openlane/config.tcl).
The top-level verilog file for this is vsdPLLSoC.v placed in src/verilog/rtl. The three instances to be used are used as black-box. We have to also place the LEF file of instances used in src/lef. 

Then we run the Openlane flow with the interactive script given [here](https://github.com/rsnkhatri3/vsdPLLSoC/blob/main/openlane/interactive.tcl).





![vsdPLLSoC](https://github.com/rsnkhatri3/vsdPLLSoC/blob/main/images/vsdPLLSoC.png)



# Future Works


* To get clean DRC and LVS


# Acknowledgement


* Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd

* Openlane team, Efabless corporation

* Tim Edwards, Senior Vice President of Analog and Design at efabless corporation

* Ahmed Ghazy, Efabless corporation

* Nickson Jose, VLSI Engineer

* Laxmi S, MS ECE

* Praharsha Mahurkar, Maharashtra Institute of Technology

* Philipp Gühring, Developer at Falcontrol

