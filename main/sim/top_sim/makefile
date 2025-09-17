
DUMP=NONE
MODE=NONE
COMP=NONE
LOG1=VCS
LOG2=SIM
SUB_TEST=NONE
TRANS=NONE
LOAD_BIN=NONE
DEBUG=NONE
SMODE=MODE_32
TILE_MODEL=TILE_MODEL
SFU_MODEL=SFU_MODEL
LUT_MODE=VIT_LUT
TEST_IMG ?= test.JPEG


ifeq ($(DUMP) , DUMP)
ODEBUG=-debug_all
else
ODEBUG=
endif

ifeq ($(SMODE) , MODE_32)
	INS_FILE=ins_32.bin
	TILE_SIZE=32
else
	INS_FILE=ins_64.bin
	TILE_SIZE=64
endif

CPROFILE=-simprofile  time 
SIMPROFILE=-simprofile time


VERDI_PATH = $(VERDI_HOME)


default: clean vcs_run  grep 

pic_bin:
	python ./img2bin.py $(TEST_IMG) $(TILE_SIZE)
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
	


clean:
	rm -rf simv* *.fsdb*  mac*  profileReport* sim*  
	rm -rf csrc*   *.vpd    
	rm -rf verdiLog  cov_result mac*   *.h    ucli.key  

clean_all:
	rm -rf simv* *.fsdb*  mac*  profileReport* sim*  
	rm -rf csrc*   *.vpd    
	rm -rf verdiLog  cov_result mac*   *.h    ucli.key  
	rm -rf *.bin  *.log  *.txt 




verdi_vc:
	##source /home/haorui/.bashrc_2015
	verdi -sv -f tb.vc &
verdi:
	verdi -elab simv.daidir/kdb &
	
grep:
	grep decode vcs_sim*.log
	grep Sim_ vcs_sim*.log
	./extract_char.sh vcs_sim_NONE.log max5

