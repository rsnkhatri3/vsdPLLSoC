


(*blackbox*)
module sky130_ef_io__vccd_lvc_pad (AMUXBUS_A, AMUXBUS_B,
	DRN_LVC1, DRN_LVC2, SRC_BDY_LVC1, SRC_BDY_LVC2, BDY2_B2B,
	VSSA, VDDA, VSWITCH, VDDIO_Q, VCCHIB, VDDIO, VCCD,
	VSSIO, VSSD, VSSIO_Q
);
  inout AMUXBUS_A;
  inout AMUXBUS_B;

  inout DRN_LVC1;
  inout DRN_LVC2;
  inout SRC_BDY_LVC1;
  inout SRC_BDY_LVC2;
  inout BDY2_B2B;
  inout VDDIO;	
  inout VDDIO_Q;	
  inout VDDA;
  inout VCCD;
  inout VSWITCH;
  inout VCCHIB;
  inout VSSA;
  inout VSSD;
  inout VSSIO_Q;
  inout VSSIO;


endmodule
