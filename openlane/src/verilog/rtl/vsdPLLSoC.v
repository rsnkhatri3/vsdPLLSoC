
`include "chip_io.v"
`include "avsdpll_1v8.v"
`include "simple_por.v"




module vsdPLLSoC ( input  ref_clk,
                 output b_cp,
                 output b_vco,
                 input  vco_in,
                 input  en_cp,
                 input  en_vco,
                 input  VCCD,           
                 input  VSSD,
                 input  VDDIO,
                 input  VSSIO,           
                 input  VDDA,           
                 input  VSSA,
                 input gpio_3,
                 input gpio_2,
                 input gpio_1,
                 input gpio_0,
                 output  clk

);




//wire gpio_0;
//wire gpio_1;
//wire gpio_2;
//wire gpio_3;

//wire b_1_pll;
//wire b_2_pll;
//wire b_3_pll;
//wire b_0_pll;

//wire  ref_clk;
wire  ref_clk_pll;

//wire  clk;
wire  clk_pll;

//wire   vco_in;
wire   vco_in_pll;

//wire en_cp;
wire en_cp_pll;

//wire en_vco;
wire en_vco_pll;

//wire b_cp;
//wire b_cp_pll;

//wire b_vco;
//wire b_vco_pll;


wire   porb;




simple_por   POR  (

          `ifdef USE_POWER_PINS       
                   .vdd3v3(VDDIO),
                   .vdd1v8(VCCD),
                   .vss(VSSIO),
          `endif         
                   .porb_h(porb)
               //  .porb_l(),
               //  .por_l()
                 );







avsdpll_1v8    PLL                (


                    `ifdef USE_POWER_PINS
                                   .VDD3(VDDA),
                                   .GND2(VSSA),
                                   .VDD2(VDDIO),
                                   .GND(VSSIO),
				    .VDD(VDDA),
                    `endif

                                   .REF(ref_clk_pll),
                            //     .B_VCO(B_VCO_pll),
                            //     .B_CP(B_CP_pll),
                                   .ENb_VCO(en_vco_pll),
                                   .ENb_CP(en_cp_pll),
                            //     .B({B_3_pll,B_2_pll,B_1_pll,B_0_pll}),
                                   .CLK(clk_pll),
                                   .VCO_IN(vco_in_pll)
                                  
                                   ); 





chip_io   PADFRAME     (

                          
           `ifdef USE_POWER_PINS                
                          .vccd(VCCD),
		          .vssd(VSSD),
		          .vddio(VDDIO),
		          .vssio(VSSIO),
		          .vdda(VDDA),
		          .vssa(VSSA),                        
            `endif


                         .GPIO_0(gpio_0),
                         .GPIO_1(gpio_1),
	                 .GPIO_2(gpio_2),
	                 .GPIO_3(gpio_3), 
		         .B_0_pll(),
	                 .B_1_pll(), 
		         .B_2_pll(), 
		         .B_3_pll(),
		         
		         .REF_CLK(ref_clk), 
		         .REF_CLK_pll(ref_clk_pll),		 
		         
		         .CLK(clk), 
	              	 .CLK_pll(clk_pll),		 
		         
		         .VCO_IN(vco_in), 
		         .VCO_IN_pll(vco_in_pll),		 
		         
		         .EN_CP(en_cp), 
		         .EN_CP_pll(en_cp_pll),		 
		         
		         .EN_VCO(en_vco), 
		         .EN_VCO_pll(en_vco_pll),		 
		         
		         .B_CP(b_cp), 
		         .B_CP_pll(),		 
		         
		         .B_VCO(b_vco), 
		         .B_VCO_pll(), 		
		
		      	.PORB(porb)
		);
		





endmodule
