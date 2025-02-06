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

int main(){
	int start = -100;
	int end = 100;
	int case_num = 100000;
	int ret = 1;
	int no_ret = 0;
	int no_space = 2;
	float16_t a[case_num], b[case_num], c[case_num];
	srand((unsigned)time(NULL));//use the timestamp as seed
	for(int i=0; i<case_num; i++){
		a[i] = my_random_float(start, end);
		b[i] = my_random_float(start, end);
		if(f16_le(a[i],b[i])){//if a <= b
			c[i] = b[i];
		} else {
			c[i] = a[i];
		}
	}
	FILE *fp_ab = fopen("ab.txt", "w");
	FILE *fp_c = fopen("c.txt", "w");
	for(int i=0; i<case_num; i++){
		my_fp16_print_to_file(fp_ab, a[i], no_ret);
		my_fp16_print_to_file(fp_ab, b[i], ret);
		my_fp16_print_to_file(fp_c, c[i], ret);
	}
	fclose(fp_ab);
	fclose(fp_c);
	return 0;
}


