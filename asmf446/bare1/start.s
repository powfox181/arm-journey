.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

# global veriable
.global g_pfnVectors
.global default_handler

# start of initialized data, defined in linker script
.word _sidata  

# start of data, defined in linker script 
.word _sdata

# end address for .data section , defined in linker script
.word _edata

# start and end address for bss, defined in linker script
.word _sbss
.word _ebss

/**
    .section name [,"flags"[, @type[,flag_specific_arguments]]]
 */

/*
    this is the code, that is first called when micro controller is powered on
    reset_handler
 */
 .section .text.reset_handler
 .weak reset_handler
 .type reset_handler, %function

 reset_handler: 
    ldr r0, =_estack /*load (starting) end address of stack*/ 
    mov sp, r0

    /*copy INITIALIZED  data segment from flash to sram  */
    ldr r0, =_sdata /* this should be addr on sram*/
    ldr r1, =_edata /*this should be addr on sram or flash ??? */ 
    ldr r2, =_sidata /*this should be addr on flash */ 
    movs r3, #0 /* r3 as counter, and movs will update nzvc bits in CPSR register*/ 
    b __loopcopydatainit

__copydatainit:
    ldr r4, [r2, r3] /*load to r4 content at address r2 with offset r3 */ 
    str r4, [r0, r3];
    adds r3, r3, #4

/** reason why copy before loop, cpu perform linear operation, after copy it will jump to next line */

__loopcopydatainit: 
    adds r4, r0, r3
    cmp r4, r1  ;# cmp r4 with _edata, r4 - r1 ; this will update ascp bit, (flags) in register
    bcc __copydatainit ;# unsigned lower == carry clear(c==0), branch if lower, r4 < r1 for unsigned cmp operation, 
/** now the initialized data, is done, next will be bss */
;#zero fill the bss segment
    ldr r2, =_sbss
    ldr r4, =_ebss
    mov r3, #0
    b __loopfillzerobss

__fillzerobss: 
    str r3, [r2];
    adds r2, r2, #4

__loopfillzerobss:
    cmp r2, r4
    bcc __fillzerobss

    /*Branch to main */
    bl _main

/*  loop forever, if cannot get into main, stay here */
__loopforever:
    b __loopforever

    .size reset_handler, .-reset_handler ;# setting the size associated with a symbol

/*
    code that will be called when cpu, processor get unexpected interrupt, default just enter an infinite loop
    @progbits, section contains data
    "ax" = section is allocatable and executable
 */
 .section .text.default_handler,"ax",%progbits
 default_handler:
 __infinite_loop:
    b __infinite_loop
    .size default_handler, .-default_handler

/**
    * stm32f446ret vector table
 */
 .section .isr_vector,"a",%progbits
 .type g_pfnVectors, %object
 .size g_pfnVectors, .-g_pfnVectors

 g_pfnVectors:
    .word _estack
    .word reset_handler
    .word nmi_handler
    .word hardfault_handler
    .word memmanage_handler
    .word busfault_handler
    .word usagefault_handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVC_Handler 
    .word	DebugMon_Handler
    .word	0
    .word	PendSV_Handler
    .word	SysTick_Handler
    .word	WWDG_IRQHandler              			/* Window Watchdog interrupt                                          */
    .word	PVD_IRQHandler               			/* PVD through EXTI line detection interrupt                          */
    .word	TAMP_STAMP_IRQHandler        			/* Tamper and TimeStamp interrupts through the EXTI line              */
    .word	RTC_WKUP_IRQHandler          			/* RTC Wakeup interrupt through the EXTI line                         */
    .word	FLASH_IRQHandler             			/* Flash global interrupt                                             */
    .word	RCC_IRQHandler               			/* RCC global interrupt                                               */
    .word	EXTI0_IRQHandler             			/* EXTI Line0 interrupt                                               */
    .word	EXTI1_IRQHandler             			/* EXTI Line1 interrupt                                               */
    .word	EXTI2_IRQHandler             			/* EXTI Line2 interrupt                                               */
    .word	EXTI3_IRQHandler             			/* EXTI Line3 interrupt                                               */
    .word	EXTI4_IRQHandler             			/* EXTI Line4 interrupt                                               */
    .word	DMA1_Stream0_IRQHandler      			/* DMA1 Stream0 global interrupt                                      */
    .word	DMA1_Stream1_IRQHandler      			/* DMA1 Stream1 global interrupt                                      */
    .word	DMA1_Stream2_IRQHandler      			/* DMA1 Stream2 global interrupt                                      */
    .word	DMA1_Stream3_IRQHandler      			/* DMA1 Stream3 global interrupt                                      */
    .word	DMA1_Stream4_IRQHandler      			/* DMA1 Stream4 global interrupt                                      */
    .word	DMA1_Stream5_IRQHandler      			/* DMA1 Stream5 global interrupt                                      */
    .word	DMA1_Stream6_IRQHandler      			/* DMA1 Stream6 global interrupt                                      */
    .word	ADC_IRQHandler               			/* ADC1 global interrupt                                              */
    .word	CAN1_TX_IRQHandler           			/* CAN1 TX interrupts                                                 */
    .word	CAN1_RX0_IRQHandler          			/* CAN1 RX0 interrupts                                                */
    .word	CAN1_RX1_IRQHandler          			/* CAN1 RX1 interrupts                                                */
    .word	CAN1_SCE_IRQHandler          			/* CAN1 SCE interrupt                                                 */
    .word	EXTI9_5_IRQHandler           			/* EXTI Line[9:5] interrupts                                          */
    .word	TIM1_BRK_TIM9_IRQHandler     			/* TIM1 Break interrupt and TIM9 global interrupt                     */
    .word	TIM1_UP_TIM10_IRQHandler     			/* TIM1 Update interrupt and TIM10 global interrupt                   */
    .word	TIM1_TRG_COM_TIM11_IRQHandler			/* TIM1 Trigger and Commutation interrupts and TIM11 global interrupt */
    .word	TIM1_CC_IRQHandler           			/* TIM1 Capture Compare interrupt                                     */
    .word	TIM2_IRQHandler              			/* TIM2 global interrupt                                              */
    .word	TIM3_IRQHandler              			/* TIM3 global interrupt                                              */
    .word	TIM4_IRQHandler              			/* TIM4 global interrupt                                              */
    .word	I2C1_EV_IRQHandler           			/* I2C1 event interrupt                                               */
    .word	I2C1_ER_IRQHandler           			/* I2C1 error interrupt                                               */
    .word	I2C2_EV_IRQHandler           			/* I2C2 event interrupt                                               */
    .word	I2C2_ER_IRQHandler           			/* I2C2 error interrupt                                               */
    .word	SPI1_IRQHandler              			/* SPI1 global interrupt                                              */
    .word	SPI2_IRQHandler              			/* SPI2 global interrupt                                              */
    .word	USART1_IRQHandler            			/* USART1 global interrupt                                            */
    .word	USART2_IRQHandler            			/* USART2 global interrupt                                            */
    .word	USART3_IRQHandler            			/* USART3 global interrupt                                            */
    .word	EXTI15_10_IRQHandler         			/* EXTI Line[15:10] interrupts                                        */
    .word	RTC_Alarm_IRQHandler         			/* RTC Alarms (A and B) through EXTI line interrupt                   */
    .word	OTG_FS_WKUP_IRQHandler       			/* USB On-The-Go FS Wakeup through EXTI line interrupt                */
    .word	TIM8_BRK_TIM12_IRQHandler    			/* TIM8 Break interrupt and TIM12 global interrupt                    */
    .word	TIM8_UP_TIM13_IRQHandler     			/* TIM8 Update interrupt and TIM13 global interrupt                   */
    .word	TIM8_TRG_COM_TIM14_IRQHandler			/* TIM8 Trigger and Commutation interrupts and TIM14 global interrupt */
    .word	TIM8_CC_IRQHandler           			/* TIM8 Capture Compare interrupt                                     */
    .word	DMA1_Stream7_IRQHandler      			/* DMA1 Stream7 global interrupt                                      */
    .word	FMC_IRQHandler               			/* FMC global interrupt                                               */
    .word	SDIO_IRQHandler              			/* SDIO global interrupt                                              */
    .word	TIM5_IRQHandler              			/* TIM5 global interrupt                                              */
    .word	SPI3_IRQHandler              			/* SPI3 global interrupt                                              */
    .word	UART4_IRQHandler             			/* UART4 global interrupt                                             */
    .word	UART5_IRQHandler             			/* UART5 global interrupt                                             */
    .word	TIM6_DAC_IRQHandler          			/* TIM6 global interrupt, DAC1 and DAC2 underrun error interrupt      */
    .word	TIM7_IRQHandler              			/* TIM7 global interrupt                                              */
    .word	DMA2_Stream0_IRQHandler      			/* DMA2 Stream0 global interrupt                                      */
    .word	DMA2_Stream1_IRQHandler      			/* DMA2 Stream1 global interrupt                                      */
    .word	DMA2_Stream2_IRQHandler      			/* DMA2 Stream2 global interrupt                                      */
    .word	DMA2_Stream3_IRQHandler      			/* DMA2 Stream3 global interrupt                                      */
    .word	DMA2_Stream4_IRQHandler      			/* DMA2 Stream4 global interrupt                                      */
    .word	0                            			/* Reserved                                                           */
    .word	0                            			/* Reserved                                                           */
    .word	CAN2_TX_IRQHandler           			/* CAN2 TX interrupts                                                 */
    .word	CAN2_RX0_IRQHandler          			/* CAN2 RX0 interrupts                                                */
    .word	CAN2_RX1_IRQHandler          			/* CAN2 RX1 interrupts                                                */
    .word	CAN2_SCE_IRQHandler          			/* CAN2 SCE interrupt                                                 */
    .word	OTG_FS_IRQHandler            			/* USB On The Go FS global interrupt                                  */
    .word	DMA2_Stream5_IRQHandler      			/* DMA2 Stream5 global interrupt                                      */
    .word	DMA2_Stream6_IRQHandler      			/* DMA2 Stream6 global interrupt                                      */
    .word	DMA2_Stream7_IRQHandler      			/* DMA2 Stream7 global interrupt                                      */
    .word	USART6_IRQHandler            			/* USART6 global interrupt                                            */
    .word	I2C3_EV_IRQHandler           			/* I2C3 event interrupt                                               */
    .word	I2C3_ER_IRQHandler           			/* I2C3 error interrupt                                               */
    .word	OTG_HS_EP1_OUT_IRQHandler    			/* USB On The Go HS End Point 1 Out                                   */
    .word	OTG_HS_EP1_IN_IRQHandler     			/* USB On The Go HS End Point 1 In                                    */
    .word	OTG_HS_WKUP_IRQHandler       			/* USB On The Go HS Wakeup                                            */
    .word	OTG_HS_IRQHandler            			/* USB On The Go HS global interrupt                                  */
    .word	DCMI_IRQHandler              			/* DCMI global interrupt                                              */
    .word	0                            			/* Reserved                                                           */
    .word	0                            			/* Reserved                                                           */
    .word	FPU_IRQHandler               			/* Floating point unit interrupt                                      */
    .word	0                            			/* Reserved                                                           */
    .word	0                            			/* Reserved                                                           */
    .word	SPI4_IRQHandler              			/* SPI 4 global interrupt                                             */
    .word	0                            			/* Reserved                                                           */
    .word	0                            			/* Reserved                                                           */
    .word	SAI1_IRQHandler              			/* SAI1 global interrupt                                              */
    .word	0                            			/* Reserved                                                           */
    .word	0                            			/* Reserved                                                           */
    .word	0                            			/* Reserved                                                           */
    .word	SAI2_IRQHandler              			/* SAI2 global interrupt                                              */
    .word	QuadSPI_IRQHandler           			/* QuadSPI global interrupt                                           */
    .word	HDMI_CEC_IRQHandler          			/* HDMI-CEC global interrupt                                          */
    .word	SPDIF_Rx_IRQHandler          			/* SPDIF-Rx global interrupt                                          */
    .word	FMPI2C1_IRQHandler           			/* FMPI2C1 event interrupt                                            */
    .word	FMPI2C1_error_IRQHandler     			/* FMPI2C1 error interrupt                                            */

    /*******************************************************************************
    *
    * Provide weak aliases for each Exception handler to the default_handler.
    * As they are weak aliases, any function with the same name will override
    * this definition.
    *
    *******************************************************************************/

        .weak	nmi_handler
        .thumb_set nmi_handler,default_handler

        .weak	hardfault_handler
        .thumb_set hardfault_handler,default_handler

        .weak	memmanage_handler
        .thumb_set memmanage_handler,default_handler

        .weak	busfault_handler
        .thumb_set busfault_handler,default_handler

        .weak	usagefault_handler
        .thumb_set usagefault_handler,default_handler

        .weak	SVC_Handler
        .thumb_set SVC_Handler,default_handler

        .weak	DebugMon_Handler
        .thumb_set DebugMon_Handler,default_handler

        .weak	PendSV_Handler
        .thumb_set PendSV_Handler,default_handler

        .weak	SysTick_Handler
        .thumb_set SysTick_Handler,default_handler

        .weak	WWDG_IRQHandler
        .thumb_set WWDG_IRQHandler,default_handler

        .weak	PVD_IRQHandler
        .thumb_set PVD_IRQHandler,default_handler

        .weak	TAMP_STAMP_IRQHandler
        .thumb_set TAMP_STAMP_IRQHandler,default_handler

        .weak	RTC_WKUP_IRQHandler
        .thumb_set RTC_WKUP_IRQHandler,default_handler

        .weak	FLASH_IRQHandler
        .thumb_set FLASH_IRQHandler,default_handler

        .weak	RCC_IRQHandler
        .thumb_set RCC_IRQHandler,default_handler

        .weak	EXTI0_IRQHandler
        .thumb_set EXTI0_IRQHandler,default_handler

        .weak	EXTI1_IRQHandler
        .thumb_set EXTI1_IRQHandler,default_handler

        .weak	EXTI2_IRQHandler
        .thumb_set EXTI2_IRQHandler,default_handler

        .weak	EXTI3_IRQHandler
        .thumb_set EXTI3_IRQHandler,default_handler

        .weak	EXTI4_IRQHandler
        .thumb_set EXTI4_IRQHandler,default_handler

        .weak	DMA1_Stream0_IRQHandler
        .thumb_set DMA1_Stream0_IRQHandler,default_handler

        .weak	DMA1_Stream1_IRQHandler
        .thumb_set DMA1_Stream1_IRQHandler,default_handler

        .weak	DMA1_Stream2_IRQHandler
        .thumb_set DMA1_Stream2_IRQHandler,default_handler

        .weak	DMA1_Stream3_IRQHandler
        .thumb_set DMA1_Stream3_IRQHandler,default_handler

        .weak	DMA1_Stream4_IRQHandler
        .thumb_set DMA1_Stream4_IRQHandler,default_handler

        .weak	DMA1_Stream5_IRQHandler
        .thumb_set DMA1_Stream5_IRQHandler,default_handler

        .weak	DMA1_Stream6_IRQHandler
        .thumb_set DMA1_Stream6_IRQHandler,default_handler

        .weak	ADC_IRQHandler
        .thumb_set ADC_IRQHandler,default_handler

        .weak	CAN1_TX_IRQHandler
        .thumb_set CAN1_TX_IRQHandler,default_handler

        .weak	CAN1_RX0_IRQHandler
        .thumb_set CAN1_RX0_IRQHandler,default_handler

        .weak	CAN1_RX1_IRQHandler
        .thumb_set CAN1_RX1_IRQHandler,default_handler

        .weak	CAN1_SCE_IRQHandler
        .thumb_set CAN1_SCE_IRQHandler,default_handler

        .weak	EXTI9_5_IRQHandler
        .thumb_set EXTI9_5_IRQHandler,default_handler

        .weak	TIM1_BRK_TIM9_IRQHandler
        .thumb_set TIM1_BRK_TIM9_IRQHandler,default_handler

        .weak	TIM1_UP_TIM10_IRQHandler
        .thumb_set TIM1_UP_TIM10_IRQHandler,default_handler

        .weak	TIM1_TRG_COM_TIM11_IRQHandler
        .thumb_set TIM1_TRG_COM_TIM11_IRQHandler,default_handler

        .weak	TIM1_CC_IRQHandler
        .thumb_set TIM1_CC_IRQHandler,default_handler

        .weak	TIM2_IRQHandler
        .thumb_set TIM2_IRQHandler,default_handler

        .weak	TIM3_IRQHandler
        .thumb_set TIM3_IRQHandler,default_handler

        .weak	TIM4_IRQHandler
        .thumb_set TIM4_IRQHandler,default_handler

        .weak	I2C1_EV_IRQHandler
        .thumb_set I2C1_EV_IRQHandler,default_handler

        .weak	I2C1_ER_IRQHandler
        .thumb_set I2C1_ER_IRQHandler,default_handler

        .weak	I2C2_EV_IRQHandler
        .thumb_set I2C2_EV_IRQHandler,default_handler

        .weak	I2C2_ER_IRQHandler
        .thumb_set I2C2_ER_IRQHandler,default_handler

        .weak	SPI1_IRQHandler
        .thumb_set SPI1_IRQHandler,default_handler

        .weak	SPI2_IRQHandler
        .thumb_set SPI2_IRQHandler,default_handler

        .weak	USART1_IRQHandler
        .thumb_set USART1_IRQHandler,default_handler

        .weak	USART2_IRQHandler
        .thumb_set USART2_IRQHandler,default_handler

        .weak	USART3_IRQHandler
        .thumb_set USART3_IRQHandler,default_handler

        .weak	EXTI15_10_IRQHandler
        .thumb_set EXTI15_10_IRQHandler,default_handler

        .weak	RTC_Alarm_IRQHandler
        .thumb_set RTC_Alarm_IRQHandler,default_handler

        .weak	OTG_FS_WKUP_IRQHandler
        .thumb_set OTG_FS_WKUP_IRQHandler,default_handler

        .weak	TIM8_BRK_TIM12_IRQHandler
        .thumb_set TIM8_BRK_TIM12_IRQHandler,default_handler

        .weak	TIM8_UP_TIM13_IRQHandler
        .thumb_set TIM8_UP_TIM13_IRQHandler,default_handler

        .weak	TIM8_TRG_COM_TIM14_IRQHandler
        .thumb_set TIM8_TRG_COM_TIM14_IRQHandler,default_handler

        .weak	TIM8_CC_IRQHandler
        .thumb_set TIM8_CC_IRQHandler,default_handler

        .weak	DMA1_Stream7_IRQHandler
        .thumb_set DMA1_Stream7_IRQHandler,default_handler

        .weak	FMC_IRQHandler
        .thumb_set FMC_IRQHandler,default_handler

        .weak	SDIO_IRQHandler
        .thumb_set SDIO_IRQHandler,default_handler

        .weak	TIM5_IRQHandler
        .thumb_set TIM5_IRQHandler,default_handler

        .weak	SPI3_IRQHandler
        .thumb_set SPI3_IRQHandler,default_handler

        .weak	UART4_IRQHandler
        .thumb_set UART4_IRQHandler,default_handler

        .weak	UART5_IRQHandler
        .thumb_set UART5_IRQHandler,default_handler

        .weak	TIM6_DAC_IRQHandler
        .thumb_set TIM6_DAC_IRQHandler,default_handler

        .weak	TIM7_IRQHandler
        .thumb_set TIM7_IRQHandler,default_handler

        .weak	DMA2_Stream0_IRQHandler
        .thumb_set DMA2_Stream0_IRQHandler,default_handler

        .weak	DMA2_Stream1_IRQHandler
        .thumb_set DMA2_Stream1_IRQHandler,default_handler

        .weak	DMA2_Stream2_IRQHandler
        .thumb_set DMA2_Stream2_IRQHandler,default_handler

        .weak	DMA2_Stream3_IRQHandler
        .thumb_set DMA2_Stream3_IRQHandler,default_handler

        .weak	DMA2_Stream4_IRQHandler
        .thumb_set DMA2_Stream4_IRQHandler,default_handler

        .weak	CAN2_TX_IRQHandler
        .thumb_set CAN2_TX_IRQHandler,default_handler

        .weak	CAN2_RX0_IRQHandler
        .thumb_set CAN2_RX0_IRQHandler,default_handler

        .weak	CAN2_RX1_IRQHandler
        .thumb_set CAN2_RX1_IRQHandler,default_handler

        .weak	CAN2_SCE_IRQHandler
        .thumb_set CAN2_SCE_IRQHandler,default_handler

        .weak	OTG_FS_IRQHandler
        .thumb_set OTG_FS_IRQHandler,default_handler

        .weak	DMA2_Stream5_IRQHandler
        .thumb_set DMA2_Stream5_IRQHandler,default_handler

        .weak	DMA2_Stream6_IRQHandler
        .thumb_set DMA2_Stream6_IRQHandler,default_handler

        .weak	DMA2_Stream7_IRQHandler
        .thumb_set DMA2_Stream7_IRQHandler,default_handler

        .weak	USART6_IRQHandler
        .thumb_set USART6_IRQHandler,default_handler

        .weak	I2C3_EV_IRQHandler
        .thumb_set I2C3_EV_IRQHandler,default_handler

        .weak	I2C3_ER_IRQHandler
        .thumb_set I2C3_ER_IRQHandler,default_handler

        .weak	OTG_HS_EP1_OUT_IRQHandler
        .thumb_set OTG_HS_EP1_OUT_IRQHandler,default_handler

        .weak	OTG_HS_EP1_IN_IRQHandler
        .thumb_set OTG_HS_EP1_IN_IRQHandler,default_handler

        .weak	OTG_HS_WKUP_IRQHandler
        .thumb_set OTG_HS_WKUP_IRQHandler,default_handler

        .weak	OTG_HS_IRQHandler
        .thumb_set OTG_HS_IRQHandler,default_handler

        .weak	DCMI_IRQHandler
        .thumb_set DCMI_IRQHandler,default_handler

        .weak	FPU_IRQHandler
        .thumb_set FPU_IRQHandler,default_handler

        .weak	SPI4_IRQHandler
        .thumb_set SPI4_IRQHandler,default_handler

        .weak	SAI1_IRQHandler
        .thumb_set SAI1_IRQHandler,default_handler

        .weak	SAI2_IRQHandler
        .thumb_set SAI2_IRQHandler,default_handler

        .weak	QuadSPI_IRQHandler
        .thumb_set QuadSPI_IRQHandler,default_handler

        .weak	HDMI_CEC_IRQHandler
        .thumb_set HDMI_CEC_IRQHandler,default_handler

        .weak	SPDIF_Rx_IRQHandler
        .thumb_set SPDIF_Rx_IRQHandler,default_handler

        .weak	FMPI2C1_IRQHandler
        .thumb_set FMPI2C1_IRQHandler,default_handler

        .weak	FMPI2C1_error_IRQHandler
        .thumb_set FMPI2C1_error_IRQHandler,default_handler

        .weak	SystemInit

/************************ (C) COPYRIGHT STMicroelectonics *****END OF FILE****/
