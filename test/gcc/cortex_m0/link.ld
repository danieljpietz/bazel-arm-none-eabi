ENTRY(main)
MEMORY {
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 32K
    SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 8K
}
SECTIONS {
    .text : { *(.text*) } > FLASH
    .data : { *(.data*) } > SRAM AT > FLASH
    .bss : { *(.bss*) } > SRAM
}
