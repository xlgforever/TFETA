#include <stdio.h>
#include <stdlib.h>
#include "softfloat.h"

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

double ***matrixmul(double **A, double **B, double **C, int M, int N, int H, int transpose_en)
{
    float16_t tem;
    double ***E = (double ***)malloc(2*sizeof(double **));

    E[0] = (double **)malloc(M*sizeof(double *));   // E[0] = A*B + C
    for(int i=0; i<M; i++){
        E[0][i] = (double *)malloc(N*sizeof(double));  
    }

    E[1] = (double **)malloc(N*sizeof(double *));    // transpose of E[0]
    for(int i=0; i<N; i++){
        E[1][i] = (double *)malloc(M*sizeof(double));
    }
 
    for(int m=0; m<M; m++)
    {
        for(int n=0; n<N; n++)
        {
            for(int h=0; h<H; h++)
            {
                if(h==0)
                {
                    E[0][m][n] = A[m][h] * B[h][n] + C[m][n];
                }
                else
                {
                    E[0][m][n] = A[m][h] * B[h][n] + my_fp16_to_fp64(tem);
                }
                if(h<H-1)
                {
                    tem = my_fp64_to_fp16(E[0][m][n]);
                }
            }
            if(transpose_en == 1){
                E[1][n][m] = E[0][m][n];
            }
        }
    }
    return E;
}

int main(){

    double **A = (double **)malloc(3*sizeof(double *));
    double **B = (double **)malloc(3*sizeof(double *));
    double **C = (double **)malloc(3*sizeof(double *));
    double ***E = (double ***)malloc(2*sizeof(double **));
   

    for(int i=0; i<3; i++){
        A[i] = (double *)malloc(3*sizeof(double));
        B[i] = (double *)malloc(3*sizeof(double));
        C[i] = (double *)malloc(3*sizeof(double));
    }

    E[0] = (double **)malloc(3*sizeof(double *));
    E[1] = (double **)malloc(3*sizeof(double *));

    for(int i=0; i<3; i++){

        E[0][i] = (double *)malloc(3*sizeof(double));

        E[1][i] = (double *)malloc(3*sizeof(double));
    }

    for(int i=0; i<3; i++){
        for(int j=0; j<3; j++){
            A[i][j] = i+j;
            B[i][j] = i+j;
            C[i][j] = i+j;
        }
    }

    E = matrixmul(A, B, C, 3, 3, 3, 0);

    for(int i=0; i<3; i++){
        for(int j=0; j<3; j++){
            printf("%f ", A[i][j]);
            printf("%f ", B[i][j]);
            printf("%f ", C[i][j]);
            printf("%f ", E[0][i][j]);
            printf("%f ", E[1][i][j]);
        }
        printf("\n");
    }

    return 0;
}