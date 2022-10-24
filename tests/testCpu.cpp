#include <stdio.h>
#include <cstdlib>
#include <time.h>
#define N 100000000

int main() {

    clock_t end,begin;
    begin = clock();
    float *sum1,*sum2,*out;

    sum1 = (float *)malloc(sizeof(float)*N);
    sum2 = (float *)malloc(sizeof(float)*N);
    out = (float *)malloc(sizeof(float)*N);

    for (int i = 0 ;i<N;i++){
        sum1[i] = 1.0;
        sum2[i] = 2.0;
    }

   for (int i = 0;i<N;i++){
        out[i] = sum1[i] + sum2[i];
    }
    free(sum1);
    free(sum2);

    /*for(int i = 0;i< N;i++){
        printf("out[%d] = %f\n",i,out[i]);
    }*/
    end = clock();
    free(out);
    printf ("Tiempo = %lf seconds.\n",((double)end - (double)begin)/CLOCKS_PER_SEC);


    return 0;
}