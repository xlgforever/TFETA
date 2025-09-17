1. Environment Setup
- If you want to run RTL Simulation in `main/sim/top_sim`, you must install **Synopsys VCS/Verdi** in your PC, and set the `VERDI_HOME` in your environment(for example, `export VERDI_HOME=/home/<username>/Synopsys2018/verdi/Verdi_O-2018.09-SP2`),and the memory size of PC should be **64GB** at least.
- Python Version: 3.10.12
- Python package:(Maybe you should use conda to create a new env)
    - Cython==3.0.11
    - numpy==2.1.3
    - Pillow==10.1.0
    - setuptools==68.2.2
    - timm==1.0.11
    - torch==2.4.0
2. Library Comp
- run `make` in `main` directory, to build library files used in simulations. In general, we use the C lib for accelerating the RTL simlulations.

3. FPGA Bitstream Comp
- make sure that you have installed the Vivado and add it to your $PATH. (We use 2022.2/2020.2 Version)
- `cp ./main/fpga/fpgaf37x_board <path_to_vivado>/data/boards/board_files -r` to install the borad files of Inspur F37X to Vivado
- run `make fpga_1core_250m` in `main` directory

4. Simulation
- Parameters and Instructions Bin File: You could Download model parameters and instrucitons program for ViT-B/16 at [Google Drive](https://drive.google.com/drive/folders/1jfPl2ttvgjvrhdxsx1s15K3HWwd-hw99?usp=sharing)
    - To simulate, **copy the corresponding BIN files of the models to `top_sim` directory**
    - `vit-32.zip` include the bin file used for 32\*32 systolic array
    - `vit-64.zip` include the bin file used for 64\*64 systolic array
- `cd ./main/sim/top_sim`
- Simulation using the default "cock" picture at 32\*32 systolic array: `make`
- Simulation using the default "cock" picutre at 64\*64 systolic array: `make SMODE=MODE_64`
- Simulation using the custom picture at 32\*32 systolic array (For the first time, it will take some time to download the model files from timm):
  - `make pic_bin TEST_IMG=<path_to_pic>`
  - `make `
- Simulation using the custom picture at 64\*64 systolic array:
  - `make pic_bin TEST_IMG=<path_to_pic> SMODE=MODE_64`
  - `make SMODE=MODE_64`
