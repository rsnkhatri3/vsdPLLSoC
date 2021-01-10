

`timescale 1ns / 1ps
`default_nettype none


(*blackbox*)
module avsdpll_1v8 ( 
                    GND,
                    GND2,
                    VDD,
                    VDD2,
                    VDD3,                       
                    
                    CLK, 
                    VCO_IN,
                 // B_VCO,
                 // B_CP, 
                    ENb_CP, 
                    ENb_VCO, 
                    REF
                 // B 
                   );

  input GND;
  input ENb_VCO;
  input ENb_CP;
  //output B_VCO;
  //output B_CP;
  input GND2;
  input VDD2;
  input VDD3;
  input VCO_IN;
  output CLK;
  input REF;
  //input  [3:0] B;
  input VDD;

endmodule
