//`define SMALL_BOARD

`define VCS

`define INS_PREFIX 8'h5a

`define REPEAT2_DMA_TYPE 4'hc
`define REPEAT1_DMA_TYPE 4'hb
`define REPEAT0_DMA_TYPE 4'ha
`define DMA_TYPE 4'h9
`define WCFG_TYPE 4'h8
`define RCFG_TYPE 4'h7
`define REPEAT_TYPE 4'h6
`define DONE_TYPE 4'hF
`define PRINTF_TYPE 4'h5
`define PRINTF_REG_TYPE 4'h4
`define BEGIN_TYPE 4'h3

`define EQ 4'h0
`define GR 4'h1
`define GR_EQ 4'h2
`define SM 4'h3
`define SM_EQ 4'h4

`define RDMA0 4'h0
`define RDMA1 4'h1
`define RDMA2 4'h2
`define RDMA3 4'h3
`define RDMA4 4'h4
`define RDMA5 4'h5

`define WDMA0 4'h8
`define WDMA1 4'h9
`define WDMA2 4'ha
`define WDMA3 4'hb
`define WDMA4 4'hc
`define WDMA5 4'hd

`define CDMA0 4'hE
`define CDMA1 4'hF

`define CDMA0_LADDR {12'd0,8'h01,12'h000}  
`define CDMA0_HADDR {12'd0,8'h01,12'h001}  
`define CDMA0_DALEN {12'd0,8'h01,12'h002}  
`define CDMA0_LILEN {12'd0,8'h01,12'h003}  
`define CDMA0_SBLEN {12'd0,8'h01,12'h004}  
`define CDMA0_TYPE {12'd0,8'h01,12'h005}  
`define CDMA0_MAXB {12'd0,8'h01,12'h006}  
`define CDMA0_START {12'd0,8'h01,12'h00c}

`define CDMA1_LADDR {12'd0,8'h01,12'h007}  
`define CDMA1_HADDR {12'd0,8'h01,12'h008}  
`define CDMA1_DALEN {12'd0,8'h01,12'h002}  
`define CDMA1_LILEN {12'd0,8'h01,12'h009}  
`define CDMA1_SBLEN {12'd0,8'h01,12'h00a}  
`define CDMA1_TYPE {12'd0,8'h01,12'h005}  
`define CDMA1_MAXB {12'd0,8'h01,12'h00b}  
`define CDMA1_START {12'd0,8'h01,12'h00c}

`define RDMA0_LADDR {12'd0,8'h01,12'h00d}  
`define RDMA0_HADDR {12'd0,8'h01,12'h00e}  
`define RDMA0_DALEN {12'd0,8'h01,12'h00f}  
`define RDMA0_LILEN {12'd0,8'h01,12'h010}  
`define RDMA0_SBLEN {12'd0,8'h01,12'h011}  
`define RDMA0_TYPE {12'd0,8'h01,12'h012}  
`define RDMA0_MAXB {12'd0,8'h01,12'h013}  
`define RDMA0_START {12'd0,8'h01,12'h014}

`define WDMA0_LADDR {12'd0,8'h01,12'h015}  
`define WDMA0_HADDR {12'd0,8'h01,12'h016}  
`define WDMA0_DALEN {12'd0,8'h01,12'h017}  
`define WDMA0_LILEN {12'd0,8'h01,12'h018}  
`define WDMA0_SBLEN {12'd0,8'h01,12'h019}  
`define WDMA0_TYPE {12'd0,8'h01,12'h01a}  
`define WDMA0_MAXB {12'd0,8'h01,12'h01b}  
`define WDMA0_START {12'd0,8'h01,12'h01d}

`define RDMA1_LADDR {12'd0,8'h01,12'h01e}  
`define RDMA1_HADDR {12'd0,8'h01,12'h01f}  
`define RDMA1_DALEN {12'd0,8'h01,12'h020}  
`define RDMA1_LILEN {12'd0,8'h01,12'h021}  
`define RDMA1_SBLEN {12'd0,8'h01,12'h022}  
`define RDMA1_TYPE {12'd0,8'h01,12'h023}  
`define RDMA1_MAXB {12'd0,8'h01,12'h024}  
`define RDMA1_START {12'd0,8'h01,12'h025}

`define WDMA1_LADDR {12'd0,8'h01,12'h026}  
`define WDMA1_HADDR {12'd0,8'h01,12'h027}  
`define WDMA1_DALEN {12'd0,8'h01,12'h028}  
`define WDMA1_LILEN {12'd0,8'h01,12'h029}  
`define WDMA1_SBLEN {12'd0,8'h01,12'h02a}  
`define WDMA1_TYPE {12'd0,8'h01,12'h02b}  
`define WDMA1_MAXB {12'd0,8'h01,12'h02c}  
`define WDMA1_START {12'd0,8'h01,12'h02e}

`define RDMA2_LADDR {12'd0,8'h01,12'h02f}  
`define RDMA2_HADDR {12'd0,8'h01,12'h030}  
`define RDMA2_DALEN {12'd0,8'h01,12'h031}  
`define RDMA2_LILEN {12'd0,8'h01,12'h032}  
`define RDMA2_SBLEN {12'd0,8'h01,12'h033}  
`define RDMA2_TYPE {12'd0,8'h01,12'h034}  
`define RDMA2_MAXB {12'd0,8'h01,12'h035}  
`define RDMA2_START {12'd0,8'h01,12'h036}
`define WDMA2_LADDR {12'd0,8'h01,12'h037}  
`define WDMA2_HADDR {12'd0,8'h01,12'h038}  
`define WDMA2_DALEN {12'd0,8'h01,12'h039}  
`define WDMA2_LILEN {12'd0,8'h01,12'h03a}  
`define WDMA2_SBLEN {12'd0,8'h01,12'h03b}  
`define WDMA2_TYPE {12'd0,8'h01,12'h03c}  
`define WDMA2_MAXB {12'd0,8'h01,12'h03d}  
`define WDMA2_START {12'd0,8'h01,12'h03f}

`define RDMA3_LADDR {12'd0,8'h01,12'h040}  
`define RDMA3_HADDR {12'd0,8'h01,12'h041}  
`define RDMA3_DALEN {12'd0,8'h01,12'h042}  
`define RDMA3_LILEN {12'd0,8'h01,12'h043}  
`define RDMA3_SBLEN {12'd0,8'h01,12'h044}  
`define RDMA3_TYPE {12'd0,8'h01,12'h045}  
`define RDMA3_MAXB {12'd0,8'h01,12'h046}  
`define RDMA3_START {12'd0,8'h01,12'h047}
`define WDMA3_LADDR {12'd0,8'h01,12'h048}  
`define WDMA3_HADDR {12'd0,8'h01,12'h049}  
`define WDMA3_DALEN {12'd0,8'h01,12'h04a}  
`define WDMA3_LILEN {12'd0,8'h01,12'h04b}  
`define WDMA3_SBLEN {12'd0,8'h01,12'h04c}  
`define WDMA3_TYPE {12'd0,8'h01,12'h04d}  
`define WDMA3_MAXB {12'd0,8'h01,12'h04e}  
`define WDMA3_START {12'd0,8'h01,12'h050}

`define RDMA4_LADDR {12'd0,8'h01,12'h051}  
`define RDMA4_HADDR {12'd0,8'h01,12'h052}  
`define RDMA4_DALEN {12'd0,8'h01,12'h053}  
`define RDMA4_LILEN {12'd0,8'h01,12'h054}  
`define RDMA4_SBLEN {12'd0,8'h01,12'h055}  
`define RDMA4_TYPE {12'd0,8'h01,12'h056}  
`define RDMA4_MAXB {12'd0,8'h01,12'h057}  
`define RDMA4_START {12'd0,8'h01,12'h058}
`define WDMA4_LADDR {12'd0,8'h01,12'h059}  
`define WDMA4_HADDR {12'd0,8'h01,12'h05a}  
`define WDMA4_DALEN {12'd0,8'h01,12'h05b}  
`define WDMA4_LILEN {12'd0,8'h01,12'h05c}  
`define WDMA4_SBLEN {12'd0,8'h01,12'h05d}  
`define WDMA4_TYPE {12'd0,8'h01,12'h05e}  
`define WDMA4_MAXB {12'd0,8'h01,12'h05f}  
`define WDMA4_START {12'd0,8'h01,12'h061}

`define RDMA5_LADDR {12'd0,8'h01,12'h070}  
`define RDMA5_HADDR {12'd0,8'h01,12'h071}  
`define RDMA5_DALEN {12'd0,8'h01,12'h072}  
`define RDMA5_LILEN {12'd0,8'h01,12'h073}  
`define RDMA5_SBLEN {12'd0,8'h01,12'h074}  
`define RDMA5_TYPE {12'd0,8'h01,12'h075}  
`define RDMA5_MAXB {12'd0,8'h01,12'h076}  
`define RDMA5_START {12'd0,8'h01,12'h077}
`define WDMA5_LADDR {12'd0,8'h01,12'h078}  
`define WDMA5_HADDR {12'd0,8'h01,12'h079}  
`define WDMA5_DALEN {12'd0,8'h01,12'h07a}  
`define WDMA5_LILEN {12'd0,8'h01,12'h07b}  
`define WDMA5_SBLEN {12'd0,8'h01,12'h07c}  
`define WDMA5_TYPE {12'd0,8'h01,12'h07d}  
`define WDMA5_MAXB {12'd0,8'h01,12'h07e}  
`define WDMA5_START {12'd0,8'h01,12'h080}

`define RDMA0_DONE {12'd0,8'h01,12'h062}
`define RDMA1_DONE {12'd0,8'h01,12'h063}
`define RDMA2_DONE {12'd0,8'h01,12'h064}
`define RDMA3_DONE {12'd0,8'h01,12'h065}
`define RDMA4_DONE {12'd0,8'h01,12'h066}
`define WDMA0_DONE {12'd0,8'h01,12'h067}
`define WDMA1_DONE {12'd0,8'h01,12'h068}
`define WDMA2_DONE {12'd0,8'h01,12'h069}
`define WDMA3_DONE {12'd0,8'h01,12'h06a}
`define WDMA4_DONE {12'd0,8'h01,12'h06b}
`define CDMA_DONE {12'd0,8'h01,12'h06c}

`define RDMA5_DONE {12'd0,8'h01,12'h06d}
`define WDMA5_DONE {12'd0,8'h01,12'h06e}

`define SMA_SRAM0_READY {12'd0,8'h02,12'h005}
`define SMA_SRAM1_READY {12'd0,8'h02,12'h006}

`define SFU_SRAM0_READY {12'd0,8'h03,12'h008}
`define SFU_SRAM1_READY {12'd0,8'h03,12'h009}

`define SMA_WSTART {12'd0,8'h02,12'h003}
`define SMA_RSTART {12'd0,8'h02,12'h002}

`define SFU_WSTART {12'd0,8'h03,12'h006}
`define SFU_RSTART {12'd0,8'h03,12'h004}

`define SFU_SF_MAX_MODE 1
`define SFU_SF_DIV_MODE 2
`define SFU_SF_RES_MODE 3
`define SFU_LN_MEAN_MODE 4
`define SFU_LN_INV_STD_MODE 5
`define SFU_LN_RES_MODE 6
`define SFU_MATRIX_ADD_MODE 7
`define SFU_SF_ALL_MODE 8
`define SFU_LN_ALL_MODE 9
`define SFU_GELU_MODE 10
`define SFU_VEC_MATRIX_ADD_MODE 11
`define SFU_SCALAR_MATRIX_ADD_MODE 12
`define SFU_MATRIX_MULT_MODE 13
`define SFU_VEC_MATRIX_MULT_ACC_MODE 14
`define SFU_SCALAR_MATRIX_MULT_MODE 15

`define SFU_MASK_VALUE 16'hfc00

`define DCNT_ADDR 'h001e


