.global _start
_start:
  mov r0, #0x8
  ldr r1, =interrupt_table
  ldr r3, =interrupt_table_end
keep_loading:
  ldr r2, [r1, #0x0]
  str r2, [r0, #0x0]
  add r0, r0, #0x4
  add r1, r1, #0x4
  cmp r1, r3
  bne keep_loading

  ldr sp, =0x07FFFFFF
  bl kernel_entry
hang:
  bl hang

interrupt_table:
  ldr pc, svc_entry_address
  svc_entry_address: .word svc_entry_address
interrupt_table_end:
