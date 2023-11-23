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
	.file	"score.c"
	.text
	.align	2
	.global	initScore
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScore, %function
initScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #8
	mov	r1, #5
	mov	lr, #220
	mov	ip, #210
	mov	r0, #200
	ldr	r3, .L4
	str	lr, [r3]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #112]
	str	r2, [r3, #116]
	str	ip, [r3, #48]
	str	r0, [r3, #96]
	str	r1, [r3, #4]
	str	r1, [r3, #52]
	str	r1, [r3, #100]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	scores
	.size	initScore, .-initScore
	.align	2
	.global	pow
	.syntax unified
	.arm
	.fpu softvfp
	.type	pow, %function
pow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	mov	r2, r0
	ble	.L9
	mov	r3, #0
	mov	r0, #1
.L8:
	add	r3, r3, #1
	cmp	r1, r3
	mul	r0, r2, r0
	bne	.L8
	bx	lr
.L9:
	mov	r0, #1
	bx	lr
	.size	pow, .-pow
	.global	__aeabi_idiv
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L18
	mov	r5, #0
	mov	r1, #1
	ldr	r10, .L18+4
	ldr	fp, [r3]
	ldr	r6, .L18+8
	ldr	r4, .L18+12
	ldr	r9, .L18+16
	ldr	r8, .L18+20
	ldr	r7, .L18+24
	b	.L13
.L15:
	cmp	r5, #2
	movne	r1, #10
	moveq	r1, #100
	add	r6, r6, #48
	add	r4, r4, #8
.L13:
	mov	r0, fp
	mov	lr, pc
	bx	r9
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	ldr	r2, [r6]
	sub	r3, r0, r3, lsl #1
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
	add	r5, r5, #1
	and	r2, r2, r7
	add	r0, r3, #192
	cmp	r5, #3
	str	r3, [r10], #4
	strh	r0, [r4, #4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	bne	.L15
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	score
	.word	scoreValues
	.word	scores
	.word	shadowOAM+480
	.word	__aeabi_idiv
	.word	1717986919
	.word	511
	.size	drawScore, .-drawScore
	.comm	scoreValues,12,4
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
