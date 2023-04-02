.syntax unified
.cpu cortex-m4
.thumb

.global Reset_Handler
.extern SystemInit
.extern main

.section .text.Reset_Handler, "ax"
Reset_Handler:
  /* Call system initialization function */
  bl SystemInit

  /* Setup pointers to data and bss sections */
  ldr r0, =_sidata
  ldr r1, =_sdata
  ldr r2, =_edata

/* Copy data section from flash to SRAM */
copy_data:
  cmp r1, r2
  itt lt
  ldrlt r3, [r0], #4
  strlt r3, [r1], #4
  blt copy_data

  /* Setup pointers to bss section */
  ldr r0, =_sbss
  ldr r1, =_ebss

/* Zero out bss section */
zero_bss:
  cmp r0, r1
  itt lt
  movlt r3, #0
  strlt r3, [r0], #4
  blt zero_bss

  /* Call main() function */
  bl main

  /* Infinite loop */
  b .

/* Data section addresses */
.word _sidata
.word _sdata
.word _edata
.word _sbss
.word _ebss