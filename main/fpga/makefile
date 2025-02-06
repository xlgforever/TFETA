
dir:=f37x
time:=$(shell date  +"%Y-%m-%d-%H_%M_%S")
dir:="$(dir)-$(time)"

default: clean name
	cp f37x  $(dir)-1core  -rf 
	#$(MAKE) -C  $(dir)-1core		
	vivado   -log   $(dir)-1core/vivado.log  -mode batch  -source f37x.tcl    -tclargs  --project_name  $(dir)-1core   

1core_250m: clean name
	cp f37x  $(dir)-250m-1core  -rf 
	#$(MAKE) -C  $(dir)-250m-1core		
	vivado   -log   $(dir)-250m-1core/vivado.log  -mode batch  -source f37x_250MHz.tcl    -tclargs  --project_name  $(dir)-250m-1core   

clean:
	rm -rf f37x/f37x.* f37x/vivado* 
	rm -rf vivado*  

name:
	echo $(dir)

