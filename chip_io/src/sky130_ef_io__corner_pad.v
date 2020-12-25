
(*blackbox*)
module sky130_ef_io__corner_pad (AMUXBUS_A, AMUXBUS_B, 
	VSSA, VDDA, VSWITCH, VDDIO_Q, VCCHIB, VDDIO, VCCD,
	VSSIO, VSSD, VSSIO_Q
);
  inout AMUXBUS_A;
  inout AMUXBUS_B;

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
