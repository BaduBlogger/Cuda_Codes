%%cu
#include<stdio.h>
#include<stdlib.h>

__global__ void add(int *d_a,int *d_b,int *d_sum)
{
    *d_sum = *d_a + *d_b;
}

int main()
{
    int a,b,sum;
    int *d_a,*d_b,*d_sum;
    int size = sizeof(int);
 
    a = 14;
    b = 23;
    sum = 0;
 
    cudaMalloc((void**)&d_a,size);
    cudaMalloc((void**)&d_b,size);
    cudaMalloc((void**)&d_sum,size);
 
    cudaMemcpy(d_a,&a,size,cudaMemcpyHostToDevice);
    cudaMemcpy(d_b,&b,size,cudaMemcpyHostToDevice);
    
    add<<<1,1>>>(d_a,d_b,d_sum);
 
    cudaMemcpy(&sum,d_sum,size,cudaMemcpyDeviceToHost);

    printf("Sum is : %d",sum);
 
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_sum);
    return 0;
}