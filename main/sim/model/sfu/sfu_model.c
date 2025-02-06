#include <stdio.h>
#include <stdlib.h>
#include "softfloat.h"
#include "svdpi.h"
#include "math.h"

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
change the type of element in svOpenArrayHandle to float16_t
*/
void openArrToFloat16(const svOpenArrayHandle oah, int len, float16_t* ret){
    float16_t* tmp;
    //io_printf("openArrToDouble: len is %d \n", len);
    for(int i=0;i<len;i++){
        tmp = (float16_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
           io_printf("openArrToDouble: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
           exit(0);
        }
        ret[i] = *tmp;
    }
}

/*
change the type of element in svOpenArrayHandle to uint16_t
*/
void openArrToUint16( const svOpenArrayHandle oah, int len, uint16_t* ret){
    uint16_t* tmp;
    //io_printf("openArrToDouble: len is %d \n", len);
    for(int i=0;i<len;i++){
        tmp = (uint16_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
           io_printf("openArrToDouble: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
           exit(0);
        }
        ret[i] = *tmp;
    }
}


void openArrToUint32( const svOpenArrayHandle oah, int len, uint32_t* ret){
    uint32_t* tmp;
    //io_printf("openArrToDouble: len is %d \n", len);
    for(int i=0;i<len;i++){
        tmp = (uint32_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
           io_printf("openArrToDouble: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
           exit(0);
        }
        ret[i] = *tmp;
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
change the type of float16_t to element type in svOpenArrayHandle
*/
void float16ToOpenArr(float16_t* input, int len, svOpenArrayHandle oah){
    float16_t* tmp;
    for(int i=0;i<len;i++){
        tmp = (float16_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
            io_printf("doubleToOpenArr: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
            exit(0);
        }
        *tmp = *input;
        input++;
    }
}

/*
change the type of uint16_t to element type in svOpenArrayHandle
*/
void uint16ToOpenArr(uint16_t* input, int len, svOpenArrayHandle oah){
    uint16_t* tmp;
    for(int i=0;i<len;i++){
        tmp = (uint16_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
            io_printf("doubleToOpenArr: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
            exit(0);
        }
        *tmp = *input;
        input++;
    }
}

void uint32ToOpenArr(uint32_t* input, int len, svOpenArrayHandle oah){
    uint32_t* tmp;
    for(int i=0;i<len;i++){
        tmp = (uint32_t*)svGetArrElemPtr(oah,i);
        if(tmp == NULL){
            io_printf("doubleToOpenArr: %d-th svGetArrElemPtr get a NULL pointer!\n", i);
            exit(0);
        }
        *tmp = *input;
        input++;
    }
}

short fp16toaddr(float16_t fp16_x, int step){

    short y;

    short* tmp = (short*) &fp16_x; // convert float16_t fp16_x to 16 bits decimal data

    float tmp_int  = trunc( *tmp/pow( 2.0, 10 ) );
    float tmp_frac = *tmp - tmp_int * pow( 2.0, 10 );

    float exp = 15 - tmp_int;

    float msb = 10 - trunc( log2( step ) - exp );   // most sigificant bit
    if(exp > log2(step)){
        y = 0;
    }else{
        y = trunc( ( pow(2.0, 10) + tmp_frac ) / pow(2.0, msb) );
    }

    return y;
}



/*
in DPI-C, we better use svOpenArrayHandle as the any array in C; 
for "int", it is the same in DPI-C and C;
the "const" usually means that the arg is input, otherwise it is usually output
verilog与C的交互接口，使用svOpenArrayHandle来表示verilog中的任意数组，求向量的最大值
*/
// void max_tree_model(const svOpenArrayHandle oah_vec, const int oah_bypass, const svOpenArrayHandle oah_index, 
//     const int len, svOpenArrayHandle oah_max, svOpenArrayHandle index_out ){
void max_tree_model(const svOpenArrayHandle oah_vec, const svOpenArrayHandle oah_bypass, const svOpenArrayHandle oah_index, 
    const int len, svOpenArrayHandle oah_max, svOpenArrayHandle index_out ){
    // 这里的bypass表示跳过不参与比较计算，1表示跳过，0表示参与比较计算，bypass具体有几位就是有几个数字求最大值，设置参数可变时，应该是设置为uint16_t类型，然后如果是32或64位，就设置为数组
    float16_t *vec = (float16_t*)malloc(len*sizeof(float16_t));
    // uint32_t bypass = (uint32_t)oah_bypass;
    uint16_t *bypass = (uint16_t*)malloc(len/16*sizeof(uint16_t));
    //uint16_t *index = (uint16_t*)malloc(len*sizeof(uint16_t));
    uint32_t *index = (uint32_t*)malloc(len*sizeof(uint32_t));
  
    openArrToFloat16(oah_vec, len, vec); // 把svOpenArrayHandle中的数据复制到数据类型为float16_t的vec中，因为在c语言中只能识别float16_t类型的数据
    //openArrToUint16(oah_index, len, index); // index是16位，但是是整数的，不是浮点数，所以用uint16_t
    openArrToUint32(oah_index, len, index);
    openArrToUint16(oah_bypass, len/16, bypass);

    float16_t max_res = vec[0];
    //uint16_t max_index = index[0];
    uint32_t max_index = index[0];
    uint16_t max_res_u;
    int j;
    for(int i=1; i<len; i++){       // 求最大值，bypass为1时表示跳过不参与比较计算
        max_res_u = *(uint16_t*)&vec[i];
        if(max_res_u == 64512){    // softfloat的库识别不了负无穷fc00（64512），将它改成16进制可以表示的最小的负数fbe0（64480）
            max_res_u = 64480;
            vec[i] = *(float16_t*)&max_res_u;
        }
        j = i/16;
        // if ( (bypass[j]>>(i-j*16) & 1) == 0){    // bypass注释，不参与计算了，在rtl中bypass在内部没有使用
            if (f16_lt(max_res, vec[i]) | f16_eq(max_res, vec[i])){
                max_res = vec[i];
                max_index = index[i];
            }
        // }
    }
    
    float16ToOpenArr(&max_res, 1, oah_max);     // c计算完成之后将结果通过float16ToOpenArr函数使verilog识别
    //uint16ToOpenArr(&max_index, 1, index_out);  // 类似
    uint32ToOpenArr(&max_index, 1, index_out);  // 类似
    // index_out = max_index;

    free(vec);
    free(bypass);
    free(index);

}


// 求向量的乘积
void mult_vec_model(const svOpenArrayHandle oah_vec_a, const svOpenArrayHandle oah_vec_b, const int len, svOpenArrayHandle oah_vec_out ){

    float16_t *vec_a = (float16_t*)malloc(len*sizeof(float16_t));
    float16_t *vec_b = (float16_t*)malloc(len*sizeof(float16_t));
    float16_t *vec_c = (float16_t*)malloc(len*sizeof(float16_t));

    openArrToFloat16(oah_vec_a, len, vec_a);
    openArrToFloat16(oah_vec_b, len, vec_b);
    
    for(int i=0; i<len; i++){
        vec_c[i] = f16_mul(vec_a[i], vec_b[i]);
    }

    float16ToOpenArr(vec_c, len, oah_vec_out);
    free(vec_a);
    free(vec_b);
    free(vec_c);

}

// 求两个向量对应元素的和
void add_vec_model(const svOpenArrayHandle oah_vec_a, const svOpenArrayHandle oah_vec_b, const svOpenArrayHandle oah_bypass, const int len, 
    const int sub_en, svOpenArrayHandle vec_out){

    float16_t *vec_a = (float16_t*)malloc(len*sizeof(float16_t));
    float16_t *vec_b = (float16_t*)malloc(len*sizeof(float16_t));
    float16_t *vec_c = (float16_t*)malloc(len*sizeof(float16_t));
    uint16_t *bypass = (uint16_t*)malloc((len/16)*sizeof(uint16_t));

    openArrToFloat16(oah_vec_a, len, vec_a);
    openArrToFloat16(oah_vec_b, len, vec_b);
    openArrToUint16(oah_bypass, len/16, bypass);

    int j;
    for(int i=0; i<len; i++){
        j = i/16;
        if ( (bypass[j]>>(i-j*16) & 1) == 0){    // bypass=1，不参与计算
            if(sub_en){
                vec_c[i] = f16_sub(vec_a[i], vec_b[i]);
            }else{
                vec_c[i] = f16_add(vec_a[i], vec_b[i]);
            }
        }else{
            vec_c[i] = my_fp64_to_fp16(0.0);
        }
    }

    float16ToOpenArr(vec_c, len, vec_out);

    free(vec_a);
    free(vec_b);
    free(vec_c);
    free(bypass);

}

// 求两个标量的乘积
void mult_scalar_model(const svOpenArrayHandle oah_scalar_a, const svOpenArrayHandle oah_scalar_b, svOpenArrayHandle oah_scalar_out){

    float16_t *scalar_a = (float16_t*)malloc(sizeof(float16_t));
    float16_t *scalar_b = (float16_t*)malloc(sizeof(float16_t));
    float16_t *scalar_c = (float16_t*)malloc(sizeof(float16_t));

    openArrToFloat16(oah_scalar_a, 1, scalar_a);
    openArrToFloat16(oah_scalar_b, 1, scalar_b);

    scalar_c[0] = f16_mul(scalar_a[0], scalar_b[0]);
    
    float16ToOpenArr(scalar_c, 1, oah_scalar_out);

    free(scalar_a);
    free(scalar_b);
    free(scalar_c);
    
}

// 求向量的exp值
void exp_lut_vec_model(const svOpenArrayHandle oah_vec, const svOpenArrayHandle oah_bypass, const int len, svOpenArrayHandle oah_vec_out){
    
    float16_t *vec = (float16_t*)malloc(len*sizeof(float16_t));
    uint16_t *bypass = (uint16_t*)malloc((len/16)*sizeof(uint16_t));

    openArrToFloat16(oah_vec, len, vec);
    openArrToUint16(oah_bypass, len/16, bypass);

    int fraclen = 13;
    int step_num = 1024;
    int index;

    double imin = -0.7;
    double imax =  0.7;
    double x[step_num], exp_lut0[step_num], exp_lut1[step_num];

    double phase_div_fix;
    double array[len], phase_int_fix[len], phase_frac_fix[len], exp_lut[len];

    float16_t *exp_o = (float16_t*)malloc(len*sizeof(float16_t));

    double inv_ln2_constant_fix  = round(1/log(2)*pow(2,fraclen))/pow(2,fraclen) ;
    double ln2_constant_fix      = round(  log(2)*pow(2,fraclen))/pow(2,fraclen) ;
    
    double step = (imax-imin)/(step_num*2);
    double inv_step = round(1/step*pow(2,fraclen))/pow(2,fraclen) ;

    for(int i=0; i<len; i++){
        if((bypass[i/16]>>(i-i/16*16) & 1) == 1){   
            array[i] = 0.0;
        }else{
            array[i] = my_fp16_to_fp64(vec[i]);
        }

    }

    for (int i = 0; i <step_num; i++) {
        x[i] = (i+1)*step;
    }
    
    for (int i = 0; i <step_num; i++) { // compute the look up table
        exp_lut0[i] = round(exp( x[i])*pow(2,fraclen))/pow(2,fraclen) ;  // compute the positive part of the exponential
        exp_lut1[i] = round(exp(-x[i])*pow(2,fraclen))/pow(2,fraclen) ;  // compute the negative part of the exponential
    }

    double pos_inf = INFINITY;
    double neg_inf = -INFINITY;

    for (int i = 0; i <len; i++) {
        if((bypass[i/16]>>(i-i/16*16) & 1) == 1){
            exp_o[i] = my_fp64_to_fp16(0.0);
        }else{
            if (array[i] == pos_inf) {
                exp_o[i] = my_fp64_to_fp16(pos_inf);
            }else if (array[i] == neg_inf) {
                exp_o[i] = my_fp64_to_fp16(0.0);
            }else{
                phase_div_fix     = array[i] * inv_ln2_constant_fix ;
                phase_int_fix[i]  = trunc(phase_div_fix);                           // compute the integer part of the data: q
                phase_frac_fix[i] = array[i] - phase_int_fix[i] * ln2_constant_fix; // compute the fractional part of the data: r
                phase_frac_fix[i] = floor(phase_frac_fix[i] * pow(2,fraclen))/pow(2,fraclen);         // change the range of the fractional part to [0, 1]
                index = trunc(phase_frac_fix[i] * inv_step); // compute the index of data in the look up table

                if(index == 0){
                    exp_lut[i] = 1;
                }else if(index >0){
                    exp_lut[i] = exp_lut0[index-1];       // look up the exponential for positive data
                }else{
                    exp_lut[i] = exp_lut1[abs(index)-1];  // look up the exponential for negative data
                }

                exp_o[i] = my_fp64_to_fp16(pow(2, phase_int_fix[i]) * exp_lut[i]); // compute: 2^q exp(r)
            }
        }
    }

    float16ToOpenArr(exp_o, len, oah_vec_out);

    free(vec);
    free(bypass);
    free(exp_o);

}


// 求gelu的值

void gelu_vec_model(const svOpenArrayHandle oah_vec, const svOpenArrayHandle oah_bypass, const int len, const svOpenArrayHandle oah_gelu_lut0, const svOpenArrayHandle oah_gelu_lut1, svOpenArrayHandle oah_vec_out){

    float16_t *vec     = (float16_t *)malloc(sizeof(float16_t) * len);
    uint16_t  *bypass  = (uint16_t *) malloc(sizeof(uint16_t)  * (len/16));
    float16_t *vec_out = (float16_t *)malloc(sizeof(float16_t) * len);
    float16_t *gelu_lut0 = (float16_t *)malloc(sizeof(float16_t) * 2048);
    float16_t *gelu_lut1 = (float16_t *)malloc(sizeof(float16_t) * 2048);

    openArrToFloat16(oah_vec, len, vec);
    openArrToUint16(oah_bypass, len/16, bypass);
    openArrToFloat16(oah_gelu_lut0, 2048, gelu_lut0);
    openArrToFloat16(oah_gelu_lut1, 2048, gelu_lut1);

    int step = 256;
    short  addr;
    short* array_prt;
    short  array_tmp;
    
    float16_t* array_ab;
    double fp64_pos_8 = 8.0;
    double fp64_neg_8 = -8.0;
    float16_t  fp16_0 = my_fp64_to_fp16(0.0);
    float16_t  fp16_p8 = my_fp64_to_fp16(fp64_pos_8);
    float16_t  fp16_n8 = my_fp64_to_fp16(fp64_neg_8);

    uint16_t   abs_value = 0x7FFF; // use to compute abs value

    float16_t* array_abs = (float16_t*)malloc(len*sizeof(float16_t));

    for (int i = 0; i < len; i++){
        if(bypass[i/16]>>(i-i/16*16) & 1){
            array_abs[i] = fp16_0;
        }else{
            array_prt  = (short*)&vec[i];
            array_tmp  = *array_prt & abs_value;  // compute the abs value of the input 
            array_ab = (float16_t*)&array_tmp ;
            array_abs[i] = *array_ab;
        }
    }

    // FILE* fp0 = fopen("gelu_vit_lut0.txt", "r");
    // FILE* fp0 = fopen("/home/hpy/wrk/OpenTF/main/Code/mac/model/c_model/gelu/gelu_vit_lut0.txt", "r");
    // if (fp0 == NULL) {
    //     printf("Error opening file gelu_vit_lut0.txt");
    // }
    // float16_t* gelu_lut0 = (float16_t*)malloc(sizeof(float16_t)*step*8);
    // if (gelu_lut0 == NULL) {
    //     printf("Error malloc for gelu_lut0");
    //     free(gelu_lut0);  // 释放之前分配的内存
    //     exit(-1);
    // }
    // for (int i = 0; i < step*8; i++){
    //     fscanf(fp0, "%x", &gelu_lut0[i]);
    // }
    // fclose(fp0);
    // io_printf("2222222222 gelu_lut0[0] = %x\n", gelu_lut0[0]);

    // FILE* fp1 = fopen("/home/hpy/wrk/OpenTF/main/Code/mac/model/c_model/gelu_vit_lut1.txt", "r");
    // float16_t* gelu_lut1 = (float16_t*)malloc(sizeof(float16_t)*step*8);
    // for (int i = 0; i < step*8; i++){
    //     fscanf(fp1, "%x", &gelu_lut1[i]);
    // }
    // fclose(fp1);
    
    for(int i = 0; i < len; i++){
        if(bypass[i/16]>>(i-i/16*16) & 1){
            vec_out[i] = fp16_0;
        }else{
            addr = fp16toaddr( array_abs[i], step );  // compute address 
            if(f16_lt( fp16_p8, vec[i] )){
                vec_out[i] = vec[i];
            }else if (f16_lt( vec[i], fp16_n8 )){
                vec_out[i] = fp16_0;
            }else if( f16_eq(array_abs[i],  fp16_0) ) {
                vec_out[i] = fp16_0;  // gelu(0) = 0
            }else if (addr==0) {
                vec_out[i] = fp16_0;  
            }else if(f16_lt( fp16_0, vec[i] ) ){
                vec_out[i] = gelu_lut0[addr-1];    // for positive value
            }else{
                vec_out[i] = gelu_lut1[addr-1];    // for negative value
            }
        }
    }
    
    float16ToOpenArr(vec_out, len, oah_vec_out);

    free(vec);
    free(bypass);
    free(array_abs);
    free(gelu_lut0);
    free(gelu_lut1);
    free(vec_out);

}

void silu_vec_model(const svOpenArrayHandle oah_vec, const svOpenArrayHandle oah_bypass, const int len, const svOpenArrayHandle oah_silu_lut0, const svOpenArrayHandle oah_silu_lut1, svOpenArrayHandle oah_vec_out){

    float16_t *vec     = (float16_t *)malloc(sizeof(float16_t) * len);
    uint16_t  *bypass  = (uint16_t *) malloc(sizeof(uint16_t)  * (len/16));
    float16_t *res = (float16_t *)malloc(sizeof(float16_t) * len);
    float16_t *silu_lut0 = (float16_t *)malloc(sizeof(float16_t) * 2048);
    float16_t *silu_lut1 = (float16_t *)malloc(sizeof(float16_t) * 2048);

    openArrToFloat16(oah_vec, len, vec);
    openArrToUint16(oah_bypass, len/16, bypass);
    openArrToFloat16(oah_silu_lut0, 2048, silu_lut0);
    openArrToFloat16(oah_silu_lut1, 2048, silu_lut1);
     
    int step = 256;
    int x_max = 8;
    short  addr;
    short* array_prt;
    short  array_tmp;
    
    float16_t* array_ab;
    float16_t  fp16_0 = my_fp64_to_fp16(0.0);
    uint16_t   abs_value = 0x7FFF; // use to compute abs value

    float16_t* array_abs = (float16_t*)malloc(len*sizeof(float16_t));
    // float16_t* res = (float16_t*)malloc(len*sizeof(float16_t));
    // float16_t* fp16_silu_lut = (float16_t*)malloc(2*x_max*step*sizeof(float16_t));

    // fp16_silu_lut = fp16_silu(step, x_max);  // compute the lookup table

    for (int i = 0; i < len; i++){
        if(bypass[i/16]>>(i-i/16*16) & 1){
            array_abs[i] = fp16_0;
        }else{
            array_prt  = (short*)&vec[i];
            array_tmp  = *array_prt & abs_value;  // compute the abs value of the input 
            array_ab = (float16_t*)&array_tmp ;
            array_abs[i] = *array_ab;
        }
    }

    for(int i = 0; i < len; i++){
        if(bypass[i/16]>>(i-i/16*16) & 1){
            res[i] = fp16_0;
        }else{
            addr = fp16toaddr( array_abs[i], step );  // compute address 
        
            if ( f16_lt( my_fp64_to_fp16(x_max), vec[i] ) ){
                res[i] = vec[i];
            }else if( f16_lt( vec[i], my_fp64_to_fp16(-x_max) ) ){
                res[i] = fp16_0;
            }else if( f16_eq(array_abs[i],  fp16_0) ) {
                res[i] = fp16_0;  // silu(0) = 0
            }else if (addr==0) {
                res[i] = fp16_0;  
            }else if(f16_lt( fp16_0, vec[i] ) ){
                if (addr > step*x_max){
                    addr = step*x_max;
                }  
                res[i] = silu_lut0[addr-1];  // for positive value
            }else{
                if (addr > step*x_max){
                    addr = step*x_max;
                }
                res[i] = silu_lut1[addr-1]; // for negative value
            }
        }
    }

    float16ToOpenArr(res, len, oah_vec_out);
}


float16_t add_tree(float16_t in[], uint32_t start, uint32_t end){
	if(start==end){
		return in[start];
	}
	int mid = (start+end)/2;
	float16_t leftsum = add_tree(in, start, mid);
	float16_t rightsum = add_tree(in, mid+1, end);
	float16_t tmp_sum = f16_add(leftsum, rightsum);
	return tmp_sum;
}

// 求向量的和
void add_tree_model( const svOpenArrayHandle oah_vec, const int len, svOpenArrayHandle oah_vec_out){
    
    float16_t* vec = (float16_t*)malloc(sizeof(float16_t)*len);
    if(vec==NULL){
        printf("malloc for vec failed!\n");
    }
    float16_t* vec_out = (float16_t*)malloc(sizeof(float16_t));
    if(vec_out==NULL){
        printf("malloc for vec_out failed!\n");
    }

    openArrToFloat16(oah_vec, len, vec);
 
    vec_out[0] = add_tree(vec, 0, len-1); 

    float16ToOpenArr(vec_out, 1, oah_vec_out);

    free(vec);
    free(vec_out);

}


