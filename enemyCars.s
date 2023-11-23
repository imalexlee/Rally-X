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
	.file	"enemyCars.c"
	.text
	.align	2
	.global	initEnemyCars
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyCars, %function
initEnemyCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r1, .L6
	push	{r4, r5, lr}
	mov	r3, r1
	mov	r5, r2
	mov	ip, #16
	mov	r0, #1
	mov	r4, #10
	mov	lr, #3
.L2:
	str	r2, [r3, #32]
	add	r2, r2, #1
	cmp	r2, #3
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r4, [r3, #24]
	str	lr, [r3, #40]
	str	r5, [r3, #36]
	add	r3, r3, #48
	bne	.L2
	mov	lr, #120
	mov	r3, #376
	mov	ip, #280
	mov	r0, #288
	mov	r2, #216
	str	lr, [r1]
	str	ip, [r1, #4]
	str	r0, [r1, #48]
	str	r3, [r1, #52]
	str	r3, [r1, #96]
	str	r2, [r1, #100]
	pop	{r4, r5, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	enemyCars
	.size	initEnemyCars, .-initEnemyCars
	.align	2
	.global	initEnemyCars2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyCars2, %function
initEnemyCars2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #432
	mov	r4, #136
	mov	lr, #232
	mov	r0, #248
	mov	r1, #192
	mov	r2, #376
	ldr	r3, .L10
	stm	r3, {r4, lr}
	str	ip, [r3, #48]
	str	r0, [r3, #52]
	str	r1, [r3, #96]
	str	r2, [r3, #100]
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	enemyCars
	.size	initEnemyCars2, .-initEnemyCars2
	.global	__aeabi_idivmod
	.align	2
	.global	drawEnemyCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyCars, %function
drawEnemyCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #512
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L20
	ldr	r1, .L20+4
	ldr	r6, [r3]
	ldr	r4, .L20+8
	lsl	fp, r6, #16
	ldrh	r10, [r1]
	ldr	r5, .L20+12
	ldr	r9, .L20+16
	ldr	r8, .L20+20
	lsr	fp, fp, #16
	add	r7, r4, #144
.L17:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	sub	r3, r3, #1
	ble	.L13
	str	r3, [r4, #24]
	ldr	r0, [r4, #36]
.L14:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #20]
	sub	ip, r1, r6
	rsb	r3, r3, #0
	cmp	ip, r3
	movgt	r3, #1
	movle	r3, #0
	cmp	ip, #159
	movgt	r3, #0
	ldr	ip, [r4]
	cmp	r3, #0
	ldr	r3, [r4, #32]
	subne	r1, r1, fp
	sub	ip, ip, r10
	add	r3, r3, #4
	andne	r1, r1, #255
	and	ip, ip, r9
	add	r3, r3, r0, lsl #5
	add	r4, r4, #48
	strhne	r1, [r5, #8]	@ movhi
	strheq	r2, [r5, #8]	@ movhi
	orr	ip, ip, #16384
	and	r3, r8, r3, lsl #1
	cmp	r7, r4
	strh	ip, [r5, #10]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	add	r5, r5, #8
	bne	.L17
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L13:
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	ldr	r3, .L20+24
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	mov	r0, r1
	mov	r2, #512
	str	r3, [r4, #24]
	str	r1, [r4, #36]
	b	.L14
.L21:
	.align	2
.L20:
	.word	vOff
	.word	hOff
	.word	enemyCars
	.word	shadowOAM
	.word	511
	.word	1022
	.word	__aeabi_idivmod
	.size	drawEnemyCars, .-drawEnemyCars
	.comm	boundedY,4,4
	.comm	boundedX,4,4
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
