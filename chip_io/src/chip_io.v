
`include "sky130_ef_io__gpiov2_pad_wrapped.v"

`include "sky130_ef_io__vddio_hvc_pad.v"
`include "sky130_ef_io__vssio_hvc_pad.v"
`include "sky130_ef_io__vdda_hvc_pad.v"
`include "sky130_ef_io__vssa_hvc_pad.v"

//`include "sky130_ef_io__vdda_lvc_pad.v"
//`include "sky130_ef_io__vssa_lvc_pad.v"
`include "sky130_ef_io__vccd_lvc_pad.v"
`include "sky130_ef_io__vssd_lvc_pad.v"

`include "sky130_fd_io__top_power_lvc_wpad.v"

`include "sky130_ef_io__corner_pad.v"



module chip_io (input GPIO_0,
                input GPIO_1,
	        input GPIO_2,
	        input GPIO_3, 
		output B_0_pll,
	        output B_1_pll, 
		output B_2_pll, 
		output B_3_pll,
		 
		input REF_CLK, 
		output REF_CLK_pll,
		 
		output CLK, 
		input CLK_pll,
		 
		input VCO_IN, 
		output VCO_IN_pll,
		 
		input EN_CP, 
		output EN_CP_pll,
		 
		input EN_VCO, 
		output EN_VCO_pll,
		 
		output B_CP, 
		input B_CP_pll,
		 
		output B_VCO, 
		input B_VCO_pll, 
		
		//inout VDDA1, 
		//inout VSSA1, 
		inout vccd,
		inout vssd,
		
		inout vddio,
		inout vssio,
		inout vdda,
		inout vssa,
		
		input PORB);
		
		

wire GPIO_0;
wire GPIO_1;
wire GPIO_2;
wire GPIO_3;
wire TIE_LO_ESD [7:0];
wire B_0_pll;
wire B_1_pll;
wire B_2_pll;
wire B_3_pll;

wire REF_CLK;
wire REF_CLK_pll;

wire CLK;
wire CLK_pll;

wire VCO_IN;
wire VCO_IN_pll;

wire EN_CP;
wire EN_CP_pll;

wire EN_VCO;
wire EN_VCO_pll;

wire B_CP;
wire B_CP_pll;

wire B_VCO;
wire B_VCO_pll;


//wire   VDDA1;
//wire   VSSA1;
//wire   VCCD;
//wire   VSSD;

//wire   VDDIO;
//wire   VSSIO;
//wire   VDDA;
//wire   VSSA;

wire   PORB;		
		
		
wire analog_a, analog_b;
wire vssio_q, vddio_q;








sky130_ef_io__gpiov2_pad_wrapped GPIO_0_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                     
                                  .DM({vssd,vssd,vccd}), 
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(B_0_pll), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),      
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[0]),   
                                  .OE_N(vccd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[0]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(vssd), 
                                  
                                  
             `ifndef TOP_ROUTING                    
                                  .PAD(GPIO_0), 
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
             `endif                     
                                );




sky130_ef_io__gpiov2_pad_wrapped GPIO_1_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                     
                                  .DM({vssd,vssd,vccd}), 
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(B_1_pll), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),      
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[1]),   
                                  .OE_N(vccd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[1]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(vssd), 
                                  
            `ifndef TOP_ROUTING                      
                                  .PAD(GPIO_1),
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),                                  
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
             `endif                     
                                );
                                
                                
                                
                                
                                
sky130_ef_io__gpiov2_pad_wrapped GPIO_2_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),          
                                  
                                  .DM({vssd,vssd,vccd}), 
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(B_2_pll), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),      
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[2]),   
                                  .OE_N(vccd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[2]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(vssd), 
                                  
              `ifndef TOP_ROUTING                    
                                  .PAD(GPIO_2),
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),                                  
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
               `endif                    
                                );                                
                                
                                
                                
sky130_ef_io__gpiov2_pad_wrapped GPIO_3_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),                                 
                                  
                                  .DM({vssd,vssd,vccd}), 
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(B_3_pll), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),      
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[3]),   
                                  .OE_N(vccd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[3]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(vssd), 
                                  
              `ifndef TOP_ROUTING                    
                                  .PAD(GPIO_3), 
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),                                  
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
              `endif
                                );




sky130_ef_io__gpiov2_pad_wrapped ENb_VCO_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),         
                                  
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(EN_VCO_pll), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),      
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[4]),   
                                  .OE_N(vccd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[4]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(vssd), 
                                  
             `ifndef TOP_ROUTING                     
                                  .PAD(EN_VCO), 
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),  
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
              `endif                   
                                );


sky130_ef_io__gpiov2_pad_wrapped ENb_CP_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(), 
                                  
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(EN_CP_pll), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),      
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[5]),   
                                  .OE_N(vccd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[5]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(vssd), 
                                  
               `ifndef TOP_ROUTING                   
                                  .PAD(EN_CP), 
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),                                  
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
                `endif                   
                                );




sky130_ef_io__gpiov2_pad_wrapped B_VCO_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                   
                                  .DM({vccd,vccd,vssd}), 
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),     
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[6]),   
                                  .OE_N(vssd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[6]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(B_VCO_pll), 
                                  
            `ifndef TOP_ROUTING                      
                                  .PAD(B_VCO),
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),    
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
            `endif                      
                                );



sky130_ef_io__gpiov2_pad_wrapped B_CP_PAD (.IN_H(),
                                  .PAD_A_NOESD_H(),
                                  .PAD_A_ESD_0_H(),
                                  .PAD_A_ESD_1_H(),
                                  
                                  .DM({vccd,vccd,vssd}), 
                                  .HLD_H_N(vddio), 
                                 
                                  .IN(), 
                                  
                                  .INP_DIS(vssd), 
                                  .IB_MODE_SEL(vssd), 
                                  .ENABLE_H(PORB),     
                                  .ENABLE_VDDA_H(vssa),   
                                  .ENABLE_INP_H(TIE_LO_ESD[7]),   
                                  .OE_N(vssd),
                                  .TIE_HI_ESD(), 
                                  .TIE_LO_ESD(TIE_LO_ESD[7]), 
                                  .SLOW(vssd), 
                                  .VTRIP_SEL(vssd), 
                                  .HLD_OVR(vssd), 
                                  .ANALOG_EN(vssd), 
                                  .ANALOG_SEL(vssd), 
                                  .ENABLE_VDDIO(vccd),         
                                  .ENABLE_VSWITCH_H(vssa),     
                                  .ANALOG_POL(vssd), 
                                  .OUT(B_CP_pll), 
                                  
                `ifndef TOP_ROUTING    
                                  .PAD(B_CP),               
                                  .AMUXBUS_A(analog_a), 
                                  .AMUXBUS_B(analog_b),                                  
                                  .VSSA(vssa), 
                                  .VDDA(vdda), 
                                  .VSWITCH(vddio), 
                                  .VDDIO_Q(vddio_q), 
                                  .VCCHIB(vccd), 
                                  .VDDIO(vddio), 
                                  .VCCD(vccd), 
                                  .VSSIO(vssio),
                                  .VSSD(vssd), 
                                  .VSSIO_Q(vssio_q)
                `endif                  
                                );






sky130_fd_io__top_power_lvc_wpad VCO_IN_PAD ( 
                                   .P_CORE(VCO_IN_pll), 
                                   .BDY2_B2B(vssio), 
                                   .DRN_LVC1(vccd), 
                                   .DRN_LVC2(vccd), 
                                   .OGC_LVC(), 
                                   .SRC_BDY_LVC1(vssd), 
                                   .SRC_BDY_LVC2(vssd), 
                                   
                `ifndef TOP_ROUTING                   
                                   .P_PAD(VCO_IN), 
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b),
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
                 `endif                  
                                        );		
		
		
sky130_fd_io__top_power_lvc_wpad REF_CLK_PAD ( 
                                   .P_CORE(REF_CLK_pll), 
                                   .BDY2_B2B(vssio), 
                                   .DRN_LVC1(vccd), 
                                   .DRN_LVC2(vccd), 
                                   .OGC_LVC(), 
                                   .SRC_BDY_LVC1(vssd), 
                                   .SRC_BDY_LVC2(vssd), 
                                   
                 `ifndef TOP_ROUTING                  
                                   .P_PAD(REF_CLK), 
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b),
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
                  `endif                
                                        );		
                                        
                                        
sky130_fd_io__top_power_lvc_wpad CLK_PAD ( 
                                   .P_CORE(CLK_pll), 
                                    
                                   
               `ifndef TOP_ROUTING                    
                                   .P_PAD(CLK), 
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b),
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
                 `endif                  
                                        );                                        
                                        


//sky130_ef_io__vdda_lvc_pad VDDA1_PAD ( 

                //`ifdef TOP_ROUTING
                                   
                //                   .VCCD(VDDA1), 
                                   
                                   
                //`endif
                //                   .BDY2_B2B(VSSA), 
                //                   .DRN_LVC1(VDDA), 
                //                   .DRN_LVC2(),  
                 //                  .SRC_BDY_LVC1(VSSA), 
                //                   .SRC_BDY_LVC2(), 
                                   
               // `ifndef TOP_ROUTING                  
              //                     .AMUXBUS_A(), 
                //                   .AMUXBUS_B(),
               //                    .VSSA(VSSA),                                     
               //                    .VSWITCH(VDDIO), 
               //                    .VDDIO_Q(), 
               //                    .VCCHIB(VCCD), 
               //                    .VDDIO(VDDIO), 
               //                    .VDDA(VDDA),
               //                    .VSSIO(VSSIO), 
               //                    .VSSD(VSSD), 
               //                    .VSSIO_Q()
               // `endif                   
               //                         );                                        
                                        
                                        
//sky130_ef_io__vssa_lvc_pad VSSA1_PAD ( 

   //             `ifdef TOP_ROUTING
                                   
   //                                .VSSD(VSSA1),   
    //            `endif
                              //     .BDY2_B2B(VSSA), 
      //                           .DRN_LVC1(VDDA), 
       //                            .DRN_LVC2(),  
       //                            .SRC_BDY_LVC1(VSSA), 
       //                            .SRC_BDY_LVC2(), 
                                   
       //         `ifndef TOP_ROUTING                   
       //                            .AMUXBUS_A(), 
        //                           .AMUXBUS_B(),                                   
        //                           .VDDA(VDDA), 
        //                           .VSWITCH(VDDIO), 
        //                           .VDDIO_Q(), 
        //                           .VCCHIB(VCCD), 
        //                           .VDDIO(VDDIO), 
        //                           .VCCD(VCCD),
        //                           .VSSIO(VSSIO), 
        //                           .VSSA(VSSA),
        //                           .VSSIO_Q()
        //         `endif                  
         //                               ); 
                                        
                                        
                                        
sky130_ef_io__vccd_lvc_pad VCCD_PAD ( 

               `ifdef TOP_ROUTING
                                   .VCCD(vccd), 
               `endif                    
                                   .BDY2_B2B(vssio), 
                                   .DRN_LVC1(vccd), 
                                   .DRN_LVC2(vccd),  
                                   .SRC_BDY_LVC1(vssd), 
                                   .SRC_BDY_LVC2(vssd), 
                                   
              `ifndef TOP_ROUTING                   
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b),
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio),                                 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
               `endif                    
                                        );                                        
                                        
                                        
                                        
sky130_ef_io__vssd_lvc_pad VSSD_PAD ( 

              `ifdef TOP_ROUTING                     
                                   .VSSD(vssd),
              `endif
                                   .BDY2_B2B(vssio), 
                                   .DRN_LVC1(vccd), 
                                   .DRN_LVC2(vccd),  
                                   .SRC_BDY_LVC1(vssd), 
                                   .SRC_BDY_LVC2(vssd), 
                                     
              `ifndef TOP_ROUTING                     
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio),  
                                   .VSSIO_Q(vssio_q)
              `endif                     
                                        );                                        
                                        
                                        
                                        
                                        
sky130_ef_io__vddio_hvc_pad VDDIO_PAD ( 

               `ifdef TOP_ROUTING 
                                   .VDDIO(vddio), 
               `endif                     
                                   .DRN_HVC(vddio), 
                                   .SRC_BDY_HVC(vssio), 
                                    
              `ifndef TOP_ROUTING                    
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
              `endif                    
                                        );                                        
                                        
                                        

sky130_ef_io__vssio_hvc_pad VSSIO_PAD (

                       `ifdef TOP_ROUTING
                                   .VSSIO(vssio), 
                       `endif             
                                   .DRN_HVC(vddio), 
                                   .SRC_BDY_HVC(vssio), 
                                    
                       `ifndef TOP_ROUTING             
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
                                   .VSSA(vssa), 
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
                        `endif           
                                        );    
                                        
                                        
       
sky130_ef_io__vdda_hvc_pad VDDA_PAD (  

                `ifdef   TOP_ROUTING                       
                                     .VDDA(vdda), 
                  `endif                        
                                   
                                   .DRN_HVC(vdda), 
                                   .SRC_BDY_HVC(vssa), 
                                   
                  `ifndef  TOP_ROUTING                        
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
                                      
                                   .VSSA(vssa),                                    
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
                  `endif                 
                                   );
                                   
                                   
                                   
sky130_ef_io__vssa_hvc_pad VSSA_PAD ( 

                   `ifdef TOP_ROUTING
                                    .VSSA(vssa),
                   `endif                 
                                    
                                    .DRN_HVC(vdda), 
                                    .SRC_BDY_HVC(vssa), 
                                                                        
                   `ifndef TOP_ROUTING                 
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b),
                                    
                                   .VDDA(vdda), 
                                   .VSWITCH(vddio), 
                                   .VDDIO_Q(vddio_q), 
                                   .VCCHIB(vccd), 
                                   .VDDIO(vddio), 
                                   .VCCD(vccd), 
                                   .VSSIO(vssio), 
                                   .VSSD(vssd), 
                                   .VSSIO_Q(vssio_q)
                   `endif               
                                        );
 
 
 
sky130_ef_io__corner_pad corner_4 (

                  `ifndef TOP_ROUTING
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
	                           .VSSA(vssa), 
	                           .VDDA(vdda), 
	                           .VSWITCH(vddio), 
	                           .VDDIO_Q(vddio_q), 
	                           .VCCHIB(vccd), 
	                           .VDDIO(vddio), 
	                           .VCCD(vccd),
	                           .VSSIO(vssio), 
	                           .VSSD(vssd), 
	                           .VSSIO_Q(vssio_q),
	           `else                
	                           .VCCHIB()
	           `endif                
                                       ); 
 
 
sky130_ef_io__corner_pad corner_3 (

                  `ifndef TOP_ROUTING
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
	                           .VSSA(vssa), 
	                           .VDDA(vdda), 
	                           .VSWITCH(vddio), 
	                           .VDDIO_Q(vddio_q), 
	                           .VCCHIB(vccd), 
	                           .VDDIO(vddio), 
	                           .VCCD(vccd),
	                           .VSSIO(vssio), 
	                           .VSSD(vssd), 
	                           .VSSIO_Q(vssio_q),
	           `else                
	                           .VCCHIB()
	           `endif                
                                       );
                                       
                                       
sky130_ef_io__corner_pad corner_2 (

                  `ifndef TOP_ROUTING                 
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
	                           .VSSA(vssa), 
	                           .VDDA(vdda), 
	                           .VSWITCH(vddio), 
	                           .VDDIO_Q(vddio_q), 
	                           .VCCHIB(vccd), 
	                           .VDDIO(vddio), 
	                           .VCCD(vccd),
	                           .VSSIO(vssio), 
	                           .VSSD(vssd), 
	                           .VSSIO_Q(vssio_q),
	           `else                 
	                           .VCCHIB()
	           `endif                
                                       );
                                       
                                       
                                       
sky130_ef_io__corner_pad corner_1 (
                                   
                  `ifndef TOP_ROUTING                 
                                   .AMUXBUS_A(analog_a), 
                                   .AMUXBUS_B(analog_b), 
	                           .VSSA(vssa), 
	                           .VDDA(vdda), 
	                           .VSWITCH(vddio), 
	                           .VDDIO_Q(vddio_q), 
	                           .VCCHIB(vccd), 
	                           .VDDIO(vddio), 
	                           .VCCD(vccd),
	                           .VSSIO(vssio), 
	                           .VSSD(vssd), 
	                           .VSSIO_Q(vssio_q),
	           `else                
	                           .VCCHIB()
	           `endif                
                                       );                                                                               
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
endmodule                                                                                                                                                       
