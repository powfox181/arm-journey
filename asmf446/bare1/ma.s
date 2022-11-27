.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

.include "/media/psf/stm/asmf446/bare1/head.s"

.equ    GPIOA_MODER,    (GPIOA_BASE + 0x0);
.equ    GPIOA_OUPUT,    (GPIOA_BASE + 0x14)
.equ    AHB1_EN_OFFSET, 0x30
.equ    AHB1_ENR,   (RCC_BASE + AHB1_EN_OFFSET)

.section .text._main, "ax"
.type _main, %function
.global _main

_main   :
        bl  __fn_enable_ahb1;
        bl  __fn_enable_output_gpioa;
        mov r3, #88
        b   .
        .align
        
    __fn_enable_ahb1 :
        ldr     r0, =AHB1_ENR @ load enable register address to r0
        mov     r1, #0x1
        str     r1, [r0]    @ store r1 to content at pointer r0
        bx      lr
    __fn_enable_output_gpioa :
        mov     r1, 0x01
        lsl     r1, r1, #0x2
        ldr     r0, =GPIOA_MODER @ loading address of moder reg to r0
        ldr     r2, [r0] @ loading content r0 to r2 
        orr     r3, r1, r2
        str     r3, [r0]
        ldr     r0, =GPIOA_OUPUT
        ldr     r2,[r0]
        mov     r1, #0x2
        str     r1, [r0]
        mov     r2, #99
        bx      lr

        .end