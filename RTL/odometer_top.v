`timescale 1ns/100ps

module odometer_meas_test_detect (ROSC_REF, ROSC_STRESS, PC_OUT, RESETB, MEAS_STRESS,MEAS_DONE,PIN,DETECT, SEL);
	input ROSC_REF, PC_OUT, RESETB, MEAS_STRESS, ROSC_STRESS;

	output reg MEAS_DONE;
	output SEL, DETECT;	
	reg COUNT_RST,RST;
	output reg [0:9] PIN;
	reg [0:9] PIN2;
	reg [1:0] cnt4;
	wire RESET_INT, RESET_INT2,cnt1, RESET_MEAS_STRESS,COUNT4_RST;
	

	always @ (PIN or PIN2 or cnt4)
	if (PIN2 == 10'b1111111111 || PIN == 10'b1111111111 || cnt4 == 2'b11)
		MEAS_DONE = 1;
	else 
		MEAS_DONE = 0;


	/////////////////////////////////assign MEAS_DONE = cnt4[1] & cnt4[0] ;      // measurement is finished if cnt4=11(binary), which is the count of the edges of the phase count signal
	assign cnt1 = ~cnt4[1] ;

	edge_detector detect (PC_OUT, RESETB, ROSC_REF, DETECT);   // edge detector circuit
	assign RESET_INT2 = ~RESETB | (cnt4[1] & ~cnt4[0])  | ~MEAS_STRESS;	
	assign RESET_INT = ~RESETB | MEAS_DONE | cnt1 | ~MEAS_STRESS;
	assign COUNT4_RST=~RESETB | ~MEAS_STRESS ;  // MEAS_STRESS will go low when the measurement is done, counters will be reset

	always @ (negedge ROSC_REF or posedge RESET_INT) begin           // Count is being measured at negative edge of the reference rosc
		if (RESET_INT)
			PIN <= 10'b0000000000;
		else
			PIN <= PIN + 1'b1;
	end

	always @ (negedge ROSC_STRESS or posedge RESET_INT2) begin           // Count is being measured at negative edge of the reference rosc
		if (RESET_INT2)
			PIN2 <= 10'b0000000000;
		else
			PIN2 <= PIN2 + 1'b1;
	end


	
	always @ (negedge DETECT or posedge COUNT4_RST) begin
		if (COUNT4_RST)                     
			cnt4 <= 2'b00;                 // counter is reset when measurement is done
		else 
			cnt4 <= cnt4 + 2'b01;          // otherwise counter keeps countinf detecl signals

	end

	assign SEL= MEAS_DONE | !MEAS_STRESS;


endmodule

// a normal parallel to serial shift register 
module scanchain(SCAN_IN,PIN, SCAN_CLKA, SEL_INT, RESETB, SERIAL_OUT, SCAN_OUT);
	input SCAN_IN,SCAN_CLKA, SEL_INT, RESETB;
	input [0:9] PIN ;
	output reg [0:9] SERIAL_OUT ;
	output reg SCAN_OUT ;    
	wire R_INT, SEL_INT, CLKA, MEAS_DONE_BUF ;
	
	assign CLKA = SCAN_CLKA;
	assign R_INT = !RESETB;
	
	integer i;
	always @ (posedge CLKA, posedge R_INT) begin 
 		if (R_INT) 
 		begin
  			SERIAL_OUT <= 0;
  			SCAN_OUT <= 0;				
  		end
 		else
 		begin

		   //for (i=0;i<10;i=i+1) 
		   //begin
			if (SEL_INT==0) begin                          // if SEL_INT==0, the register is parallal
				SERIAL_OUT[0] <= PIN[0];
				SERIAL_OUT[1] <= PIN[1];
				SERIAL_OUT[2] <= PIN[2];
				SERIAL_OUT[3] <= PIN[3];
				SERIAL_OUT[4] <= PIN[4];
				SERIAL_OUT[5] <= PIN[5];
				SERIAL_OUT[6] <= PIN[6];
				SERIAL_OUT[7] <= PIN[7];
				SERIAL_OUT[8] <= PIN[8];
				SERIAL_OUT[9] <= PIN[9];
				SCAN_OUT <= PIN[9];
			end
			/*begin
			    if (i==10)    			//latest edit
			    	SCAN_OUT <= PIN[9];    		//latest edit
			    else	    			//latest edit		    	
				SERIAL_OUT[i] <= PIN[i];	//latest edit
			end					//latest edit
				*/

			else begin
				SERIAL_OUT[0] <= SCAN_IN;
				SERIAL_OUT[1] <= SERIAL_OUT[0];
				SERIAL_OUT[2] <= SERIAL_OUT[1];
				SERIAL_OUT[3] <= SERIAL_OUT[2];
				SERIAL_OUT[4] <= SERIAL_OUT[3];
				SERIAL_OUT[5] <= SERIAL_OUT[4];
				SERIAL_OUT[6] <= SERIAL_OUT[5];
				SERIAL_OUT[7] <= SERIAL_OUT[6];
				SERIAL_OUT[8] <= SERIAL_OUT[7];
				SERIAL_OUT[9] <= SERIAL_OUT[8];
				SCAN_OUT <= SERIAL_OUT[9];
                       end 

			/*begin                                     // if SEL_INT==1, the register is parallal
			    if (i==0)
			    	SERIAL_OUT[i] <= SCAN_IN;
			    else if (i==10)    		//latest edit
			    	SCAN_OUT <= SERIAL_OUT[9];    	//latest edit
			    else
				SERIAL_OUT[i] <= SERIAL_OUT[i-1];
			end*/

 		   end
	     	end
	    //end

endmodule


// Simple 3 bit shift register
module shift_sample_3b(SHIFT_IN, RST, CLK, DATA_OUT);
	input SHIFT_IN, RST, CLK;
	output reg [0:2] DATA_OUT; 
	
	always @ (posedge CLK, posedge RST) begin
 		if (RST) 
 		begin
  			DATA_OUT <= 3'b000;
    		end
 		else
 		begin		
			DATA_OUT[0] <= SHIFT_IN;
			DATA_OUT[1] <= DATA_OUT[0];			
			DATA_OUT[2] <= DATA_OUT[1];

		end
	end
endmodule


module edge_detector(IN, RESETB, CLK, DETECT);
	input IN;
	input RESETB, CLK;
	output DETECT;
	wire [0:2] OUT;
	wire [0:2] OUTB;
	wire RESET_INT;
	assign RESET_INT = ~RESETB;
	
	shift_sample_3b shift_reg (IN, RESET_INT, CLK, OUT);	
	assign OUTB[0] = !OUT[0];
	assign OUTB[1] = !OUT[1];
	assign OUTB[2] = !OUT[2];

	assign DETECT = OUT[0] & OUTB[1] & OUTB[2];	
endmodule			


// a normal serial shift register for 12 inputs
module signal_ctrl(SCAN_IN, SCAN_CLKA, RESETB, LOAD, SCAN_OUT, CTRL);
	input SCAN_IN, SCAN_CLKA, RESETB, LOAD;
	output reg [0:6] CTRL;
	reg [0:6] CTRL_INT ;
	output SCAN_OUT ;
	wire RESET_INT ;
	integer i;
	assign RESET_INT = !RESETB;
	assign SCAN_OUT = CTRL_INT[6];
	always @ (posedge SCAN_CLKA, posedge RESET_INT) begin 
 		if (RESET_INT) 
 		begin
  			CTRL_INT <= 0;
  		end
 		else
 		begin						// shifting bits through the register
							
			CTRL_INT[0] <= SCAN_IN;
			CTRL_INT[1] <= CTRL_INT[0];
			CTRL_INT[2] <= CTRL_INT[1];
			CTRL_INT[3] <= CTRL_INT[2];
			CTRL_INT[4] <= CTRL_INT[3];
			CTRL_INT[5] <= CTRL_INT[4];
			CTRL_INT[6] <= CTRL_INT[5];
			//CTRL_INT[7] <= CTRL_INT[6];
			//CTRL_INT[8] <= CTRL_INT[7];
			//CTRL_INT[9] <= CTRL_INT[8];
			//CTRL_INT[10] <= CTRL_INT[9];
			//CTRL_INT[11] <= CTRL_INT[10];

		end
	     	
	end
	
	always @ (posedge LOAD, posedge RESET_INT) begin             // LOAD signal catches the values to the control signal
 		if (RESET_INT) 
  			CTRL <= 0;
 		else
 			CTRL <= CTRL_INT;
	end		

endmodule	
	

module odometer_core (START,MEAS_STRESS,MEAS_DONE,EN_POWER_ROSC_STRESS,EN_ROSC,VDD,VSS);

input START, MEAS_STRESS, MEAS_DONE;

inout VDD, VSS;
output EN_POWER_ROSC_STRESS, EN_ROSC;

wire EN_ROSC, EN_POWER_ROSC_STRESS,EN_ROSC_REF;
assign EN_POWER_ROSC_STRESS = START | MEAS_STRESS;    // enable power for the stress ROSC
assign EN_ROSC = ~(~(MEAS_STRESS) | MEAS_DONE);       // enable ROSC


endmodule

module freq_div_only (RO_OUT,RST,DIV2_OUT,DIV4_OUT,DIV8_OUT,OUT);
input RO_OUT,RST;
output  DIV2_OUT,DIV4_OUT,DIV8_OUT,OUT;


reg [11:0] DIV_OUT;   // 12 bit frequency divider bits
integer i;


assign    DIV2_OUT = DIV_OUT[0];
assign    DIV4_OUT = DIV_OUT[1];
assign    DIV8_OUT = DIV_OUT[2];
assign    OUT = DIV_OUT[11];

//using a counter as a frequency divider
always @ (posedge RO_OUT or negedge RST) begin
if (!RST) begin

   DIV_OUT <= 0;
end

else begin
   DIV_OUT <= DIV_OUT + 1'b1  ;

end

end	
	
endmodule


module odometer_top (ROSC_STRESS, ROSC_REF, VCO,SCANCHAIN_IN,SCAN_IN, SCAN_CLK1, SCAN_CLK2, RESETB, LOAD,  MEAS_TRIG,VCO_INT, SCAN_CLK1_INT, SCAN_CLK2_INT, RESETB_INT, LOAD_INT,  MEAS_TRIG_INT, SCAN_OUT_INT,SCANIN_CHECK_INT, SEL_INV, SEL_NAND, SEL_NOR, START, AC_DC, MEAS_STRESS, EN_ROSC, EN_POWER_ROSC_STRESS,VCO_OUT,VDD,VSS);

input ROSC_STRESS, ROSC_REF,VDD,VSS;
output MEAS_STRESS, EN_ROSC, EN_POWER_ROSC_STRESS;

input VCO,SCANCHAIN_IN,SCAN_IN, SCAN_CLK1, SCAN_CLK2, RESETB, LOAD, MEAS_TRIG;
output VCO_INT, SCAN_CLK1_INT, SCAN_CLK2_INT, RESETB_INT, LOAD_INT,  MEAS_TRIG_INT, SCAN_OUT_INT, SCANIN_CHECK_INT;
wire [0:9] SERIAL_OUT;
//wire [1:0] SEL;
output SEL_INV, SEL_NAND, SEL_NOR;
output START, AC_DC;
output reg VCO_OUT;

wire SEL_INV, SEL_NAND, SEL_NOR;
wire AC_DC;
wire [0:9] DATA,PIN ;
wire [0:6] CTRL;
reg MEAS_STRESS;
reg PC_OUT;
wire [1:0] VCO_DIV_SEL;
wire ROSC_REF,MEAS_DONE,RESET_MEAS_STRESS,SCAN_CLK1_INT,SCAN_CLK2_INT,SEL,DETECT,CLKA;

freq_div_only freq_div (VCO,RESETB,DIV2_OUT,DIV4_OUT,DIV8_OUT,OUT);


//multiplexer to select the waveform that has a frequency of 1/2, 1/4 or 1/8 of the base frequency
always @ (VCO or VCO_DIV_SEL or DIV2_OUT or DIV4_OUT or DIV8_OUT) begin
case (VCO_DIV_SEL)
	2'b00 : VCO_OUT = VCO;
	2'b01 : VCO_OUT = DIV2_OUT;
	2'b10 : VCO_OUT = DIV4_OUT;
	2'b11 : VCO_OUT = DIV8_OUT;
	//default: VCO_OUT = VCO;

endcase
end



// control signal is assigned to the pins
	assign VCO_DIV_SEL[0] = CTRL[5]; // to control freq from external VCO 
	assign VCO_DIV_SEL[1] = CTRL[6]; // to control freq from external VCO
assign SEL_INV = CTRL[2];
assign SEL_NAND = CTRL[3];
assign SEL_NOR = CTRL[4];
assign AC_DC = CTRL[1];
assign START = CTRL[0];
//assign SEL_POWER_1_REF = CTRL[0];
//assign SEL_POWER_2_REF = CTRL[1];
//assign SEL_POWER_3_REF = CTRL[2];
//assign SEL_POWER_1_STRESS = CTRL[3];
//assign SEL_POWER_2_STRESS = CTRL[4];
//assign SEL_POWER_3_STRESS = CTRL[5];


assign RESET_MEAS_STRESS = ~RESETB | MEAS_DONE ;

// when MEAS_STRESS=1, ROSC starts oscillating, MEAS_STRESS automatically becomes 0 when the measurement is done 
	always @ (posedge MEAS_TRIG or posedge RESET_MEAS_STRESS) begin
		if (RESET_MEAS_STRESS)
			MEAS_STRESS <=0;
		else
			MEAS_STRESS<= 1'b1; 
	end 

signal_ctrl scanin (SCAN_IN, SCAN_CLK1, RESETB, LOAD, SCANIN_CHECK, CTRL);

// glitch removal portion
wire EN_ROSC_pre;
reg [1:0] EN_ROSC_shifted;
odometer_core core (.START(START),.MEAS_STRESS(MEAS_STRESS),.MEAS_DONE(MEAS_DONE), .EN_POWER_ROSC_STRESS(EN_POWER_ROSC_STRESS), .EN_ROSC(EN_ROSC_pre),
.VDD(VDD),.VSS(VSS));

	always @ (posedge VCO or negedge MEAS_STRESS) begin
		if (!MEAS_STRESS)
			EN_ROSC_shifted <=0;
		else begin
			EN_ROSC_shifted[0] <= EN_ROSC_pre; 
			EN_ROSC_shifted[1] <= EN_ROSC_shifted[0]; 
		end
	end 

assign EN_ROSC = EN_ROSC_shifted[1];

// generation of phase count signal, with respect to ROSC_REF signal
always @ (posedge ROSC_REF or negedge MEAS_STRESS) begin
	if(!MEAS_STRESS)
		PC_OUT <= 1 ;
	else
		PC_OUT <= ROSC_STRESS ;
end

odometer_meas_test_detect meas (ROSC_REF, ROSC_STRESS, PC_OUT, RESETB, MEAS_STRESS,MEAS_DONE,PIN,DETECT,SEL);

//assign CLKA = SCAN_CLK2 | DETECT;
assign CLKA = SCAN_CLK2 ^ DETECT;
scanchain sc (SCANCHAIN_IN,PIN, CLKA, SEL, RESETB, SERIAL_OUT, SCAN_OUT);

// buffer block
buff_block_ver4 buff_block_ver4(.VCO(VCO),.SCANIN_CHECK(SCANIN_CHECK), .SCAN_CLK1(SCAN_CLK1),.SCAN_CLK2(SCAN_CLK2),.RESETB(RESETB),
.LOAD(LOAD),.MEAS_TRIG(MEAS_TRIG),.SCAN_OUT(SCAN_OUT),.VCO_INT(VCO_INT),.SCANIN_CHECK_INT(SCANIN_CHECK_INT), 
.SCAN_CLK1_INT(SCAN_CLK1_INT),.SCAN_CLK2_INT(SCAN_CLK2_INT),.RESETB_INT(RESETB_INT),.LOAD_INT(LOAD_INT),
.MEAS_TRIG_INT(MEAS_TRIG_INT),.SCAN_OUT_INT(SCAN_OUT_INT));
endmodule


// All the inputs are buffered before being connected to the inputs of the next odometer
module buff_block_ver4(VCO,SCANIN_CHECK, SCAN_CLK1,SCAN_CLK2,RESETB,LOAD,MEAS_TRIG,SCAN_OUT,VCO_INT,SCANIN_CHECK_INT, SCAN_CLK1_INT,SCAN_CLK2_INT,RESETB_INT,LOAD_INT,MEAS_TRIG_INT,SCAN_OUT_INT);

input VCO,SCANIN_CHECK, SCAN_CLK1,SCAN_CLK2,RESETB,LOAD,MEAS_TRIG,SCAN_OUT;
output VCO_INT,SCANIN_CHECK_INT, SCAN_CLK1_INT,SCAN_CLK2_INT,RESETB_INT,LOAD_INT,MEAS_TRIG_INT,SCAN_OUT_INT;
wire fint[1:6];
wire fint2[1:6];
//supply1 VDD ;
//supply0 VSS ;
BUFF2 buff_vco(.X(VCO_INT), .A(VCO) );
BUFF2 buff_scanclk1(.X(SCAN_CLK1_INT), .A(SCAN_CLK1));
BUFF2 buff_scanclk2(.X(SCAN_CLK2_INT), .A(SCAN_CLK2));
BUFF2 buff_reset(.X(RESETB_INT),.A(RESETB));
BUFF2 buff_load(.X(LOAD_INT), .A(LOAD));
BUFF2 buff_meastrig(.X(MEAS_TRIG_INT), .A(MEAS_TRIG));

// SCANIN_CHECK and SCAN_OUT pins have extra buffers so that any kind of hold violation do not occur
genvar i;
assign fint[1]=SCANIN_CHECK;
generate begin
for (i=1;i<=5; i=i+1) begin:buff_block1
	BUFF2 buf_del(.X(fint[i+1]), .A(fint[i]));
end
end
endgenerate
assign SCANIN_CHECK_INT=fint[6];

assign fint2[1]=SCAN_OUT;
generate begin
for (i=1;i<=5; i=i+1) begin:buff_block2
	BUFF2 buf_del2(.X(fint2[i+1]), .A(fint2[i]));
end
end
endgenerate
assign SCAN_OUT_INT=fint2[6];
endmodule










