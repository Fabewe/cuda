#include <stdio.h>
#include <string>

#define N 1000

__global__ void sumaVec(float * out, float * a,float *b, int size){
    for (int i = 0;i<size;i++){
        out[i] = a[i] + b[i];
    }
    
}

int main(int argc,char ** argv) {

    clock_t t;
    t = clock();
    float *sum1,*sum2,*out;
    float *c_sum1,*c_sum2,*c_out;


    sum1 = (float *)malloc(sizeof(float)*N);
    sum2 = (float *)malloc(sizeof(float)*N);
    out = (float *)malloc(sizeof(float)*N);


    for (int i = 0 ;i<N;i++){
        sum1[i] = 1.0;
        sum2[i] = 2.0;
    }


    cudaMalloc((void**)&c_sum1,sizeof(float)*N);
    cudaMalloc((void**)&c_sum2,sizeof(float)*N);
    cudaMalloc((void**)&c_out,sizeof(float)*N);

    cudaMemcpy(c_sum1,sum1,sizeof(float)*N,cudaMemcpyHostToDevice);
    cudaMemcpy(c_sum2,sum2,sizeof(float)*N,cudaMemcpyHostToDevice);
    cudaMemcpy(c_sum2,sum2,sizeof(float)*N,cudaMemcpyHostToDevice);
 

    sumaVec<<<std::stoi(argv[1]),std::stoi(argv[2])>>>(c_out,c_sum1,c_sum2,N);

    cudaMemcpy(out,c_out,sizeof(float)*N,cudaMemcpyDeviceToHost);


    t = clock() - t;

    for(int i = 0;i< N;i++){
            printf("out[%d] = %f\n",i,out[i]);
        }
    cudaFree(c_sum1);
    cudaFree(c_sum2);
    cudaFree(c_out);


    free(sum1);
    free(sum2);
    free(out);

    printf ("Tiempo = %f seconds.\n",((float)t)/CLOCKS_PER_SEC);


    return 0;
}
