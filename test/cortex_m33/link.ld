ENTRY(main)
MEMORY {
    FLASH (rx) : ORIGIN = 0x10000000, LENGTH = 2048K
    SRAM (rwx) : ORIGIN = 0x30000000, LENGTH = 512K
}
SECTIONS {
    .text : { *(.text*) } > FLASH
    .data : { *(.data*) } > SRAM AT > FLASH
    .bss : { *(.bss*) } > SRAM
}
