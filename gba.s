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
	.file	"gba.c"
	.text
	.align	2
	.global	collision
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L5
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L8
.L5:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L8:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L5
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	ezSpriteCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	ezSpriteCollision, %function
ezSpriteCollision:
	@ Function supports interworking.
	@ args = 96, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, lr}
	add	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	ldr	r1, [sp, #60]
	ldr	r3, [sp, #76]
	ldr	r2, [sp, #12]
	add	r3, r1, r3
	cmp	r2, r3
	add	r4, sp, #24
	ldr	ip, [sp, #8]
	ldm	r4, {r4, lr}
	ldr	r0, [sp, #56]
	ldr	r3, [sp, #72]
	bge	.L13
	add	r2, r2, lr
	cmp	r1, r2
	blt	.L15
.L13:
	pop	{r4, lr}
	mov	r0, #0
	add	sp, sp, #16
	bx	lr
.L15:
	add	r3, r0, r3
	cmp	ip, r3
	bge	.L13
	add	ip, ip, r4
	pop	{r4, lr}
	cmp	r0, ip
	movge	r0, #0
	movlt	r0, #1
	add	sp, sp, #16
	bx	lr
	.size	ezSpriteCollision, .-ezSpriteCollision
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L17:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L17
	mov	r2, #67108864
.L18:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L18
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L24
	ldr	lr, [ip]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
