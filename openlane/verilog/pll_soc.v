`include "sky130_fd_io__top_ground_hvc_wpad.v"
`include "sky130_fd_io__top_ground_lvc_wpad.v"
`include "sky130_fd_io__top_power_hvc_wpad.v"
`include "sky130_fd_io__top_power_lvc_wpad.v"
`include "sky130_fd_io__top_gpiov2.v"

`include "avsdpll_1v8.v"
`include "simple_por.v"




module pll_soc ( input   REF_CLK,
                 output B_CP,
                 output B_VCO,
                 input  VCO_IN,
                 input EN_CP,
                 input EN_VCO,
                 input   VDDA,           //VDDA = 1.8V
                 input   VSSA,
                 input   VSSD,
                 input   VDDD,           //VDDD = 1.8V
                 input   VDDR,           //VDDR = 3.3V
                 input   GNDR,
                 input   VDDO,           //VDDO = 3.3V
                 input   GNDO,
                 input GPIO_3,
                 input GPIO_2,
                 input GPIO_1,
                 input GPIO_0,
                 output  CLK

);




wire GPIO_0;
wire GPIO_1;
wire GPIO_2;
wire GPIO_3;
wire TIE_HI_ESD;
wire TIE_LO_ESD;
wire [3:0]B_pll;
wire B_1_pll;
wire B_2_pll;
wire B_3_pll;
wire B_0_pll;

wire  REF_CLK;
wire  REF_CLK_pll;

wire  CLK;
wire  CLK_pll;

wire   VCO_IN;
wire   VCO_IN_pll;

wire EN_CP;
wire EN_CP_pll;

wire EN_VCO;
wire EN_VCO_pll;

wire B_CP;
wire B_CP_pll;

wire B_VCO;
wire B_VCO_pll;


wire   VDDA;
wire   VSSA;
wire   VSSD;
wire   VDDD;

wire   VDDR;
wire   GNDR;
wire   VDDO;
wire   GNDO;

wire   VDDIO;
wire   VSSIO;

wire   VDDA1;
wire   VSSA1;

wire   VCCD1;
wire   VSSD1;

assign VDDIO = VDDR_pll;
assign VSSIO = GNDR_pll;

assign VDDA1 = VDDO_pll;
assign VSSA1 = GNDO_pll;

assign VCCD1 = VDDD_pll;
assign VSSD1 = VSSD_pll;



wire   VDDA_pll;
wire   VSSA_pll;
wire   VSSD_pll;
wire   VDDD_pll;

wire   VDDR_pll;
wire   GNDR_pll;
wire   VDDO_pll;
wire   GNDO_pll;

wire   PORB;




simple_por   POR  (.vdd3v3(VDDIO),
                   .vss(VSSIO),
                   .porb_h(PORB)
                    //.vdd1v8(VCCD1),
                    //.porb_l(),
                    //.por_l()
                 );







avsdpll_1v8   avsdpll             (.REF(REF_CLK_pll),
                                   //.B_VCO(B_VCO_pll),
                                   //.B_CP(B_CP_pll),
                                   .ENb_VCO(EN_VCO_pll),
                                   .ENb_CP(EN_CP_pll),
                                   //.B({B_3_pll,B_2_pll,B_1_pll,B_0_pll}),
                                   .CLK(CLK_pll),
                                   .VCO_IN(VCO_IN_pll)
                                   
                                  // .VDD3(VDDA_pll),
                                  // .GND2(VSSA_pll),
                                  // .VDD2(VDDD_pll),
                                  // .GND(VSSD_pll),
				  // .VDD()
                                  
                                   ); 





sky130_fd_io__top_gpiov2 GPIO_0_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(GPIO_0), 
                                  
                                  .DM({VSSD1,VSSD1,VCCD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(B_0_pll), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VCCD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(VSSD1), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );



sky130_fd_io__top_gpiov2 GPIO_1_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(GPIO_1), 
                                  
                                  .DM({VSSD1,VSSD1,VCCD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(B_1_pll), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VCCD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(VSSD1), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );


sky130_fd_io__top_gpiov2 GPIO_2_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(GPIO_2), 
                                  
                                  .DM({VSSD1,VSSD1,VCCD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(B_2_pll), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),  
                                  .OE_N(VCCD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(VSSD1), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );



sky130_fd_io__top_gpiov2 GPIO_3_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                         
                                  .PAD(GPIO_3), 
                                  
                                  .DM({VSSD1,VSSD1,VCCD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(B_3_pll), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VCCD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(VSSD1), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );


sky130_fd_io__top_gpiov2 EN_VCO_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(EN_VCO), 
                                  
                                  .DM({VSSD1,VSSD1,VCCD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(EN_VCO_pll), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VCCD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(VSSD1), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                 
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );



sky130_fd_io__top_gpiov2 EN_CP_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(EN_CP), 
                                  
                                  .DM({VSSD1,VSSD1,VCCD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(EN_CP_pll), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VCCD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(VSSD1), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );


sky130_fd_io__top_gpiov2 B_VCO_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(B_VCO), 
                                  
                                  .DM({VCCD1,VCCD1,VSSD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VSSD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(B_VCO_pll), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );


sky130_fd_io__top_gpiov2 B_CP_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .PAD(B_CP), 
                                  
                                  .DM({VCCD1,VCCD1,VSSD1}), 
                                  .HLD_H_N(VDDIO), 
                                 
                                  .IN(), 
                                  
                                  .INP_DIS(VSSD1), 
                                  .IB_MODE_SEL(VSSD1), 
                                  .ENABLE_H(PORB),      //DOUBT
                                  .ENABLE_VDDA_H(VSSA1),   
                                  .ENABLE_INP_H(TIE_LO_ESD),   
                                  .OE_N(VSSD1),
                                  .TIE_HI_ESD(TIE_HI_ESD), 
                                  .TIE_LO_ESD(TIE_LO_ESD), 
                                  .SLOW(VSSD1), 
                                  .VTRIP_SEL(VSSD1), 
                                  .HLD_OVR(VSSD1), 
                                  .ANALOG_EN(VSSD1), 
                                  .ANALOG_SEL(VSSD1), 
                                  .ENABLE_VDDIO(VCCD1),         
                                  .ENABLE_VSWITCH_H(VSSA1),     
                                  .ANALOG_POL(VSSD1), 
                                  .OUT(B_CP_pll), 
                                  .AMUXBUS_A(), 
                                  .AMUXBUS_B()
                                  
                                 // .VSSA(VSSA1), 
                                 // .VDDA(VDDA1), 
                                 // .VSWITCH(VDDIO), 
                                 // .VDDIO_Q(), 
                                 // .VCCHIB(VCCD1), 
                                 // .VDDIO(VDDIO), 
                                 // .VCCD(VCCD1), 
                                 // .VSSIO(VSSIO),
                                 // .VSSD(VSSD1), 
                                 // .VSSIO_Q()
                                );                                


sky130_fd_io__top_power_lvc_wpad VCO_IN_PAD ( .P_PAD(VCO_IN), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(VCO_IN_pll), 
                                  // .BDY2_B2B(VSSA1), 
                                  // .DRN_LVC1(VDDA1), 
                                  // .DRN_LVC2(), 
                                  // .OGC_LVC(), 
                                  // .SRC_BDY_LVC1(VSSA1), 
                                  // .SRC_BDY_LVC2(), 
                                   
                                  // .VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                  // .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );




sky130_fd_io__top_power_lvc_wpad REF_CLK_PAD ( .P_PAD(REF_CLK), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(REF_CLK_pll), 
                                  // .BDY2_B2B(VSSA1), 
                                  // .DRN_LVC1(VDDA1), 
                                  // .DRN_LVC2(), 
                                  // .OGC_LVC(), 
                                  // .SRC_BDY_LVC1(VSSA1), 
                                  // .SRC_BDY_LVC2(), 
                                   
                                   //.VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                  // .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );


sky130_fd_io__top_power_lvc_wpad CLK_PAD ( .P_PAD(CLK), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(CLK_pll), 
                                  // .BDY2_B2B(VSSA1), 
                                  // .DRN_LVC1(VDDA1), 
                                  // .DRN_LVC2(), 
                                  // .OGC_LVC(), 
                                  // .SRC_BDY_LVC1(VSSA1), 
                                  // .SRC_BDY_LVC2(), 
                                   
                                  // .VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                  // .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );                                        



sky130_fd_io__top_power_lvc_wpad VDDA_PAD ( .P_PAD(VDDA), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(VDDA_pll), 
                                  // .BDY2_B2B(VSSA1), 
                                  // .DRN_LVC1(VDDA1), 
                                  // .DRN_LVC2(), 
                                  // .OGC_LVC(), 
                                  // .SRC_BDY_LVC1(VSSA1), 
                                  // .SRC_BDY_LVC2(), 
                                   
                                   //.VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                  // .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );      


sky130_fd_io__top_ground_lvc_wpad VSSA_PAD ( .G_PAD(VSSA), 
                                    .AMUXBUS_A(), 
                                    .AMUXBUS_B()
                                   // .G_CORE(VSSA_pll), 
                                   // .BDY2_B2B(VSSA1), 
                                   // .DRN_LVC1(VDDA1), 
                                   // .DRN_LVC2(), 
                                   // .OGC_LVC(), 
                                   // .SRC_BDY_LVC1(VSSA1), 
                                   // .SRC_BDY_LVC2(), 
                                    
                                   // .VSSA(VSSA1), 
                                   // .VDDA(VDDA1), 
                                   // .VSWITCH(VDDIO), 
                                   // .VDDIO_Q(), 
                                   // .VCCHIB(VCCD1), 
                                   // .VDDIO(VDDIO), 
                                   // .VCCD(VCCD1), 
                                   // .VSSIO(VSSIO), 
                                   // .VSSD(VSSD1), 
                                   // .VSSIO_Q()
                                         );



sky130_fd_io__top_ground_lvc_wpad VSSD_PAD ( .G_PAD(VSSD), 
                                    .AMUXBUS_A(), 
                                    .AMUXBUS_B()
                                   // .G_CORE(VSSD_pll), 
                                   // .BDY2_B2B(VSSA1), 
                                   // .DRN_LVC1(VDDA1), 
                                   // .DRN_LVC2(), 
                                   // .OGC_LVC(), 
                                   // .SRC_BDY_LVC1(VSSA1), 
                                   // .SRC_BDY_LVC2(), 
                                    
                                   // .VSSA(VSSA1), 
                                   // .VDDA(VDDA1), 
                                   // .VSWITCH(VDDIO), 
                                   // .VDDIO_Q(), 
                                   // .VCCHIB(VCCD1), 
                                   // .VDDIO(VDDIO), 
                                   // .VCCD(VCCD1), 
                                   // .VSSIO(VSSIO), 
                                   // .VSSD(VSSD1), 
                                   // .VSSIO_Q()
                                         );



sky130_fd_io__top_power_lvc_wpad VDDD_PAD ( .P_PAD(VDDD), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(VDDD_pll), 
                                  // .BDY2_B2B(VSSA1), 
                                  // .DRN_LVC1(VDDA1), 
                                  // .DRN_LVC2(), 
                                  // .OGC_LVC(), 
                                 //  .SRC_BDY_LVC1(VSSA1), 
                                  // .SRC_BDY_LVC2(), 
                                   
                                  // .VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                 //  .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );      






sky130_fd_io__top_power_hvc_wpad VDDR_PAD( .P_PAD(VDDR), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(VDDR_pll), 
                                  // .DRN_HVC(VDDA1), 
                                  // .OGC_HVC(), 
                                  // .SRC_BDY_HVC(VSSA1),
                                   
                                  // .VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                  // .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );



sky130_fd_io__top_ground_hvc_wpad GNDR_PAD ( .G_PAD(GNDR),
                                    .AMUXBUS_A(), 
                                    .AMUXBUS_B()
                                   // .G_CORE(GNDR_pll), 
                                   // .DRN_HVC(VDDA1), 
                                   // .OGC_HVC(), 
                                   // .SRC_BDY_HVC(VSSA1),
                                   // .VSSA(VSSA1), 
                                   // .VDDA(VDDA1), 
                                   // .VSWITCH(VDDIO), 
                                   // .VDDIO_Q(), 
                                  //  .VCCHIB(VCCD1), 
                                   // .VDDIO(VDDIO), 
                                    //.VCCD(VCCD1), 
                                    //.VSSIO(VSSIO), 
                                   // .VSSD(VSSD1), 
                                   // .VSSIO_Q()
                                         );



sky130_fd_io__top_power_hvc_wpad VDDO_PAD( .P_PAD(VDDO), 
                                   .AMUXBUS_A(), 
                                   .AMUXBUS_B()
                                  // .P_CORE(VDDO_pll), 
                                  // .DRN_HVC(VDDA1), 
                                  // .OGC_HVC(), 
                                  // .SRC_BDY_HVC(VSSA1),
                                   
                                  // .VSSA(VSSA1), 
                                  // .VDDA(VDDA1), 
                                  // .VSWITCH(VDDIO), 
                                  // .VDDIO_Q(), 
                                  // .VCCHIB(VCCD1), 
                                  // .VDDIO(VDDIO), 
                                  // .VCCD(VCCD1), 
                                  // .VSSIO(VSSIO), 
                                  // .VSSD(VSSD1), 
                                  // .VSSIO_Q()
                                        );



sky130_fd_io__top_ground_hvc_wpad GNDO_PAD ( .G_PAD(GNDO),
                                    .AMUXBUS_A(), 
                                    .AMUXBUS_B()
                                   // .G_CORE(GNDO_pll), 
                                   // .DRN_HVC(VDDA1), 
                                   // .OGC_HVC(), 
                                   // .SRC_BDY_HVC(VSSA1),
                                   // .VSSA(VSSA1), 
                                   // .VDDA(VDDA1), 
                                   // .VSWITCH(VDDIO), 
                                   // .VDDIO_Q(), 
                                   // .VCCHIB(VCCD1), 
                                   // .VDDIO(VDDIO), 
                                   // .VCCD(VCCD1), 
                                   // .VSSIO(VSSIO), 
                                   // .VSSD(VSSD1), 
                                   // .VSSIO_Q()
                                         );






endmodule
