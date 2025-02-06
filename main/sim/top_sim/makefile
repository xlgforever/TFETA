
DUMP=NONE
MODE=NONE
#MODE=NORMAL
#MODE=DIRECT32
#MODE=SUPER
#MODE=MULTI_CORE
COMP=NONE
LOG1=VCS
LOG2=SIM
SUB_TEST=NONE
TRANS=NONE
#TRANS=TRANS
LOAD_BIN=NONE
#LOAD_BIN=LOAD_BIN
DEBUG=NONE
SMODE=MODE_32
TILE_MODEL=TILE_MODEL
SFU_MODEL=SFU_MODEL
LUT_MODE=VIT_LUT
#LUT_MODE=QWEN2_LUT


ifeq ($(DUMP) , DUMP)
ODEBUG=-debug_all
else
ODEBUG=
endif

ifeq ($(SMODE) , MODE_32)
	INS_FILE=ins_32.bin
else
	INS_FILE=ins_64.bin
endif

CPROFILE=-simprofile  time 
SIMPROFILE=-simprofile time

##MODE=MODE1
##MODE=MODE2
QUARTUS_INSTALL_DIR=/opt/intelFPGA_pro/19.1/quartus

VERDI_PATH = $(VERDI_HOME)


default: clean pic_bin vcs_run  grep 

pic_bin:
	python ./img2bin.py test.JPEG
vcs_run:
	cp $(INS_FILE) ins.bin
	echo "\`define  $(DUMP)       "  >   define.sv
	echo "\`define  $(SMODE)     "  >>  define.sv
	echo "\`define  $(MODE)       "  >>  define.sv
	echo "\`define  $(COMP)       "  >>  define.sv
	echo "\`define  $(LOG1)       "  >>  define.sv
	echo "\`define  $(LOG2)       "  >>  define.sv
	echo "\`define  $(SUB_TEST)       "  >>  define.sv
	echo "\`define  $(TRANS)       "  >>  define.sv
	echo "\`define  $(LOAD_BIN)       "  >>  define.sv
	echo "\`define  $(DEBUG)       "  >>  define.sv
	echo "\`define  $(TILE_MODEL) "  >>  define.sv	
	echo "\`define  $(SFU_MODEL) "  >>  define.sv	
	echo "\`define  $(LUT_MODE) "  >>  define.sv	
	vcs -fgp    -full64   -LDFLAGS -Wl,--no-as-needed -lca  -kdb  $(CPROFILE)  -timescale=1ns/1ps  -P  $(VERDI_PATH)/share/PLI/VCS/LINUX64/novas.tab  $(VERDI_PATH)/share/PLI/VCS/LINUX64/pli.a +vcs+lic+wait   -sverilog    -f tb.vc -top tb  $(ODEBUG)    -cm line+cond+fsm+tgl -cm_dir cov_result/my_cov_info_$(MODE)   -assert svaext  +lint=all,noVCDE,noNS     -l vcs_com.log
	./simv     $(SIMPROFILE)   -cm line+cond+fsm+tgl -cm_dir cov_result/my_cov_info_$(MODE)     -sv_lib systolic_arrayc_rtl  -sv_lib sfu_model -l vcs_sim_$(MODE).log
	#./simv -fgp=num_threads:16  -debug_all  -cm line+cond+fsm+tgl -cm_dir cov_result/my_cov_info_$(MODE)     -sv_lib systolic_arrayc_rtl  -l vcs_sim_$(MODE).log
	#profrpt simprofile_dir -view ALL -format ALL  -timeline ALL
	


clean:
	rm -rf simv* *.fsdb*  mac*  profileReport* sim*  
	rm -rf csrc*   *.vpd    
	rm -rf verdiLog  cov_result mac*   *.h    ucli.key  

clean_all:
	rm -rf simv* *.fsdb*  mac*  profileReport* sim*  
	rm -rf csrc*   *.vpd    
	rm -rf verdiLog  cov_result mac*   *.h    ucli.key  
	rm -rf *.bin  *.log  *.txt 



emacs:
	emacs   --batch   step_monitor.sv             -f verilog-auto     -f save-buffer 	
	emacs   --batch   rst_gen.v             -f verilog-auto     -f save-buffer 	
	emacs   --batch   clk_gen.v             -f verilog-auto     -f save-buffer 
	emacs   --batch   driver.sv             -f verilog-auto     -f save-buffer 
	emacs   --batch   net_cnt.sv             -f verilog-auto     -f save-buffer 
	emacs   --batch   tb.sv             -f verilog-auto     -f save-buffer 	
	./sedfile.sh


verdi_vc:
	##source /home/haorui/.bashrc_2015
	verdi -sv -f tb.vc &
verdi:
	verdi -elab simv.daidir/kdb &
	

com:
	echo "\`define  $(DUMP)       "  >   define.sv
	echo "\`define  $(MODE)       "  >>  define.sv
	mkdir -p ./altera_lib/func_lib/
	mkdir -p ./altera_lib/work/
	mkdir -p ./altera_lib/altera_fp_functions_171/
	mkdir -p ./altera_lib/float_add/
	mkdir -p ./altera_lib/float_mult_add/
	mkdir -p ./altera_lib/fix2float/
	mkdir -p ./altera_lib/top/
	mkdir -p ./altera_lib/altera_ver/
	mkdir -p ./altera_lib/lpm_ver/
	mkdir -p ./altera_lib/sgate_ver/
	mkdir -p ./altera_lib/altera_mf_ver/
	mkdir -p ./altera_lib/altera_lnsim_ver/
	mkdir -p ./altera_lib/twentynm_ver/
	mkdir -p ./altera_lib/twentynm_hssi_ver/
	mkdir -p ./altera_lib/twentynm_hip_ver/
	mkdir -p ./altera_lib/altera/
	mkdir -p ./altera_lib/lpm/
	mkdir -p ./altera_lib/sgate/
	mkdir -p ./altera_lib/altera_mf/
	mkdir -p ./altera_lib/altera_lnsim/
	mkdir -p ./altera_lib/twentynm/
	mkdir -p ./altera_lib/twentynm_hssi/
	mkdir -p ./altera_lib/twentynm_hip/
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_primitives.v"                   -work altera_ver       
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/220model.v"                            -work lpm_ver          
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/sgate.v"                               -work sgate_ver        
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf.v"                           -work altera_mf_ver    
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k -sverilog   "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_lnsim.sv"                       -work altera_lnsim_ver 
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_atoms.v"                      -work twentynm_ver     
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/synopsys/twentynm_atoms_ncrypt.v"      -work twentynm_ver     
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/synopsys/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi_ver
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_hssi_atoms.v"                 -work twentynm_hssi_ver
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/synopsys/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip_ver 
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_hip_atoms.v"                  -work twentynm_hip_ver 
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_syn_attributes.vhd"             -work altera           
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_standard_functions.vhd"         -work altera           
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/alt_dspbuilder_package.vhd"            -work altera           
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_europa_support_lib.vhd"         -work altera           
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_primitives_components.vhd"      -work altera           
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_primitives.vhd"                 -work altera           
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/220pack.vhd"                           -work lpm              
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/220model.vhd"                          -work lpm              
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/sgate_pack.vhd"                        -work sgate            
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/sgate.vhd"                             -work sgate            
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf_components.vhd"              -work altera_mf        
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf.vhd"                         -work altera_mf        
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k -sverilog   "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_lnsim.sv"                       -work altera_lnsim     
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_lnsim_components.vhd"           -work altera_lnsim     
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/synopsys/twentynm_atoms_ncrypt.v"      -work twentynm         
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_atoms.vhd"                    -work twentynm         
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_components.vhd"               -work twentynm         
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/synopsys/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi    
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_hssi_components.vhd"          -work twentynm_hssi    
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_hssi_atoms.vhd"               -work twentynm_hssi    
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k             "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/synopsys/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip     
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_hip_components.vhd"           -work twentynm_hip     
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb                  "$(QUARTUS_INSTALL_DIR)/eda/sim_lib/twentynm_hip_atoms.vhd"                -work twentynm_hip     
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb  -xlrm "../../fpga/ip/intel/float_mult_add/altera_fp_functions_171/sim/dspba_library_package.vhd" -work func_lib
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb  -xlrm "../../fpga/ip/intel/float_mult_add/altera_fp_functions_171/sim/dspba_library.vhd" -work func_lib
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb  -xlrm "../../fpga/ip/intel/float_mult_add/altera_fp_functions_171/sim/float_mult_add_altera_fp_functions_171_3ghd5ia.vhd" -work func_lib
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb  -xlrm "../../fpga/ip/intel/fix2float/altera_fp_functions_171/sim/fix2float_altera_fp_functions_171_fiqck7i.vhd" -work func_lib
	vhdlan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb  -xlrm "../../fpga/ip/intel/float_add/altera_fp_functions_171/sim/float_add_altera_fp_functions_171_4ttgs2a.vhd" -work func_lib
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k  "../../fpga/ip/intel/float_add/synth/float_add.v"     -work float_add
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k  "../../fpga/ip/intel/fix2float/synth/fix2float.v"     -work fix2float
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -kdb +v2k  "../../fpga/ip/intel/float_mult_add/synth/float_mult_add.v"     -work float_mult_add
	vlogan -full64   -LDFLAGS -Wl,--no-as-needed  -override_timescale=1ns/1ps   -kdb +v2k   -f tb.vc    -work top	
vcs_mix_run:
	vcs -full64   -LDFLAGS -Wl,--no-as-needed -kdb -lca -timescale=1ns/1ps   -P  $(VERDI_PATH)/share/PLI/VCS/LINUX64/novas.tab   $(VERDI_PATH)/share/PLI/VCS/LINUX64/pli.a        +vcs+lic+wait      -debug_all   -top tb     -l vcs_com.log
##	vcs -lca -timescale=1ns/1ps  -P  /tools/novas/Novas201101/share/PLI/VCS/LINUX/novas.tab   /tools/novas/Novas201101/share/PLI/VCS/LINUX/pli.a +vcs+lic+wait      -debug_all   -top tb    -cm line+cond+fsm+tgl -cm_dir cov_result/my_cov_info_$(MODE)    -l vcs_com.log
	./simv -debug_all    -cm line+cond+fsm+tgl -cm_dir cov_result/my_cov_info_$(MODE)      -l vcs_sim_$(MODE).log 
##	urg -dir     cov_result/my_cov_info_$(MODE)    -metric line+cond+fsm+tgl -report cov_report/report_$(MODE)   -format both
##	mv fpga_output.txt  fpga_output_$(MODE).txt
	
new:
	../../../Code/mac/model/Berkeley_softfloat/systolic_array


gen_risc_vc:
	rm -rf tb.vc MNNU_top.f piu.f piu_bf16.f  define.sv
	echo "\`define ${CHIP_CASE}" > define.sv
	echo "\`define ${SILENT_MODE}" >> define.sv
	echo "./define.v" > tb.vc
	echo "./sim_define.v" >> tb.vc
	echo "+incdir+./psram" >> tb.vc 
	echo "+incdir+../../DEVICE/W25Q16JWxxIM_V1.0_VCS" >> tb.vc 
	cat ../../../rtl/top/top.f | sed -e 's/\.\.\/NNU/..\/..\/..\/rtl\/NNU/g'    \
									-e 's/\.\.\/VPROC/..\/..\/..\/rtl\/VPROC/g' \
									-e 's/\.\.\/APROC/..\/..\/..\/rtl\/APROC/g' \
									-e 's/\.\.\/sram/..\/..\/..\/rtl\/sram/g' \
									 -e 's/\.\.\/MISC/..\/..\/..\/rtl\/MISC/g'   \
									 -e 's/\.\.\/MODEL/..\/..\/..\/rtl\/MODEL/g' \
									 -e 's/..\/CPU/..\/..\/..\/rtl\/CPU/g'       \
									 -e 's/\.\.\/include/..\/..\/..\/rtl\/include/g' \
									 -e 's/\.\.\/top/..\/..\/..\/rtl\/top/g'         \
									 -e 's/\.\.\/sram/..\/..\/..\/rtl\/sram/g'         \
									 -e 's/riscv_core_module/riscv_core/g'           \
									 -e 's/..\/i2c\/i2c_slave.v/..\/..\/..\/rtl\/i2c\/i2c_slave.v/g' \
									 -e 's/\.\.\/NE004_backend/..\/..\/NE004_backend/g' \
									 -e 's/\.\.\/PIU/..\/..\/..\/rtl\/PIU/g'>> tb.vc 
	cat ../../../rtl/top/MNNU_top.f | sed -e 's/\.\.\/NNU/..\/..\/..\/rtl\/NNU/g' > ./MNNU_top.f
	echo "+incdir+../../../rtl/PIU/include" > piu.f
	cat ../../../rtl/top/piu.f | sed -e 's/..\/PIU/..\/..\/..\/rtl\/PIU/g' >> piu.f
	cat ../../../rtl/top/piu_bf16.f | sed -e 's/..\/PIU_bf16/..\/..\/..\/rtl\/PIU_bf16/g' > piu_bf16.f
	echo "../../../rtl/MODEL/bytewrite_tdp_ram_nc.v" >> tb.vc
	cat ./device.fl >> tb.vc
	sed -i '/glb_def/d' tb.vc 
	cat ./mytb.vc >> tb.vc 

# https://github.com/chipsalliance/verible/releases
format:
	 find ./      -name "*.v"  | xargs -n1  verible-verilog-format  --inplace  
	 find ./      -name "*.sv"  | xargs -n1  verible-verilog-format  --inplace  



grep:
	grep decode vcs_sim*.log
	grep Sim_ vcs_sim*.log
	./extract_char.sh vcs_sim_NONE.log max5

