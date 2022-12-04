.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

.include "../head.s"
/* gpio A configuration for AF 7 */
;# AHB1 BUS 
.equ    RCC_AHB1_ENR,   (RCC_BASE + 0x30)
.equ    GPIOA_MODER,    (GPIOA_BASE + 0x0);
.equ    GPIOA_MODE_AF,   (0x10)
.equ    GPIOA_EN_BIT,   (1 << 0)
/* usart2   configuration */
;#  APB1 BUS 
.equ    RCC_APB1_ENR,    (RCC_BASE + 0x40)
.equ    RCC_USART2_ENA_BIT,      (1 << 17)

.section .text._main, "ax"
.type _main, %function
.global _main

_main   :
    ;# enable clock to access gpioA register
    ldr r0,=RCC_AHB1_ENR
    ldr r1,[r0]
    orr r1, #GPIOA_EN_BIT
    str r1, [r0]
    ;# configure gpio as alt func mode for required pins
    ldr r0,=GPIOA_MODER
    ldr r1, [r0]
    bic r1, 0x30 ;# bit clear on pin 5,4 = pin 2 on gpioA, 0b 
    str r1, [r0]
    MOV R2, #666

        .end