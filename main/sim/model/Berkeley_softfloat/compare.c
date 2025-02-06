#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
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

int main(int argc, char *argv[]){
	// if(argc!=3){
	// 	printf("Error\n");
	// 	printf("Usage: ./tree start end\n");
	// 	return 0;
	// }
	// int start = atoi(argv[1]);
	// int end = atoi(argv[2]);
	int case_num = 17;
	int ret = 1;
	int no_ret = 0;
	int no_space = 2;
	int array_len = 64;
	//srand((unsigned)time(NULL));//use the timestamp as seed
	printf("Create Array\n");

	FILE *f_array_a, *f_array_b, *f_array_c;
	float16_t half_array_a[case_num][array_len];
	float16_t half_array_b[case_num][array_len];
	float16_t half_array_mul[case_num][array_len];
	f_array_a = fopen("array_a.txt","r");
	f_array_b = fopen("array_b.txt","r");
	f_array_c = fopen("result_c.txt","w");
	//for(uint32_t j=0;j<case_num;j++){
	for(uint32_t j=0;j<1;j++){
	    for(uint32_t i=0;i<array_len;i++){
	     	fscanf(f_array_a,"%4X",&half_array_a[j][i]);
	     	fscanf(f_array_b,"%4X",&half_array_b[j][i]);
	     	half_array_mul[j][i] = f16_mul(half_array_a[j][i], half_array_b[j][i]);
            printf("%d-th:",array_len-1-i);
			my_fp16_print(half_array_mul[j][i], no_ret);
	    }
		printf("\n");
		fscanf(f_array_a, "%*c", half_array_a);//skip the '\n'
	    fscanf(f_array_b, "%*c", half_array_b);

		float16_t tmp = fp16_add_tree(half_array_mul[j], 0, array_len-1);
		printf("\nIntermediate result: \n");
		for(int jj=array_len; jj>1; jj=jj/2){
			fp16_add_once(half_array_mul[j], jj, half_array_mul[j], jj/2);
			for(int k=0;k<jj/2;k++){
				my_fp16_print(half_array_mul[j][k], no_ret);
			}
			printf("\n");
		}
		printf("\nFinal tree result: \n");
		my_fp16_print(tmp, ret);
    }
	//fscanf(f_array_a, "%[256X^\n]%*c", half_array_a);
	
    fclose(f_array_a);
	fclose(f_array_b);
	fclose(f_array_c);

}
