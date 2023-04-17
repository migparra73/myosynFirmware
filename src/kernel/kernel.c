#include "kernel.h"

void myFunction(void)
{
    int result = myKernel(10);
    result++;
}

int myKernel(int operands)
{
    int result = 0;
    result = operands + 1;
    return result;
}
