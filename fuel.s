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
	.file	"fuel.c"
	.text
	.align	2
	.global	initFuel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFuel, %function
initFuel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #5
	mov	r1, #8
	mov	r0, r2
	ldr	r3, .L6
.L2:
	str	r2, [r3]
	add	r2, r2, #8
	cmp	r2, #85
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #4]
	add	r3, r3, #48
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	fuels
	.size	initFuel, .-initFuel
	.global	__aeabi_idivmod
	.align	2
	.global	drawFuel
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFuel, %function
drawFuel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	ldr	r2, .L19
	ldr	r3, .L19+4
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	mov	r9, #512
	mov	r3, r6
	mov	r8, #23
	ldr	r10, .L19+12
	ldr	r4, .L19+16
	ldr	lr, [r10]
	ldr	r2, .L19+20
	ldr	r5, .L19+24
	ldr	r7, .L19+28
.L12:
	smull	ip, r0, r5, lr
	asr	ip, lr, #31
	rsb	r0, ip, r0, asr #2
	cmp	r0, r3
	ldrgt	r0, [r4]
	ldrbgt	ip, [r4, #4]	@ zero_extendqisi2
	andgt	r0, r0, r7
	strhgt	r8, [r2, #4]	@ movhi
	strhgt	r0, [r2, #2]	@ movhi
	strhgt	ip, [r2]	@ movhi
	strhle	r9, [r2]	@ movhi
	add	r3, r3, #1
	cmp	r1, #0
	moveq	r6, #1
	subeq	lr, lr, #1
	cmp	r3, #10
	add	r4, r4, #48
	add	r2, r2, #8
	bne	.L12
	cmp	r6, #0
	strne	lr, [r10]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	gameCounter
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.word	fuelLevel
	.word	fuels
	.word	shadowOAM+720
	.word	1717986919
	.word	511
	.size	drawFuel, .-drawFuel
	.global	FUEL_EFFICIENCY
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	FUEL_EFFICIENCY, %object
	.size	FUEL_EFFICIENCY, 4
FUEL_EFFICIENCY:
	.word	750
	.ident	"GCC: (devkitARM release 53) 9.1.0"
