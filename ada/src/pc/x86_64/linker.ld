OUTPUT_FORMAT(elf64-x86-64)

STARTUP(boot.o)

ENTRY(boot)

SECTIONS
{
  . = 0x00100000;

  .text :{
    code = .; _code = .; __code = .;
    *(.text)
    *(.rodata)
  }

  .rodata ALIGN(0x1000) : {
    *(.rodata)
  }

  .data ALIGN(0x1000) : {
    data = .; _data = .; __data = .;
    *(.data)
  }

  .bss : {
    sbss = .;
    bss = .; _bss = .; __bss = .;
    *(COMMON)
    *(.bss)
    ebss = .;
  }

  end = .; _end = .; __end = .;
}
