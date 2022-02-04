# Odometer

RTL folder contains verilog files for synthesis and Testbench folder contains the testbench to check the functionality.

In the RTL folder, "ROSC101_SEL\_\*" are codes for stress ring oscillators, "ROSC103_SEL\_\*\_REF" are for reference ring oscillators.
"odometer_meas_ctrl" is the control block with the scan chains and measurement circuits. 
"rosc_block_top_pwr\_\*" are units with power supplying inverters along with the reference and stress ring oscillators.
"odometer_top" is the topmost block for the full odometer circuit.

Publication:

Tahmida Islam, Junkyu Kim, David Tipple, Michael Nelson, Robert Jin, Anis Jarrar, and Chris Kim, "A Calibration-Free Synthesizable Odometer Featuring Automatic Frequency Dead Zone Escape and Start-up Glitch Removal", International Reliability Physics Symposium (IRPS), 2022 
