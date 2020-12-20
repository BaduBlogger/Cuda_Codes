%%cu
#include <stdio.h>
#include <stdlib.h>
__global__ void displayMessage(void){
}

int main()
{
    displayMessage<<<1,1>>>();
    printf("Hello World!");
    return 0;
}