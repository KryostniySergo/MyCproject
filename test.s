	.arch armv8.4-a+fp16+sb+ssbs
	.build_version macos,  11, 0
	.text
	.cstring
	.align	3
lC0:
	.ascii "raylib [shapes] example - cubic-bezier lines\0"
	.align	3
lC1:
	.ascii "MOVE START-END POINTS WITH MOUSE\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 4,,15
	.globl _main
_main:
LFB0:
	stp	x29, x30, [sp, -160]!
LCFI0:
	mov	w0, 32
	mov	x29, sp
LCFI1:
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
LCFI2:
	mov	x22, 1106247680
	mov	x21, 140737488388096
	movk	x21, 0x4440, lsl 16
	movk	x22, 0x41f0, lsl 48
	movk	x21, 0x440e, lsl 48
	stp	x23, x24, [sp, 48]
LCFI3:
	mov	w24, 0
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	str	d12, [sp, 128]
LCFI4:
	bl	_SetConfigFlags
	mov	w1, 600
	mov	w0, 800
	adrp	x2, lC0@PAGE
	add	x2, x2, lC0@PAGEOFF;
	bl	_InitWindow
	mov	w0, 60
	bl	_SetTargetFPS
	adrp	x26, lC1@PAGE
	add	x0, x26, lC1@PAGEOFF;
	str	wzr, [x29, 152]
	str	x0, [x29, 144]
	b	L2
	.p2align 2,,3
L3:
	mov	w0, 0
	bl	_IsMouseButtonDown
	tbz	x0, 0, L6
L9:
	mov	w0, 0
	mov	x22, x25
	bl	_IsMouseButtonReleased
	eor	w23, w0, 1
	ldr	w0, [x29, 152]
	and	w24, w23, 255
	lsr	x19, x25, 32
	and	w23, w23, 1
	and	w8, w0, 1
	tbnz	x0, 0, L8
L10:
	str	w8, [x29, 156]
	mov	w26, 241
	bl	_BeginDrawing
	mov	w0, 62965
	movk	w0, 0xfff5, lsl 16
	bl	_ClearBackground
	ldr	x0, [x29, 144]
	mov	w3, 20
	mov	w2, w3
	mov	w1, 15
	mov	w4, 33410
	movk	w4, 0xff82, lsl 16
	bl	_DrawText
	lsr	x0, x21, 32
	fmov	s8, w19
	lsr	w2, w21, 0
	lsr	w1, w22, 0
	fmov	s10, w0
	fmov	s4, 4.0e+0
	fmov	s2, w2
	mov	w0, 30976
	movk	w0, 0xfff1, lsl 16
	fmov	s0, w1
	mov	w19, 55
	fmov	s1, s8
	fmov	s3, s10
	bl	_DrawLineBezier
	fmov	s9, w20
	lsr	w1, w22, 0
	lsr	w0, w25, 0
	fmov	s3, s8
	fmov	s2, w1
	fmov	s4, 1.0e+1
	fmov	s0, w0
	mov	w20, 41
	fmov	s1, s9
	bl	_CheckCollisionPointCircle
	fmov	s11, 8.0e+0
	fmov	s12, 1.4e+1
	tst	x0, 1
	mov	w1, 230
	mov	w3, 121
	lsr	w0, w22, 0
	fmov	s1, s8
	fcsel	s2, s11, s12, eq
	cmp	w23, 0
	csel	w4, w1, wzr, ne
	bfi	w28, w4, 0, 8
	csel	w9, w20, w3, ne
	csel	w4, w19, w26, ne
	bfi	w28, w9, 8, 8
	fmov	s0, w0
	bfi	w28, w4, 16, 8
	orr	w28, w28, -16777216
	mov	w0, w28
	bl	_DrawCircleV
	lsr	w5, w25, 0
	lsr	w0, w21, 0
	fmov	s1, s9
	fmov	s4, 1.0e+1
	fmov	s0, w5
	fmov	s3, s10
	fmov	s2, w0
	bl	_CheckCollisionPointCircle
	ldr	w8, [x29, 156]
	tst	x0, 1
	lsr	w4, w21, 0
	mov	w1, 230
	mov	w3, 121
	fmov	s1, s10
	fcsel	s2, s11, s12, eq
	fmov	s0, w4
	cmp	w8, 0
	csel	w1, w1, wzr, ne
	bfi	w27, w1, 0, 8
	csel	w20, w20, w3, ne
	csel	w19, w19, w26, ne
	bfi	w27, w20, 8, 8
	bfi	w27, w19, 16, 8
	orr	w27, w27, -16777216
	mov	w0, w27
	bl	_DrawCircleV
	bl	_EndDrawing
L2:
	bl	_WindowShouldClose
	tbnz	x0, 0, L34
	bl	_GetMousePosition
	lsr	w0, w22, 0
	fmov	x25, d0
	lsr	x19, x22, 32
	fmov	s4, 1.0e+1
	fmov	s2, w0
	fmov	w0, s1
	fmov	s3, w19
	bfi	x25, x0, 32, 32
	lsr	x20, x25, 32
	lsr	w0, w25, 0
	fmov	s1, w20
	fmov	s0, w0
	bl	_CheckCollisionPointCircle
	tbnz	x0, 0, L3
L6:
	lsr	x0, x21, 32
	lsr	w2, w21, 0
	lsr	w1, w25, 0
	fmov	s1, w20
	fmov	s3, w0
	fmov	s2, w2
	fmov	s0, w1
	fmov	s4, 1.0e+1
	bl	_CheckCollisionPointCircle
	tbnz	x0, 0, L35
L5:
	and	w23, w24, 1
	tbnz	x24, 0, L9
	ldr	w0, [x29, 152]
	and	w8, w0, 1
	tbz	x0, 0, L10
L8:
	mov	w0, 0
	mov	x21, x25
	bl	_IsMouseButtonReleased
	eor	w8, w0, 1
	and	w0, w8, 255
	and	w8, w8, 1
	str	w0, [x29, 152]
	b	L10
	.p2align 2,,3
L35:
	mov	w0, 0
	bl	_IsMouseButtonDown
	tbz	x0, 0, L5
	and	w23, w24, 1
	tbz	x24, 0, L8
	mov	w0, 0
	mov	x22, x25
	bl	_IsMouseButtonReleased
	eor	w23, w0, 1
	lsr	x19, x25, 32
	and	w24, w23, 255
	and	w23, w23, 1
	b	L8
	.p2align 2,,3
L34:
	bl	_CloseWindow
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldr	d12, [sp, 128]
	ldp	x29, x30, [sp], 160
LCFI5:
	ret
LFE0:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x3
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB0-.
	.set L$set$2,LFE0-LFB0
	.quad L$set$2
	.uleb128 0
	.byte	0x4
	.set L$set$3,LCFI0-LFB0
	.long L$set$3
	.byte	0xe
	.uleb128 0xa0
	.byte	0x9d
	.uleb128 0x14
	.byte	0x9e
	.uleb128 0x13
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0x93
	.uleb128 0x12
	.byte	0x94
	.uleb128 0x11
	.byte	0x95
	.uleb128 0x10
	.byte	0x96
	.uleb128 0xf
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0x97
	.uleb128 0xe
	.byte	0x98
	.uleb128 0xd
	.byte	0x4
	.set L$set$7,LCFI4-LCFI3
	.long L$set$7
	.byte	0x99
	.uleb128 0xc
	.byte	0x9a
	.uleb128 0xb
	.byte	0x9b
	.uleb128 0xa
	.byte	0x9c
	.uleb128 0x9
	.byte	0x5
	.uleb128 0x48
	.uleb128 0x8
	.byte	0x5
	.uleb128 0x49
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x4a
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x4b
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x4c
	.uleb128 0x4
	.byte	0x4
	.set L$set$8,LCFI5-LCFI4
	.long L$set$8
	.byte	0xde
	.byte	0xdd
	.byte	0xdb
	.byte	0xdc
	.byte	0xd9
	.byte	0xda
	.byte	0xd7
	.byte	0xd8
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0x6
	.uleb128 0x4c
	.byte	0x6
	.uleb128 0x4a
	.byte	0x6
	.uleb128 0x4b
	.byte	0x6
	.uleb128 0x48
	.byte	0x6
	.uleb128 0x49
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LEFDE1:
	.ident	"GCC: (GNU) 13.3.0"
	.subsections_via_symbols
