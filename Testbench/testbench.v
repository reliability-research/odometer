`timescale 1ns/100ps

module testbench() ;

        reg AC_STRESS_CLK_r; 
        wire AC_STRESS_CLK; 
        assign AC_STRESS_CLK=AC_STRESS_CLK_r; 

        reg SCANOUT_DIN_r;
        wire SCANOUT_DIN;
        assign SCANOUT_DIN=SCANOUT_DIN_r;

        reg SCANIN_DIN_r;
        wire SCANIN_DIN;
        assign SCANIN_DIN=SCANIN_DIN_r;

        reg SCANIN_CLK_r;
        wire SCANIN_CLK;
        assign SCANIN_CLK=SCANIN_CLK_r;

        reg SCANOUT_CLK_r;
        wire SCANOUT_CLK;
        assign SCANOUT_CLK=SCANOUT_CLK_r;

        reg RESETB_r;
        wire RESETB;
        assign RESETB=RESETB_r;

        reg LOAD_r;
        wire LOAD;
        assign LOAD=LOAD_r;

        reg MEAS_TRIG_r;
        wire MEAS_TRIG;
        assign MEAS_TRIG=MEAS_TRIG_r;
  
        wire AC_STRESS_CLK_INT;
        wire SCANIN_CLK_INT;
        wire SCANOUT_CLK_INT;
        wire RESETB_INT;
        wire LOAD_INT;
        wire MEAS_TRIG_INT;
        wire SCANOUT_DOUT;
        wire SCANIN_DOUT;

     odometer_top DUT  (.AC_STRESS_CLK(AC_STRESS_CLK), .SCANOUT_DIN(SCANOUT_DIN), .SCANIN_DIN(SCANIN_DIN), 
                         .SCANIN_CLK(SCANIN_CLK), .SCANOUT_CLK(SCANOUT_CLK), .RESETB(RESETB), .LOAD(LOAD), 
                         .MEAS_TRIG(MEAS_TRIG), .AC_STRESS_CLK_INT(AC_STRESS_CLK_INT), .SCANIN_CLK_INT(SCANIN_CLK_INT), 
                         .SCANOUT_CLK_INT(SCANOUT_CLK_INT), .RESETB_INT(RESETB_INT), .LOAD_INT(LOAD_INT), 
                         .MEAS_TRIG_INT(MEAS_TRIG_INT), .SCANOUT_DOUT(SCANOUT_DOUT), .SCANIN_DOUT(SCANIN_DOUT));

always #25 AC_STRESS_CLK_r = ~AC_STRESS_CLK_r ;

initial
        begin
          //$sdf_annotate ("annotateHack.sdf",DUT,,"sdfAnnotation.log","MAXIMUM",,);
          $dumpfile ("odometer.vcd");
          $dumpvars(1, DUT.AC_STRESS_CLK, DUT.SCANOUT_DIN, DUT.SCANIN_DIN, DUT.SCANIN_CLK, DUT.SCANOUT_CLK, DUT.RESETB, 
                       DUT.LOAD, DUT.MEAS_TRIG, DUT.AC_STRESS_CLK_INT, DUT.SCANIN_CLK_INT, DUT.SCANOUT_CLK_INT, DUT.RESETB_INT,
                       DUT.LOAD_INT, DUT.MEAS_TRIG_INT, DUT.SCANOUT_DOUT, DUT.SCANIN_DOUT);
          AC_STRESS_CLK_r = 1'b1 ; 
          SCANOUT_DIN_r  = 1'b1 ;
          SCANIN_DIN_r   = 1'b0 ;
          SCANIN_CLK_r   = 1'b1 ;
          SCANOUT_CLK_r  = 1'b1 ;
          RESETB_r       = 1'b0 ; // begin in reset
          LOAD_r         = 1'b0 ;
          MEAS_TRIG_r    = 1'b0 ;

    #100  RESETB_r       = 1'b1 ; // Release reset 
                 repeat (6)
            begin
              SCANIN_DIN_r   = 1'b0 ;   // Clear out all control registers and place in idle state
              #50 SCANIN_CLK_r = ~SCANIN_CLK_r ;
            end

            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b1 ; // configutre bit 0, to control external VCO, dummy bit
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b0 ; // configutre bit 1, to control external VCO, dummy bit
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure

            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b1 ; // configutre bit 0, 1 start stress
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b1 ; // configutre bit 1, 1 AC stress
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b0 ; // configutre bit 2, 1 stress INV
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b1 ; // configutre bit 3, 1 stress NAND
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b1 ; // configutre bit 3, 1 stress NAND
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b0 ; // configutre bit 3, 1 stress NAND

	    LOAD_r         = 1'b0 ;
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            LOAD_r         = 1'b1 ;
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            SCANIN_DIN_r   = 1'b0 ; LOAD_r         = 1'b0 ; // configutre bit 4, 1 stress NOR
	    #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // falling edge of clock place scan data on to configure
            #50 SCANIN_CLK_r = ~SCANIN_CLK_r ; // rising edge of clock place scan data on to configure
                repeat (1000)
            begin
             #50 ; //  Wait 1000 stress clock cycles
            end 
             #25 MEAS_TRIG_r    = 1'b1 ; // Start the measure cycle
             #25 ;
                 repeat (1000)
            begin
             #50 ; //  Wait 1000 stress clock cycles
            end 
                 repeat (25)
            begin
             #50 SCANOUT_CLK_r = ~SCANOUT_CLK_r ; // Scan out the aging results 12 bit results
             SCANOUT_DIN_r  =  ~SCANOUT_DIN_r ;   // place a 0,1,0... pattern into the putput chain
             #50 SCANOUT_CLK_r = ~SCANOUT_CLK_r ; // Scan out the aging results 12 bit results

            end
            #10000 $finish ;
         end
endmodule 
