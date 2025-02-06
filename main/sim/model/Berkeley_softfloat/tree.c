#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "softfloat.h"


float16_t my_fp32_to_fp16(float in){
	float32_t *in_f32 = (float32_t*)&in;
	return f32_to_f16(in_f32[0]);
}

void my_fp16_print(float16_t a, uint32_t mode){
	uint16_t* p = (uint16_t*)&a;
	printf("%x", p[0]);
	if(mode==0)
		printf(" ");
	else if (mode==1)
	{
		printf("\n");
	}
	else if (mode==2)
	{
		printf("");
	}
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

float16_t my_random_fp16(int start, int end){
	float tmp = (float)start + ((float)rand())/((float)(RAND_MAX/(end-start)));
	return my_fp32_to_fp16(tmp);
}

float my_random_fp32(int start, int end){
	float tmp = (float)start + ((float)rand())/((float)(RAND_MAX/(end-start)));
	return tmp;
}

float16_t fp16_add_tree(float16_t in[], uint32_t start, uint32_t end){
	if(start==end){
		return in[start];
	}
	int mid = (start+end)/2;
	float16_t leftsum = fp16_add_tree(in, start, mid);
	float16_t rightsum = fp16_add_tree(in, mid+1, end);
	float16_t tmp_sum = f16_add(leftsum, rightsum);
	return tmp_sum;
}

float16_t fp16_add_normal(float16_t in[], uint32_t start, uint32_t end){
	for(int i=start+1; i<=end; i++){
		in[start] = f16_add(in[start], in[i]);
	}
	return in[start];
}

void fp16_add_once(float16_t in[], uint32_t in_len, float16_t out[], uint32_t out_len){
	if(in_len!=(out_len*2)){
		printf("in_len != out_len, error\n");
		return;
	}
	for(int i=0; i<=out_len; i++){
		out[i] = f16_add(in[2*i], in[2*i+1]);
	}
	return;
}


float fp32_add_normal(float in[], uint32_t start, uint32_t end){
	for(int i=start+1; i<=end; i++){
		in[start] = in[start] + in[i];
	}
	return in[start];
}

float fp32_add_tree(float in[], uint32_t start, uint32_t end){
	if(start==end){
		return in[start];
	}
	int mid = (start+end)/2;
	float leftsum = fp32_add_tree(in, start, mid);
	float rightsum = fp32_add_tree(in, mid+1, end);
	//printf("%.2f %.2f ",leftsum, rightsum);
	float tmp_sum = leftsum + rightsum;
	return tmp_sum;
}

void fp32_add_once(float in[], uint32_t in_len, float out[], uint32_t out_len){
	if(in_len!=(out_len*2)){
		printf("in_len != out_len, error\n");
		return;
	}
	for(int i=0; i<=out_len; i++){
		out[i] = in[2*i] + in[2*i+1];
	}
	return;
}

//
float16_t fp16_add_tree2(float16_t* in, uint32_t len){
	uint32_t tmp_len;
	if(len>1){
		tmp_len = len/2;
	} else {
		tmp_len = 1;
	}
	float16_t tmp_in[tmp_len];
	if(len==1){
		return in[0];
	}else{
		for(uint32_t i=0;i<tmp_len;i++){
			tmp_in[i] = f16_add(in[i],in[len-1-i]);//输入数组的第一个数与最后一个数相加、第二个数与倒数第二个数相加，……，与硬件行为保持一致
			if(2*i+1>=len){
				printf("len error\n");
			}
		}
		fp16_add_tree2(tmp_in,tmp_len);
	}
}

float fp32_add_tree2(float* in, uint32_t len){
	uint32_t tmp_len;
	if(len>1){
		tmp_len = len/2;
	} else {
		tmp_len = 1;
	}
	float tmp_in[tmp_len];
	if(len==1){
		return in[0];
	}else{
		for(uint32_t i=0;i<tmp_len;i++){
			tmp_in[i] = in[i] + in[len-1-i];//输入数组的第一个数与最后一个数相加、第二个数与倒数第二个数相加，……，与硬件行为保持一致
			if(2*i+1>=len){
				printf("len error\n");
			}
		}
		fp32_add_tree2(tmp_in,tmp_len);
	}
}


//program for test pe.sv and pe_tree.sv
int main(int argc, char *argv[]){
	if(argc!=3){
		printf("Error\n");
		printf("Usage: ./tree start end\n");
		return 0;
	}
	int start = atoi(argv[1]);
	int end = atoi(argv[2]);
	int case_num = 1;
	int ret = 1;
	int no_ret = 0;
	int no_space = 2;
	int array_len = 8;
	//srand((unsigned)time(NULL));//use the timestamp as seed
	printf("Create Array\n");
	float16_t a[case_num][array_len], b[case_num][array_len], c[case_num][array_len],result[case_num];//c=a*b, result=sum(c)
	float af[case_num][array_len], bf[case_num][array_len], cf[case_num][array_len],resultf[case_num], resultf2[case_num];//float standard result
	printf("Start to Init Array!\n");
	for(int i=0; i<case_num; i++){
		for(int j=0; j<array_len; j++){
			af[i][j] = my_random_fp32(start, end);
			bf[i][j] = my_random_fp32(start, end);
			cf[i][j] = af[i][j] * bf[i][j];
			a[i][j] = my_fp32_to_fp16(af[i][j]);
			b[i][j] = my_fp32_to_fp16(bf[i][j]);
			c[i][j] = f16_mul(a[i][j], b[i][j]);
		}
	}
	printf("Start to Write File!\n");
	FILE *fp_a = fopen("array_a.txt", "w");
	FILE *fp_b = fopen("array_b.txt", "w");
	FILE *fp_result = fopen("result_c.txt", "w");
	for(int i=0; i<case_num; i++){
		result[i] = fp16_add_tree(c[i], 0, array_len-1);
		//result[i] = fp16_add_normal(c[i], 0, 63);
		printf("actual result: ");
		my_fp16_print(result[i], ret);
		//use fp32 to check the difference between add_tree and add_normal, make sure that the add_tree is correct
		resultf[i] = fp32_add_tree(cf[i], 0, array_len-1);
		//resultf2[i] = fp32_add_normal(cf[i], 0, array_len-1);
		printf("std result: %.4f\n", resultf[i]);
		
		// printf("FP32: Original Array: \n");
		// for(int j=0;j<array_len;j++){
		// 	printf("%.2f ", cf[i][j]);
		// }
		// printf("\n");
		//FP32: add once and print the result
		// for(int j=array_len; j>1; j=j/2){
		// 	fp32_add_once(cf[i], j, cf[i], j/2);
		// 	for(int k=0;k<j/2;k++){
		// 		printf("%.2f ", cf[i][k]);
		// 	}
		// 	printf("\n");
		// }

		printf("FP16: Original Array: \n");
		for(int j=0;j<array_len;j++){
			my_fp16_print(c[i][j], no_ret);
		}
		printf("\n");
		printf("Intermediate result: \n");
		for(int j=array_len; j>1; j=j/2){
			fp16_add_once(c[i], j, c[i], j/2);
			for(int k=0;k<j/2;k++){
				my_fp16_print(c[i][k], no_ret);
			}
			printf("\n");
		}
	}
	for(int i=0; i<case_num; i++){
		for(int j=0; j<array_len; j++){
			if(j==(array_len-1)){
				my_fp16_print_to_file(fp_a, a[i][j], ret);
				my_fp16_print_to_file(fp_b, b[i][j], ret);
			}	
			else{
				my_fp16_print_to_file(fp_a, a[i][j], no_space);
				my_fp16_print_to_file(fp_b, b[i][j], no_space);
			}
		}
		my_fp16_print_to_file(fp_result, result[i], ret);
	}
	fclose(fp_a);
	fclose(fp_b);
	fclose(fp_result);
	printf("Finish!\n");
	return 0;
}