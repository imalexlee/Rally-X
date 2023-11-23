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
	.file	"flags.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"init flags %d\000"
	.text
	.align	2
	.global	initFlags
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlags, %function
initFlags:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L6
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r0, .L6+4
	ldr	r3, .L6+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+12
	mov	r1, #16
	mov	r2, r3
	mov	ip, #1
	add	r0, r3, #480
.L2:
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	ip, [r2, #44]
	add	r2, r2, #48
	cmp	r2, r0
	bne	.L2
	mov	r2, #384
	mov	r4, #312
	mov	lr, #40
	mov	fp, #144
	mov	r10, #32
	mov	r9, #136
	mov	ip, #120
	mov	r0, #240
	mov	r1, #376
	mov	r8, #208
	mov	r7, #304
	mov	r6, #152
	mov	r5, #432
	str	r2, [r3, #336]
	str	r2, [r3, #432]
	mov	r2, #456
	str	fp, [r3]
	str	r10, [r3, #4]
	str	r4, [r3, #48]
	str	r4, [r3, #144]
	str	lr, [r3, #52]
	str	lr, [r3, #192]
	str	r9, [r3, #96]
	str	ip, [r3, #100]
	str	ip, [r3, #148]
	str	r0, [r3, #196]
	str	r0, [r3, #244]
	str	r1, [r3, #240]
	str	r1, [r3, #340]
	str	r8, [r3, #288]
	str	r7, [r3, #292]
	str	r6, [r3, #384]
	str	r5, [r3, #388]
	str	r2, [r3, #436]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	flags
	.size	initFlags, .-initFlags
	.align	2
	.global	initFlags2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlags2, %function
initFlags2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L12
	mov	r0, #1
	mov	r2, r3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r1, r3, #480
.L9:
	str	r0, [r2, #44]
	add	r2, r2, #48
	cmp	r2, r1
	bne	.L9
	mov	r2, #144
	str	r2, [r3, #144]
	str	r2, [r3, #336]
	mov	r2, #112
	str	r2, [r3, #240]
	mov	r2, #272
	str	r2, [r3, #244]
	mov	r2, #360
	mov	fp, #168
	mov	r10, #40
	mov	r0, #296
	mov	r9, #64
	mov	r1, #464
	mov	r8, #48
	mov	r7, #120
	mov	r6, #352
	mov	r5, #160
	mov	r4, #408
	mov	lr, #264
	mov	ip, #456
	str	r2, [r3, #288]
	mov	r2, #368
	str	fp, [r3]
	str	r10, [r3, #4]
	str	r9, [r3, #52]
	str	r8, [r3, #100]
	str	r7, [r3, #148]
	str	r6, [r3, #192]
	str	r5, [r3, #196]
	str	r4, [r3, #388]
	str	lr, [r3, #432]
	str	r0, [r3, #48]
	str	r0, [r3, #292]
	str	r1, [r3, #96]
	str	r1, [r3, #384]
	str	r2, [r3, #340]
	str	ip, [r3, #436]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	flags
	.size	initFlags2, .-initFlags2
	.align	2
	.global	drawFlags
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlags, %function
drawFlags:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	ldr	r6, .L28
	ldr	r7, .L28+4
	ldr	r9, .L28+8
	ldr	fp, .L28+12
	sub	sp, sp, #84
.L19:
	ldr	r3, [r6, #44]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r7]	@ movhi
	beq	.L18
	ldr	r1, [r9]
	ldr	r2, [r6, #4]
	ldr	r3, [r6, #20]
	sub	r2, r2, r1
	rsb	r3, r3, #0
	cmp	r2, r3
	movgt	r3, #1
	movle	r3, #0
	cmp	r2, #159
	movgt	r3, #0
	cmp	r3, #0
	moveq	r3, #512
	ldr	lr, .L28+16
	andne	r2, r2, #255
	strhne	r2, [r7]	@ movhi
	strheq	r3, [r7]	@ movhi
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #32
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [fp]
	ldr	r10, [r6]
	sub	r10, r10, r3
	ldr	r3, .L28
	add	r5, r8, r8, lsl #1
	add	r5, r3, r5, lsl #4
	ldm	lr, {r0, r1, r2, r3}
	mov	lr, #18	@ movhi
	mov	r4, sp
	lsl	r10, r10, #23
	lsr	r10, r10, #23
	strh	lr, [r7, #4]	@ movhi
	orr	r10, r10, #16384
	add	lr, r5, #16
	strh	r10, [r7, #2]	@ movhi
	stm	ip, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	ldr	ip, .L28+20
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L18
	ldrh	r3, [r7]
	cmp	r3, #512
	beq	.L18
	mov	r1, #0
	ldr	r0, .L28+24
	ldr	ip, .L28+28
	ldr	r2, [r0]
	ldr	r3, [ip]
	add	r2, r2, #5
	sub	r3, r3, #1
	str	r2, [r0]
	str	r3, [ip]
	str	r1, [r6, #44]
.L18:
	add	r8, r8, #1
	cmp	r8, #10
	add	r6, r6, #48
	add	r7, r7, #8
	bne	.L19
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	flags
	.word	shadowOAM+400
	.word	vOff
	.word	hOff
	.word	playerCar
	.word	ezSpriteCollision
	.word	score
	.word	currFlagNum
	.size	drawFlags, .-drawFlags
	.comm	playerCar,48,4
	.comm	shadowOAM,1024,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
