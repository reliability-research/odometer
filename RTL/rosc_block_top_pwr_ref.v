
module freq_trimming_control(EN_POWER_ROSC,SEL_POWER_OFF);
	input EN_POWER_ROSC;
	output SEL_POWER_OFF;

	assign SEL_POWER_OFF = ~EN_POWER_ROSC ;
endmodule

module pwr_controller(SEL_POWER_OFF,MEAS_STRESS,OUT,VDD,VSS);
	input SEL_POWER_OFF,MEAS_STRESS;
	wire  SEL_POWER_OFF,MEAS_STRESS;
	output OUT;
	wire OUT,MEAS_STRESS_INT,SEL_POWER_INT,SEL1_INT,SEL2_INT,SEL3_INT;
	inout VDD,VSS;

//supply1 VDD ;
//supply0 VSS ;

	INVX2 INV(.A(MEAS_STRESS), .X(MEAS_STRESS_INT));
	ANDX2 AND2_OFF (.A1(SEL_POWER_OFF), .A2(MEAS_STRESS_INT), .X(SEL_POWER_INT));  // controlling of the default switch

	INVX8 INV8_base_1 (.A(SEL_POWER_INT), .X(OUT)); //default power switch1
	INVX8 INV8_base_2 (.A(SEL_POWER_INT), .X(OUT)); //default power switch	2
	INVX8 INV8_base_3 (.A(SEL_POWER_INT), .X(OUT)); //default power switch3
	INVX8 INV8_base_4 (.A(SEL_POWER_INT), .X(OUT)); //default power switch4
		

endmodule



// Block for controlling the virtual VDD and ring oscillator selection
module ROSC101_control (SEL_INV, SEL_NAND, SEL_NOR, IN_INV, IN_NAND, IN_NOR, OUT_INV, OUT_NAND, OUT_NOR, START, AC_DC, VCO, EN_POWER_ROSC, EN_ROSC, MEAS_STRESS, VDD, VSS, OUT, MOD_VDD_INV, MOD_VDD_NAND, MOD_VDD_NOR );
	output IN_INV, IN_NAND, IN_NOR;
	wire IN_INV, IN_NAND, IN_NOR;
	input OUT_INV, OUT_NAND, OUT_NOR;
	input EN_POWER_ROSC;
	input SEL_INV, SEL_NAND, SEL_NOR;
	input START, AC_DC, VCO, EN_ROSC, MEAS_STRESS;
	output OUT;
	output MOD_VDD_INV, MOD_VDD_NAND, MOD_VDD_NOR; // modified VDD by power controller to be used at rosc
	inout VDD, VSS;
	//reg OUT;
	wire SEL_POWER_OFF, SELb_POWER_1, SELb_POWER_2, SELb_POWER_3;
	wire EN_VDD;
	freq_trimming_control freq_trim(EN_POWER_ROSC, SEL_POWER_OFF);


	// power control unit which used to control power to be applied to reference and stress rosc
	pwr_controller pwr_inv(.SEL_POWER_OFF(SEL_POWER_OFF), .MEAS_STRESS(MEAS_STRESS), .OUT(MOD_VDD_INV), .VDD(VDD), .VSS(VSS));

	pwr_controller pwr_NAND(.SEL_POWER_OFF(SEL_POWER_OFF), .MEAS_STRESS(MEAS_STRESS), .OUT(MOD_VDD_NAND), .VDD(VDD), .VSS(VSS));

	pwr_controller pwr_NOR(.SEL_POWER_OFF(SEL_POWER_OFF), .MEAS_STRESS(MEAS_STRESS), .OUT(MOD_VDD_NOR), .VDD(VDD), .VSS(VSS));


	// determine which ROSC to be used
	// determine use internal rosc or external VCO signal
	//buff_block_en buffer_chain (EN_ROSC,EN_ROSC_INT);
	assign EN_VDD = ~( ~MEAS_STRESS | SEL_POWER_OFF );

	//assign  #1 IN_INV =(EN_ROSC &  ~(OUT_INV & SEL_INV)) | (~EN_ROSC & ~EN_VDD & START & AC_DC & VCO);
	//assign  #2 IN_NAND =(EN_ROSC &  ~(OUT_NAND & SEL_NAND)) | (~EN_ROSC & ~EN_VDD & START & AC_DC & VCO);
	//assign  #3 IN_NOR =(EN_ROSC &  ~(OUT_NOR & SEL_NOR)) | (~EN_ROSC & ~EN_VDD & START & AC_DC & VCO);

	//assign  #1 OUT = EN_ROSC & ((OUT_INV & SEL_INV) | (OUT_NAND & SEL_NAND & ~SEL_INV) | (OUT_NOR & SEL_NOR & ~SEL_NAND & ~SEL_INV));
	
	
	assign  IN_INV =(EN_ROSC &  ~(OUT_INV & SEL_INV)) | (~EN_ROSC & ~EN_VDD & START & AC_DC & VCO);
	assign  IN_NAND =(EN_ROSC &  ~(OUT_NAND & SEL_NAND)) | (~EN_ROSC & ~EN_VDD & START & AC_DC & VCO);
	assign  IN_NOR =(EN_ROSC &  ~(OUT_NOR & SEL_NOR)) | (~EN_ROSC & ~EN_VDD & START & AC_DC & VCO);

	assign  OUT = EN_ROSC & ((OUT_INV & SEL_INV) | (OUT_NAND & SEL_NAND & ~SEL_INV) | (OUT_NOR & SEL_NOR & ~SEL_NAND & ~SEL_INV));	

endmodule

module rosc_block_top_pwr_ref(SEL_INV, SEL_NAND, SEL_NOR, START, AC_DC, VCO,
     EN_POWER_ROSC, EN_ROSC, MEAS_STRESS, OUT, VDD, VSS);
  input SEL_INV, SEL_NAND, SEL_NOR, START, AC_DC, VCO, EN_POWER_ROSC,
       EN_ROSC, MEAS_STRESS;
  output OUT;
  inout VDD, VSS;
  wire SEL_INV, SEL_NAND, SEL_NOR, START, AC_DC, VCO, EN_POWER_ROSC,
       EN_ROSC, MEAS_STRESS;
  wire OUT;
  wire VDD, VSS;
  wire IN_INV, IN_NAND, IN_NOR, MOD_VDD_INV, MOD_VDD_NAND, MOD_VDD_NOR, OUT_INV, OUT_NAND, OUT_NOR;

  // 3 ring oscillators with control blocks
  ROSC101_control rosc_control(.SEL_INV (SEL_INV), .SEL_NAND (SEL_NAND),
       .SEL_NOR (SEL_NOR), .OUT_INV (OUT_INV), .OUT_NAND (OUT_NAND),
       .OUT_NOR (OUT_NOR), .START (START), .AC_DC (AC_DC), .VCO (VCO),
       .EN_POWER_ROSC (EN_POWER_ROSC), .EN_ROSC (EN_ROSC), .MEAS_STRESS (MEAS_STRESS), .IN_INV (IN_INV),
       .IN_NAND (IN_NAND), .IN_NOR (IN_NOR), .OUT (OUT), .VDD (VDD),
       .VSS (VSS), .MOD_VDD_INV (MOD_VDD_INV), .MOD_VDD_NAND (MOD_VDD_NAND), .MOD_VDD_NOR (MOD_VDD_NOR));

// chain for ring oscillator
ROSC103_SEL_INV_REF ROSC_INV(.IN(IN_INV), .OUT(OUT_INV), .VDD(MOD_VDD_INV), .VSS(VSS));
ROSC103_SEL_NAND_REF ROSC_NAND(.IN(IN_NAND), .OUT(OUT_NAND), .VDD(MOD_VDD_NAND), .VSS(VSS));
ROSC103_SEL_NOR_REF ROSC_NOR(.IN(IN_NOR), .OUT(OUT_NOR), .VDD(MOD_VDD_NOR), .VSS(VSS));


endmodule

