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
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+36
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L4+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L4+44
	ldrh	r1, [r2]
	ldr	r2, .L4+48
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L5:
	.align	2
.L4:
	.word	drawPlayerCar
	.word	drawEnemyCars
	.word	drawSmoke
	.word	drawFlags
	.word	drawRocks
	.word	drawHearts
	.word	drawFuel
	.word	drawScore
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	canMoveLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveLeft, %function
canMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L10
	str	lr, [sp, #-4]!
	ldr	r3, .L10+4
	ldr	r2, [r1, #4]
	ldr	ip, [r3]
	ldr	lr, [r1, #8]
	ldr	r3, [r1]
	add	r0, ip, r2, lsl #9
	sub	r3, r3, lr
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L6
	ldr	r1, [r1, #20]
	add	r2, r2, r1
	sub	r2, r2, #1
	add	r2, ip, r2, lsl #9
	ldrb	r0, [r2, r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
.L6:
	ldr	lr, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	playerCar
	.word	collisionMap
	.size	canMoveLeft, .-canMoveLeft
	.align	2
	.global	canMoveRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveRight, %function
canMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L15
	ldr	ip, .L15+4
	ldr	r1, [r2]
	ldr	r3, [r2, #16]
	ldr	r0, [r2, #8]
	add	r3, r3, r1
	ldr	ip, [ip]
	ldr	r1, [r2, #4]
	sub	r3, r3, #1
	add	r3, r3, r0
	add	r0, ip, r1, lsl #9
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #0
	bxeq	lr
	ldr	r2, [r2, #20]
	add	r1, r1, r2
	sub	r1, r1, #1
	add	r1, ip, r1, lsl #9
	ldrb	r0, [r1, r3]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L16:
	.align	2
.L15:
	.word	playerCar
	.word	collisionMap
	.size	canMoveRight, .-canMoveRight
	.align	2
	.global	canMoveUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveUp, %function
canMoveUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L20
	ldr	r3, .L20+4
	ldr	r0, [r1, #12]
	ldr	ip, [r1]
	ldr	r3, [r3]
	ldr	r2, [r1, #4]
	add	r3, r3, ip
	sub	r2, r2, r0
	ldrb	r0, [r3, r2, lsl #9]	@ zero_extendqisi2
	cmp	r0, #0
	add	r3, r3, r2, lsl #9
	bxeq	lr
	ldr	r2, [r1, #16]
	add	r3, r3, r2
	ldrb	r0, [r3, #-1]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L21:
	.align	2
.L20:
	.word	playerCar
	.word	collisionMap
	.size	canMoveUp, .-canMoveUp
	.align	2
	.global	canMoveDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	canMoveDown, %function
canMoveDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L25
	ldr	r1, .L25+4
	ldr	ip, [r2, #4]
	ldr	r3, [r2, #20]
	ldr	r0, [r2, #12]
	ldr	r1, [r1]
	add	r3, r3, ip
	ldr	ip, [r2]
	sub	r3, r3, #1
	add	r3, r3, r0
	ldr	r0, [r2, #16]
	add	r2, r1, ip
	add	r1, r2, r3, lsl #9
	add	r1, r1, r0
	ldrb	r0, [r1, #-1]	@ zero_extendqisi2
	cmp	r0, #0
	bxeq	lr
	ldrb	r0, [r2, r3, lsl #9]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L26:
	.align	2
.L25:
	.word	playerCar
	.word	collisionMap
	.size	canMoveDown, .-canMoveDown
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L80
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L28
	ldr	r2, .L80+4
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L28
	mov	r3, #2
	ldr	r4, .L80+8
	str	r3, [r4, #32]
.L29:
	bl	canMoveLeft
	cmp	r0, #0
	ldr	r6, [r4]
	ldrne	r0, [r4, #8]
	sub	r6, r6, r0
	str	r6, [r4]
	ldr	r5, [r4, #4]
.L36:
	cmp	r6, #0
	movlt	r7, #0
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	rsb	r2, r0, #240
	add	r2, r2, r2, lsr #31
	strlt	r7, [r4]
	sub	r2, r6, r2, asr #1
	movlt	r6, r7
	cmp	r5, #0
	movlt	r7, #0
	rsb	r3, r1, #160
	add	r3, r3, r3, lsr #31
	sub	r3, r5, r3, asr #1
	movlt	r5, r7
	rsb	r0, r0, #512
	strlt	r7, [r4, #4]
	rsb	r1, r1, #512
	cmp	r0, r6
	ldr	lr, .L80+12
	ldr	ip, .L80+16
	strlt	r0, [r4]
	cmp	r1, r5
	strlt	r1, [r4, #4]
	cmp	r2, #0
	str	r2, [lr]
	str	r3, [ip]
	blt	.L77
	cmp	r3, #0
	blt	.L78
	cmp	r2, #272
	movgt	r2, #272
	strgt	r2, [lr]
.L47:
	cmp	r3, #352
	movgt	r3, #352
	strgt	r3, [ip]
.L27:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L28:
	ldr	r4, .L80+8
	tst	r3, #16
	ldr	r5, [r4, #4]
	ldr	r6, [r4]
	beq	.L30
	ldr	r2, .L80+4
	ldrh	r2, [r2]
	tst	r2, #16
	moveq	r3, #3
	streq	r3, [r4, #32]
	beq	.L31
.L30:
	tst	r3, #64
	bne	.L79
.L32:
	tst	r3, #128
	beq	.L34
	ldr	r3, .L80+4
	ldrh	r3, [r3]
	tst	r3, #128
	moveq	r3, #1
	streq	r3, [r4, #32]
	beq	.L35
.L34:
	ldr	r3, [r4, #32]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L36
.L37:
	.word	.L33
	.word	.L35
	.word	.L29
	.word	.L31
.L79:
	ldr	r2, .L80+4
	ldrh	r2, [r2]
	ands	r2, r2, #64
	streq	r2, [r4, #32]
	bne	.L32
.L33:
	bl	canMoveUp
	cmp	r0, #0
	ldrne	r0, [r4, #12]
	sub	r5, r5, r0
	str	r5, [r4, #4]
	b	.L36
.L77:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [lr]
	strlt	r2, [ip]
	bge	.L47
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L78:
	mov	r3, #0
	cmp	r2, #272
	str	r3, [ip]
	ble	.L27
	mov	r3, #272
	str	r3, [lr]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L31:
	bl	canMoveRight
	cmp	r0, #0
	ldrne	r3, [r4, #8]
	addne	r6, r6, r3
	str	r6, [r4]
	b	.L36
.L35:
	bl	canMoveDown
	cmp	r0, #0
	ldrne	r3, [r4, #12]
	addne	r5, r5, r3
	str	r5, [r4, #4]
	b	.L36
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	buttons
	.word	playerCar
	.word	hOff
	.word	vOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemyCars
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyCars, %function
updateEnemyCars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L118
	mov	r5, #0
	mov	r6, r7
	sub	sp, sp, #92
	ldr	r4, .L118+4
	ldr	r8, .L118+8
	ldr	r9, .L118+12
	add	fp, sp, #32
.L95:
	mov	lr, fp
	mov	r10, sp
	add	ip, r5, r5, lsl #1
	add	ip, r7, ip, lsl #4
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1, r2, r3}
	stm	lr, {r0, r1, r2, r3}
	ldr	ip, .L118+16
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r10!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1, r2, r3}
	stm	r10, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	lsl	ip, r5, #1
	beq	.L83
	mov	r2, #30
	ldr	r3, [r9]
	sub	r3, r3, #1
	str	r3, [r9]
	str	r2, [r4]
	str	r2, [r4, #4]
.L83:
	ldr	r3, [r4, #24]
	tst	r3, #1
	beq	.L117
.L85:
	add	r5, r5, #1
	cmp	r5, #3
	add	r6, r6, #48
	bne	.L95
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	mov	lr, fp
	mov	r10, sp
	add	ip, ip, r5
	add	ip, r7, ip, lsl #4
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1, r2, r3}
	stm	lr, {r0, r1, r2, r3}
	ldr	ip, .L118+20
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r10!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1, r2, r3}
	stm	r10, {r0, r1, r2, r3}
	sub	r10, ip, #32
	ldm	r10, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L86
	ldr	r3, [r10, #44]
	cmp	r3, #0
	bne	.L85
.L86:
	ldr	r2, [r6, #4]
	ldr	r0, [r6]
	ldr	r3, [r6, #16]
	ldr	ip, [r4, #4]
	ldr	r1, [r6, #20]
	add	r3, r0, r3
	add	r1, r2, r1
	cmp	ip, r2
	add	r3, r3, #1
	sub	r1, r1, #1
	bge	.L88
	ldr	lr, .L118+24
	ldr	ip, [r6, #12]
	ldr	lr, [lr]
	sub	ip, r2, ip
	add	r10, lr, r0
	ldrb	r10, [r10, ip, lsl #9]	@ zero_extendqisi2
	cmp	r10, #0
	moveq	ip, r2
	beq	.L89
	add	lr, lr, r3
	ldrb	lr, [lr, ip, lsl #9]	@ zero_extendqisi2
	cmp	lr, #0
	moveq	ip, r2
.L89:
	mov	lr, #0
	str	ip, [r6, #4]
	str	lr, [r6, #32]
.L90:
	ldr	ip, [r4]
	cmp	ip, r0
	ble	.L92
	ldr	ip, .L118+24
	ldr	lr, [r6, #8]
	ldr	ip, [ip]
	add	r3, lr, r3
	add	r2, ip, r2, lsl #9
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L93
	add	r1, ip, r1, lsl #9
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r0, r0, lr
.L93:
	mov	r3, #3
	str	r0, [r6]
	str	r3, [r6, #32]
	b	.L85
.L88:
	ble	.L90
	ldr	ip, .L118+24
	ldr	lr, [r6, #12]
	ldr	ip, [ip]
	str	lr, [sp, #84]
	add	r10, ip, r0
	add	lr, lr, r1
	ldrb	r10, [r10, lr, lsl #9]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L98
	add	ip, ip, r3
	ldrb	ip, [ip, lr, lsl #9]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L98
	ldr	lr, [sp, #84]
	add	ip, lr, r2
	b	.L91
.L92:
	bge	.L85
	ldr	ip, .L118+24
	ldr	r3, [r6, #8]
	ldr	ip, [ip]
	sub	r3, r0, r3
	add	r2, ip, r2, lsl #9
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L94
	add	r1, ip, r1, lsl #9
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	cmp	r2, #0
	movne	r0, r3
.L94:
	mov	r3, #2
	str	r0, [r6]
	str	r3, [r6, #32]
	b	.L85
.L98:
	mov	ip, r2
.L91:
	mov	lr, #1
	str	ip, [r6, #4]
	str	lr, [r6, #32]
	b	.L90
.L119:
	.align	2
.L118:
	.word	enemyCars
	.word	playerCar
	.word	ezSpriteCollision
	.word	lives
	.word	playerCar+16
	.word	smoke+16
	.word	collisionMap
	.size	updateEnemyCars, .-updateEnemyCars
	.align	2
	.global	updateSmoke
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSmoke, %function
updateSmoke:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L126
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L126+4
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	ldr	r3, .L126+8
	ldr	r2, [r3, #44]
	cmp	r2, #0
	ldreq	r1, .L126+12
	ldreq	r2, [r1]
	subeq	r2, r2, #10
	streq	r2, [r1]
	mov	r2, #1
	str	r2, [r3, #44]
	bx	lr
.L127:
	.align	2
.L126:
	.word	oldButtons
	.word	buttons
	.word	smoke
	.word	fuelLevel
	.size	updateSmoke, .-updateSmoke
	.align	2
	.global	updateRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRocks, %function
updateRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L139
	mov	r4, #0
	mov	r5, r6
	sub	sp, sp, #84
	ldr	r8, .L139+4
	ldr	r9, .L139+8
	add	r7, sp, #32
.L130:
	mov	ip, r7
	mov	r10, sp
	ldr	lr, .L139+12
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	add	fp, r4, r4, lsl #1
	add	fp, r6, fp, lsl #4
	add	lr, fp, #16
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r10!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	r10, {r0, r1, r2, r3}
	ldm	fp, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	add	r4, r4, #1
	beq	.L129
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L129
	mov	r0, #30
	mov	r2, #0
	ldr	r3, [r9]
	ldr	r1, .L139+12
	sub	r3, r3, #1
	str	r0, [r1]
	str	r0, [r1, #4]
	str	r3, [r9]
	str	r2, [r5, #44]
.L129:
	cmp	r4, #3
	add	r5, r5, #48
	bne	.L130
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	rocks
	.word	ezSpriteCollision
	.word	lives
	.word	playerCar
	.size	updateRocks, .-updateRocks
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateEnemyCars
	bl	updateSmoke
	bl	updateRocks
	ldr	r2, .L143
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	gameCounter
	.size	updateGame, .-updateGame
	.align	2
	.global	updateFlags
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlags, %function
updateFlags:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateFlags, .-updateFlags
	.comm	collisionMap,4,4
	.comm	prevLiveCount,4,4
	.comm	scores,144,4
	.comm	enemyCars,144,4
	.comm	fuels,480,4
	.comm	rocks,144,4
	.comm	flags,480,4
	.comm	hearts,144,4
	.comm	smoke,48,4
	.comm	playerCar,48,4
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.global	score
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.bss
	.align	2
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
