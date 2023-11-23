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
	.file	"smoke.c"
	.text
	.align	2
	.global	initSmoke
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSmoke, %function
initSmoke:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #16
	mov	r2, #0
	mov	ip, #100
	mov	r0, #4
	ldr	r3, .L3
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #40]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	bx	lr
.L4:
	.align	2
.L3:
	.word	smoke
	.size	initSmoke, .-initSmoke
	.global	__aeabi_idivmod
	.align	2
	.global	drawSmoke
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSmoke, %function
drawSmoke:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L20
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L6
	ldr	r3, .L20+4
	ldr	r1, .L20+8
	ldr	r2, .L20+12
	ldr	r3, [r3]
	ldr	r5, [r1]
	ldr	r6, [r2]
	ldr	r7, [r4, #20]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L7
.L9:
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L8
.L12:
	ldr	r3, .L20+16
	ldr	r3, [r3, #20]
	add	r3, r3, r6
	str	r5, [r4]
	str	r3, [r4, #4]
.L7:
	ldr	r2, [r4, #24]
	cmp	r2, #0
	ldr	r1, [r4, #36]
	ble	.L13
.L19:
	sub	r2, r2, #1
	add	r3, r2, r2, lsl #1
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r0, .L20+20
	add	r3, r3, r3, lsl #16
	add	r3, r2, r3, lsl #2
	cmp	r0, r3, ror #1
	str	r2, [r4, #24]
	bcc	.L14
	add	r0, r1, #1
	ldr	r3, .L20+24
	ldr	r1, [r4, #40]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
	b	.L14
.L13:
	mov	r2, #0
	mov	r3, #100
	str	r2, [r4, #44]
	str	r3, [r4, #24]
.L14:
	ldr	r3, .L20+28
	ldr	r2, [r3]
	rsb	r3, r7, #0
	sub	r2, r6, r2
	cmp	r2, r3
	movgt	r3, #1
	movle	r3, #0
	cmp	r2, #159
	movgt	r3, #0
	cmp	r3, #0
	moveq	r2, #512
	ldr	r3, .L20+32
	ldr	r3, [r3]
	ldr	r0, [r4, #32]
	sub	r3, r5, r3
	ldr	lr, .L20+36
	add	r0, r0, #8
	lsl	r3, r3, #23
	ldr	ip, .L20+40
	add	r1, r0, r1, lsl #5
	lsr	r3, r3, #23
	and	r1, lr, r1, lsl #1
	andne	r2, r2, #255
	orr	r3, r3, #16384
	strh	r1, [ip, #36]	@ movhi
	strh	r2, [ip, #32]	@ movhi
	strh	r3, [ip, #34]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L6:
	mov	r2, #512
	ldr	r3, .L20+16
	ldr	r1, .L20+8
	ldm	r3, {r4, lr}
	ldr	r0, [r3, #32]
	str	r4, [r1]
	ldr	ip, .L20+12
	ldr	r1, .L20+4
	ldr	r3, .L20+40
	str	lr, [ip]
	str	r0, [r1]
	strh	r2, [r3, #32]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	ldr	r2, [r4, #24]
	sub	r3, r6, r7
	cmp	r2, #0
	str	r5, [r4]
	str	r3, [r4, #4]
	ldr	r1, [r4, #36]
	bgt	.L19
	b	.L13
.L10:
	ldr	r3, .L20+16
	ldr	r2, [r4, #24]
	ldr	r3, [r3, #16]
	cmp	r2, #0
	add	r3, r3, r5
	stm	r4, {r3, r6}
	ldr	r1, [r4, #36]
	bgt	.L19
	b	.L13
.L8:
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #24]
	sub	r3, r5, r3
	cmp	r2, #0
	stm	r4, {r3, r6}
	ldr	r1, [r4, #36]
	bgt	.L19
	b	.L13
.L21:
	.align	2
.L20:
	.word	smoke
	.word	currAniState
	.word	currX
	.word	currY
	.word	playerCar
	.word	429496729
	.word	__aeabi_idivmod
	.word	vOff
	.word	hOff
	.word	1022
	.word	shadowOAM
	.size	drawSmoke, .-drawSmoke
	.comm	currAniState,4,4
	.comm	currY,4,4
	.comm	currX,4,4
	.comm	shadowOAM,1024,4
	.comm	playerCar,48,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
