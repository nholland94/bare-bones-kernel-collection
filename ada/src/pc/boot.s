.set ALIGN,    1<<0
.set MEMINFO,  1<<1
.set FLAGS,    ALIGN | MEMINFO
.set MAGIC,    0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)

header:
.align 4, 0x90
.long MAGIC
.long FLAGS
.long CHECKSUM

.set STACKSIZE, 0x4000
.lcomm stack, STACKSIZE

.comm mdb, 4
.comm magic, 4

.global boot
boot:

  mov  $0xB8000, %ebx
  mov  $0x3, %eax
  shl  $4, %eax
  or   $0x4, %eax
  mov  %eax, (%ebx)

  movl $(stack + STACKSIZE), %esp
  movl %eax, magic
  movl %ebx, mdb

  call main

  cli

hang:
  hlt
  jmp hang
