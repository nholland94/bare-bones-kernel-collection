SECTIONS {
  . = 1M;

  .text : ALIGN(4K) {
    *(.multiboot)
    *(.text)
  }

  .rodata BLOCK(4K) : ALIGN(4K) {
    *(.rodata)
  }

  .data : ALIGN(4K) {
    *(.data)
  }

  .bss : ALIGN(4K) {
    *(COMMON)
    *(.bss)
    *(.bootstrap_stack)
  }
}
