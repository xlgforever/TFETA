default: clean com_rtl

com_rtl: systolic_array_fp16  sfu

systolic_array_fp16:
	$(MAKE) -C  sim/model/systolic_array_fp16 

sfu:
	$(MAKE) -C  sim/model/sfu

clean:
	$(MAKE) -C  sim/model/sfu clean
	$(MAKE) -C  sim/model/systolic_array_fp16 clean

fpga_1core:
	$(MAKE) -C  ./fpga

fpga_1core_250m:
	$(MAKE) -C  ./fpga  1core_250m


