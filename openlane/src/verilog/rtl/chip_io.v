

(*blackbox*)
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
		
		input PORB
		              );
		
		


 
 
endmodule                                                                                                                                                       
