#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "softfloat.h"


float16_t my_fp32_to_fp16(float in){
	float32_t *in_f32 = (float32_t*)&in;
	return f32_to_f16(in_f32[0]);
}

void my_fp16_print(float16_t a){
	uint16_t* p = (uint16_t*)&a;
	printf("%x\n", p[0]);
}

void my_fp16_print_to_file(FILE *fp, float16_t a, int mode){
	uint16_t* p = (uint16_t*)&a;
	if(mode==0)
		fprintf(fp, "%04x ", p[0]);
	else if (mode==1)
	{
		fprintf(fp, "%04x\n", p[0]);
	}
	else if (mode==2)
	{
		fprintf(fp, "%04x", p[0]);
	}
}

float16_t my_random_float(int start, int end){
	float tmp = (float)start + ((float)rand())/((float)(RAND_MAX/(end-start)));
	return my_fp32_to_fp16(tmp);
}

// generate the fp16 number with int value
float16_t my_random_int(int start, int end){
	float tmp = (float)start + (float)((int)(((float)rand()) / ((float)(RAND_MAX/(end-start)))));
	return my_fp32_to_fp16(tmp);
}

float16_t my_mac(float16_t a, float16_t b, float16_t c){
    float16_t tmp = f16_mul(a,b);
    return f16_add(tmp,c);
}

//program for test tile.sv
int main(){
	int start = -10;
	int end = 10;
	int case_num = 32;
	int ret = 1;
	int no_ret = 0;// no return with space
	int no_space = 2;// no return with no space
    
    int matrix_rows = 32;
    int matrix_columns = 32;
    float16_t tmp;
	float16_t a[matrix_rows][matrix_columns], b[matrix_rows][matrix_columns],  c[matrix_rows][matrix_columns], result[matrix_rows][matrix_columns];
    FILE *fp_a;
    FILE *fp_b;
    FILE *fp_c;
    FILE *fp_result;

	srand((unsigned)time(NULL));//use the timestamp as seed
for( int cs=0; cs<case_num;cs++){
    // initial the a b c matrix
	for(int i=0; i<matrix_rows; i++){
        for(int j=0; j<matrix_columns; j++){
		a[i][j] = my_random_int(start, end);
		b[i][j] = my_random_int(start, end);
        c[i][j] = my_random_int(start, end);
        }
	}
    float16_t tmp2, tmp3, tmp4;
    //cal the result matrix without bias matrix c
    for (int i=0; i<matrix_rows;i++){
        for(int j=0; j<matrix_columns;j++){
            tmp2 = my_fp32_to_fp16(0.0f);
            for (int k=0; k<matrix_rows; k++){
                tmp2 = f16_add(f16_mul(a[i][k], b[k][j]), tmp2);
            }
            tmp2 = f16_add(tmp2, c[i][j]);
            result[i][j] = tmp2;

        }
    }
    if(cs==0){
	    fp_a = fopen("A.txt", "w");
	    fp_b = fopen("B.txt", "w");
	    fp_c = fopen("C.txt", "w");
        fp_result = fopen("D.txt","w");
    }
    else {
        fp_a = fopen("A.txt", "a");
	    fp_b = fopen("B.txt", "a");
	    fp_c = fopen("C.txt", "a");
        fp_result = fopen("D.txt","a"); 
    }
	for(int i=0; i<matrix_rows; i++){
	    for(int j=0; j<matrix_columns; j++){
            if(j!=matrix_columns-1){
		        my_fp16_print_to_file(fp_a, a[i][j], ret);
		        my_fp16_print_to_file(fp_b, b[i][j], ret);
		        my_fp16_print_to_file(fp_c, c[i][j], ret);
		        my_fp16_print_to_file(fp_result, result[i][j], ret);
            }else{
                my_fp16_print_to_file(fp_a, a[i][j], ret);
		        my_fp16_print_to_file(fp_b, b[i][j], ret);
		        my_fp16_print_to_file(fp_c, c[i][j], ret);
		        my_fp16_print_to_file(fp_result, result[i][j], ret);  
            }
        }
        
	}
	fclose(fp_a);
	fclose(fp_b);
	fclose(fp_c);
	fclose(fp_result);
}
	return 0;
}


