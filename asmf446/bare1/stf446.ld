/**
    stm32f446ret -- flash = 512 kb
                 -- ram = 128 kb, using 112 kb instead
*/
_min_heap_size = 0x200 ;
_min_stack_size = 0x400 ;

ENTRY(_main)

MEMORY
{
    /*128K == 1f400, but it uses 20000 instead*/
    RAM(rxw)   : ORIGIN = 0x20000000,  LENGTH = 112K
    FLASH(rx)  : ORIGIN = 0x08000000,  LENGTH = 512K
}


/*_estack = ORIGIN(RAM) +LENGTH(RAM);*/


SECTIONS
{
    PROVIDE( _estack = ORIGIN(RAM) + LENGTH(RAM));
    .isr_vector : {
        . = ALIGN(4);
        KEEP(*(.isr_vector)); /**it will be ignored by gb collection*/
        /*. = ALIGN(4); */
    } > FLASH

    /** program code, and data into rom type memory*/
    .text : {
        . = ALIGN(4);
        *(.text)
        *(.text*)
        . = ALIGN(4);
        _etext = .;
    } > FLASH

    /*constant data into flash rom type momory*/
    .rodata : {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH

    /** start of initialized data, used by startup file */
    _sidata = LOADADDR(.data);

    /** .data section into ram type memory */
    .data : {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > RAM AT > FLASH

    /** uninitialized data into ram type */
    .bss : {
        . = ALIGN(4);
        _sbss = .;
        __bss_start__ = _sbss;
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
        __bss_end__ = _ebss;
    } > RAM AT > FLASH

    /** user heap stack section, used to check if there is enough "ram" type memory left */
    ._user_heap_stack : {
        . = ALIGN(8);
        PROVIDE(end = .);
        PROVIDE(_end = .);
        . = . + _min_heap_size;
        . = . + _min_stack_size;
        . = ALIGN(8);
    } > RAM AT > FLASH

    /** REMOVE INFORMATION FROM COMPILER LIBRARIES */
    /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    }

    .ARM.attributes 0: {*(.ARM.attributes)}
}