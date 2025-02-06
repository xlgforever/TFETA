#include <stdlib.h>
#include "softfloat.h"
#include "svdpi.h"
//#include "/home/xlg/Synopsys2018/vcs-mx/O-2018.09-SP2/include/veriuser.h"

float16_t my_fp64_to_fp16(double in)
{
    float64_t *in_f64 = (float64_t*)&in;
    return f64_to_f16(in_f64[0]);
}

double my_fp16_to_fp64(float16_t in)
{
    float64_t in_f64 = f16_to_f64(in);
    double *out = (double*)&in_f64;
    return out[0];
}

/*
change the type of element in svOpenArrayHandle to double
*/
void openArrToDouble(const svOpenArrayHandle oah, int len, double* ret){
    float16_t* tmp;
    //io_printf("openArrToDouble: len is %d \n", len);
    for(int i=0;i<len;i++){
        tmp = (float16_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
            io_printf("openArrToDouble: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
            exit(0);
        }
        ret[i] = my_fp16_to_fp64(*tmp);
    }
}

/*
change the type of double to element type in svOpenArrayHandle
*/
void doubleToOpenArr(double* input, int len, svOpenArrayHandle oah){
    float16_t* tmp;
    for(int i=0;i<len;i++){
        tmp = (float16_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
            io_printf("doubleToOpenArr: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
            exit(0);
        }
        *tmp = my_fp64_to_fp16(*input);
        input++;
    }
}

/*
in DPI-C, we better use svOpenArrayHandle as the any array in C; 
for "int", it is the same in DPI-C and C;
the "const" usually means that the arg is input, otherwise it is usually output
*/
// A * B + C
// M: the NumRows of A, eg. the NumRows of E(result)
// N: the NumCols of B, eg. the NumCols of E(result)
// H: the NumCols of A or the NumRows of B
void matrixmul4(const svOpenArrayHandle oahA, const svOpenArrayHandle oahB, const svOpenArrayHandle oahC, svOpenArrayHandle oahE,
                svOpenArrayHandle oahE_transpose, const int M, const int N, const int H, const int transpose_en ){
	double *A = (double *)malloc(M * H * sizeof(double));
	double *B = (double *)malloc(H * N * sizeof(double));
	double *C = (double *)malloc(M * N * sizeof(double));

	double *E = (double *)malloc(M * N * sizeof(double));
    double *E_transpose = (double *)malloc(N * M * sizeof(double));

	// get the data from systemVerilog
	openArrToDouble(oahA, M*H, A);
	openArrToDouble(oahB, H*N, B);
	openArrToDouble(oahC, M*N, C);
	float16_t tem;
    for(int m=0; m<M; m++)
    {
        for(int n=0; n<N; n++)
        {
            for(int h=0; h<H; h++)
            {
                if(h==0)
                {
                    E[m*N + n] = A[m*H + h] * B[h*N + n] + C[m*N + n];
                }
                else
                {
                    E[m*N + n] = A[m*H + h] * B[h*N + n] + my_fp16_to_fp64(tem);
                }
                if(h<H-1)
                {
                    tem = my_fp64_to_fp16(E[m*N + n]);
                }
            }
            if(transpose_en==1){
                E_transpose[n*M + m] = E[m*N + n];
            }else{
                E_transpose[n*M + m] = 0.0;
            }
        }
    }

	// write the data to systemVerilog
	doubleToOpenArr(E, M*N, oahE);
    doubleToOpenArr(E_transpose, N*M, oahE_transpose);
}

// 
