module avsdpll_1v8 ( CLK, VCO_IN, ENb_CP, ENb_VCO, REF );

  supply0 GND;
  input ENb_VCO;
  input ENb_CP;
  //output B_VCO;
  //output B_CP;
  supply0 GND2;
  supply1 VDD2;
  supply1 VDD3;
  input VCO_IN;
  output CLK;
  input REF;
  //input  [3:0] B;
  supply1 VDD;

endmodule
