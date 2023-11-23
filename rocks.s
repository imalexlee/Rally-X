	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"rocks.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"init flags %d\000"
	.text
	.align	2
	.global	initRocks
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocks, %function
initRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r6, #264
	mov	r2, #16
	mov	r1, #1
	mov	r5, #128
	mov	r4, #288
	mov	lr, #320
	mov	ip, #160
	mov	r0, #400
	ldr	r3, .L4+12
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #48]
	str	lr, [r3, #52]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #112]
	str	r2, [r3, #116]
	str	ip, [r3, #96]
	str	r0, [r3, #100]
	str	r1, [r3, #44]
	str	r1, [r3, #92]
	str	r1, [r3, #140]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	rocks
	.size	initRocks, .-initRocks
	.align	2
	.global	initRocks2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocks2, %function
initRocks2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #1
	mov	r5, #384
	mov	r4, #176
	mov	lr, #24
	mov	ip, #288
	mov	r0, #248
	mov	r1, #336
	ldr	r3, .L8
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #48]
	str	r2, [r3, #44]
	str	r2, [r3, #92]
	str	r2, [r3, #140]
	str	ip, [r3, #52]
	str	r0, [r3, #96]
	str	r1, [r3, #100]
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	rocks
	.size	initRocks2, .-initRocks2
	.align	2
	.global	drawRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRocks, %function
drawRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	ip, #512
	mov	r7, #20
	ldr	r3, .L18
	ldr	r2, .L18+4
	ldr	lr, [r3]
	ldr	r3, .L18+8
	ldrh	r6, [r2]
	lsl	r4, lr, #16
	ldr	r2, .L18+12
	ldr	r5, .L18+16
	lsr	r4, r4, #16
	add	r0, r3, #144
.L15:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	strheq	ip, [r2, #160]	@ movhi
	beq	.L14
	ldr	r8, [r3, #4]
	ldr	r1, [r3, #20]
	sub	r9, r8, lr
	rsb	r1, r1, #0
	cmp	r9, r1
	movgt	r1, #1
	movle	r1, #0
	cmp	r9, #159
	movgt	r1, #0
	cmp	r1, #0
	ldr	r1, [r3]
	subne	r8, r8, r4
	sub	r1, r1, r6
	andne	r8, r8, #255
	and	r1, r1, r5
	strhne	r8, [r2, #160]	@ movhi
	strheq	ip, [r2, #160]	@ movhi
	strh	r7, [r2, #164]	@ movhi
	strh	r1, [r2, #162]	@ movhi
.L14:
	add	r3, r3, #48
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L15
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	vOff
	.word	hOff
	.word	rocks
	.word	shadowOAM
	.word	511
	.size	drawRocks, .-drawRocks
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
