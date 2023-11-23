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
	.file	"playerCar.c"
	.text
	.align	2
	.global	initPlayerCar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayerCar, %function
initPlayerCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #16
	mov	r4, #10
	mov	lr, #0
	mov	r0, #1
	mov	r1, #3
	mov	r2, #30
	ldr	r3, .L4
	str	r4, [r3, #24]
	str	lr, [r3, #36]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #40]
	str	r1, [r3, #32]
	str	r2, [r3]
	str	r2, [r3, #4]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	playerCar
	.size	initPlayerCar, .-initPlayerCar
	.global	__aeabi_idivmod
	.align	2
	.global	drawPlayerCar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerCar, %function
drawPlayerCar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L10
	ldr	r3, [r4, #24]
	cmp	r3, #0
	subgt	r3, r3, #1
	ldr	r1, [r4, #36]
	strgt	r3, [r4, #24]
	bgt	.L8
	ldr	r3, .L10+4
	add	r0, r1, #1
	ldr	r1, [r4, #40]
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #36]
	str	r3, [r4, #24]
.L8:
	ldr	r2, .L10+8
	ldr	r0, [r2]
	ldr	r2, .L10+12
	ldr	r3, [r4]
	ldr	lr, [r2]
	ldr	r2, [r4, #4]
	sub	r3, r3, r0
	ldr	r0, [r4, #32]
	sub	r2, r2, lr
	lsl	r3, r3, #23
	ldr	lr, .L10+16
	ldr	ip, .L10+20
	lsr	r3, r3, #23
	add	r1, r0, r1, lsl #5
	and	lr, lr, r1, lsl #1
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	lr, [ip, #4]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r2, [ip]	@ movhi
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	playerCar
	.word	__aeabi_idivmod
	.word	hOff
	.word	vOff
	.word	1022
	.word	shadowOAM
	.size	drawPlayerCar, .-drawPlayerCar
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
