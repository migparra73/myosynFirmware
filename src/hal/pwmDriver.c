#include "pwmDriver.h"
#include "same51j19a.h"

void PwmDriver_Init(void)
{
    //int *driver;

    TC0_REGS->COUNT8.TC_CTRLA; // Ctrl registers Set A 
    TC0_REGS->COUNT8.TC_WAVE; // Waveform Generation Control
    // Something  helllo 
}