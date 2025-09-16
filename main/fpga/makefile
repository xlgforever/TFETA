
dir:=f37x
time:=$(shell date  +"%Y-%m-%d-%H_%M_%S")
dir:="$(dir)-$(time)"


default: clean name
	cp f37x  $(dir)-250m-1core  -rf 
	##$(MAKE) -C  $(dir)-250m-1core		
	vivado   -log   $(dir)-250m-1core/vivado_fpga.log  -mode batch  -source f37x_250MHz.tcl    -tclargs  --project_name  $(dir)-250m-1core   

fpga-2022: clean name
	cp f37x  $(dir)-250m-1core-2022  -rf 
	##$(MAKE) -C  $(dir)-250m-1core-2022 		
	vivado   -log   $(dir)-250m-1core-2022/vivado_fpga.log  -mode batch  -source f37x_250MHz-2022.tcl    -tclargs  --project_name  $(dir)-250m-1core-2022  



clean:
	rm -rf f37x/f37x.* f37x/vivado* 
	rm -rf vivado*  

name:
	echo $(dir)

