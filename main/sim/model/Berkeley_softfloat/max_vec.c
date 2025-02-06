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
		fprintf(fp, "%x ", p[0]);
	else if (mode==1)
	{
		fprintf(fp, "%x\n", p[0]);
	}
	else if (mode==2)
	{
		fprintf(fp, "%x", p[0]);
	}
}

float16_t my_random_float(int start, int end){
	float tmp = (float)start + ((float)rand())/((float)(RAND_MAX/(end-start)));
	return my_fp32_to_fp16(tmp);
}

int main(int argc, char *argv[]){
    if (argc != 3) {
        printf("Error, please input the number of whole lines and the number of sub_lines");
        return 1;
    }
	int start = -100;
	int end = 100;
	int case_num = atoi(argv[1]);
	int ret = 1;
	int no_ret = 0;
	int no_space = 2;
    int row_element = 32*atoi(argv[2]);
	float16_t a[case_num][row_element], b[case_num][row_element], c[case_num];
    for(int i=0;i<case_num;i++){
        c[i] = my_fp32_to_fp16(0.0f);
    }
	srand((unsigned)time(NULL));//use the timestamp as seed
	for(int i=0; i<case_num; i++){
        for(int j=0;j<row_element;j++){
		    a[i][j] = my_random_float(start, end);
		    //b[i][j] = my_random_float(start, end);
		    if(f16_le(c[i], a[i][j])){//if arg1 <= arg2
			    c[i] = a[i][j];
		    }
        }
	}
	FILE *fp_a = fopen("a.txt", "w");
	FILE *fp_c = fopen("c.txt", "w");
	for(int i=0; i<case_num; i++){
		my_fp16_print_to_file(fp_c, c[i], ret);
        for(int j=0; j< row_element; j++){
		    my_fp16_print_to_file(fp_a, a[i][j], ret);
		    //my_fp16_print_to_file(fp_a, b[i], ret);
        }
	}
	fclose(fp_a);
	fclose(fp_c);
	return 0;
}


