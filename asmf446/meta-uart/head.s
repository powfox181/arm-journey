.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

;#  rcc_base register address
.global RCC_BASE    
.equ    RCC_BASE, 0x40023800    ;# 0x40023bff ahb1 bus
;# gpioA_base register address
.global GPIOA_BASE
.equ    GPIOA_BASE, 0x40020000  ;# 0x400203ff ahb1 bus
;# usart2  base register address 
.equ    USART2_APB1_BASE,   0x40004400  ;# end = 0x400047ff