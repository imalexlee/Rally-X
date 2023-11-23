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
	.file	"hearts.c"
	.text
	.align	2
	.global	initHearts
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHearts, %function
initHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #16
	mov	r1, #140
	mov	lr, #5
	mov	ip, #23
	mov	r0, #41
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
	.word	hearts
	.size	initHearts, .-initHearts
	.align	2
	.global	drawHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHearts, %function
drawHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #512
	mov	r5, #21
	ldr	r3, .L12
	ldr	r1, .L12+4
	ldr	ip, [r3]
	ldr	r4, .L12+8
	ldr	r3, .L12+12
.L9:
	cmp	ip, r2
	ldrgt	r0, [r1]
	ldrbgt	lr, [r1, #4]	@ zero_extendqisi2
	andgt	r0, r0, r4
	orrgt	r0, r0, #16384
	add	r2, r2, #1
	strhgt	r5, [r3, #4]	@ movhi
	strhgt	r0, [r3, #2]	@ movhi
	strhgt	lr, [r3]	@ movhi
	strhle	r6, [r3]	@ movhi
	cmp	r2, #3
	add	r1, r1, #48
	add	r3, r3, #8
	bne	.L9
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	lives
	.word	hearts
	.word	511
	.word	shadowOAM+320
	.size	drawHearts, .-drawHearts
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
