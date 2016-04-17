	.arch armv6
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"kernel_dats.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	kernel_main
	.type	kernel_main, %function
kernel_main:
.LFB289:
	.file 1 "kernel_dats.c"
	.loc 1 200 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L2:
.LVL0:
.LBB4:
.LBB5:
	.loc 1 179 0
	mov	r3, #753664
	mov	r2, #576
	strh	r2, [r3]	@ movhi
	bx	lr
.LBE5:
.LBE4:
	.cfi_endproc
.LFE289:
	.size	kernel_main, .-kernel_main
	.align	2
	.global	kernel_entry
	.type	kernel_entry, %function
kernel_entry:
.LFB290:
	.loc 1 253 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 254 0
	b	kernel_main(PLT)
.LVL1:
	.cfi_endproc
.LFE290:
	.size	kernel_entry, .-kernel_entry
	.comm	tmpret0,4,4
.Letext0:
	.file 2 "/usr/lib/gcc/arm-none-eabi/4.8/include/stddef.h"
	.file 3 "/usr/include/newlib/machine/_default_types.h"
	.file 4 "/usr/include/newlib/stdint.h"
	.file 5 "./pats_ccomp.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x189
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x1
	.4byte	.LASF24
	.4byte	.LASF25
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x2
	.byte	0x93
	.4byte	0x25
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2b
	.4byte	0x56
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x36
	.4byte	0x9b
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x1
	.byte	0xae
	.byte	0x1
	.4byte	0xfc
	.uleb128 0x7
	.ascii	"x\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x25
	.uleb128 0x7
	.ascii	"y\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x1
	.byte	0xae
	.4byte	0x64
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0xb0
	.4byte	0xa6
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb1
	.4byte	0x25
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0xb2
	.4byte	0x90
	.byte	0
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0xc7
	.4byte	.LFB289
	.4byte	.LFE289-.LFB289
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15c
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0xd0
	.4byte	.L2
	.uleb128 0xc
	.4byte	0xb1
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0xd4
	.uleb128 0xd
	.4byte	0xcf
	.byte	0x40
	.uleb128 0xd
	.4byte	0xc6
	.byte	0
	.uleb128 0xd
	.4byte	0xbd
	.byte	0
	.uleb128 0xe
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xf
	.4byte	0xda
	.2byte	0x240
	.uleb128 0x10
	.4byte	0xe5
	.byte	0
	.uleb128 0x10
	.4byte	0xf0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0xfd
	.4byte	.LFB290
	.4byte	.LFE290-.LFB290
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17b
	.uleb128 0x11
	.4byte	.LVL1
	.4byte	0xfc
	.byte	0
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x5
	.byte	0x10
	.4byte	0x87
	.uleb128 0x5
	.byte	0x3
	.4byte	tmpret0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"short int\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF21:
	.ascii	"kernel_main\000"
.LASF15:
	.ascii	"__uint16_t\000"
.LASF27:
	.ascii	"__patsflab_kernel_main\000"
.LASF19:
	.ascii	"index\000"
.LASF23:
	.ascii	"GNU C 4.8.4 20141219 (release) -march=armv6 -mfloat"
	.ascii	"-abi=soft -mapcs-frame -marm -g -O2 -fPIC\000"
.LASF10:
	.ascii	"float\000"
.LASF3:
	.ascii	"long long int\000"
.LASF1:
	.ascii	"long int\000"
.LASF20:
	.ascii	"offset\000"
.LASF17:
	.ascii	"character\000"
.LASF12:
	.ascii	"long double\000"
.LASF28:
	.ascii	"tmpret0\000"
.LASF7:
	.ascii	"unsigned char\000"
.LASF26:
	.ascii	"output_char_at\000"
.LASF9:
	.ascii	"signed char\000"
.LASF4:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF16:
	.ascii	"uint16_t\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"char\000"
.LASF2:
	.ascii	"long unsigned int\000"
.LASF11:
	.ascii	"double\000"
.LASF24:
	.ascii	"kernel_dats.c\000"
.LASF18:
	.ascii	"cell\000"
.LASF25:
	.ascii	"/home/nathan/bare-bones-kernel-collection/ats2\000"
.LASF14:
	.ascii	"ptrdiff_t\000"
.LASF22:
	.ascii	"kernel_entry\000"
	.ident	"GCC: (4.8.4-1+11-1) 4.8.4 20141219 (release)"
