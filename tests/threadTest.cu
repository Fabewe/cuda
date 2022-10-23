#include <stdio.h>
#include <string>

using namespace std;

__global__ void identifyThread(){
    int i = threadIdx.x;
    printf("Soy el hilo #%d\n",i);
}

int main(int argc, char ** argv){
    identifyThread<<<1,stoi(argv[1])>>>();
}