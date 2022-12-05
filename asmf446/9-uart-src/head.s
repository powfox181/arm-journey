.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

.ifndef HEAD_H 
.globl HEAD_H
.global RCC_BASE    
.equ    RCC_BASE, 0x40023800    ;# 0x40023bff ahb1 bus
.global GPIOA_BASE
.equ    GPIOA_BASE, 0x40020000  ;# 0x400203ff ahb1 bus
.equ    TIM9_BASE, 0x40014000   ;# 0x400143ff apb2 bus

.endif