	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"mac.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	_main
	.syntax unified
	.arm
	.type	_main, %function
_main:
.LFB0:
	.file 1 "../mac.c"
	.loc 1 2 1 view -0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 3 5 view .LVU1
.LVL0:
	.loc 1 4 5 view .LVU2
	.loc 1 5 5 view .LVU3
	.loc 1 6 5 view .LVU4
	.loc 1 7 1 is_stmt 0 view .LVU5
	mov	r0, #0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	_main, .-_main
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x60
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1d
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1
	.byte	0x5
	.4byte	0x5c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c
	.uleb128 0x1
	.ascii	"a\000"
	.byte	0x3
	.4byte	0x5c
	.byte	0x2c
	.uleb128 0x1
	.ascii	"b\000"
	.byte	0x4
	.4byte	0x5c
	.byte	0x21
	.uleb128 0x1
	.ascii	"c\000"
	.byte	0x5
	.4byte	0x5c
	.byte	0x4d
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
.LASF0:
	.ascii	"GNU C17 11.3.1 20220712 -mcpu=arm7tdmi -mfloat-abi="
	.ascii	"soft -marm -march=armv4t -g -Og\000"
.LASF1:
	.ascii	"../mac.c\000"
.LASF3:
	.ascii	"_main\000"
.LASF2:
	.ascii	"/media/psf/stm/cf446/agdb\000"
	.ident	"GCC: (Arm GNU Toolchain 11.3.Rel1) 11.3.1 20220712"
