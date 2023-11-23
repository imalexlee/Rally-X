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
	.file	"main.c"
	.text
	.align	2
	.global	drawImage3DMA
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3DMA, %function
drawImage3DMA:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r6, r3, #0
	ble	.L4
	mov	r9, r2
	ldr	r4, [sp, #32]
	rsb	r0, r0, r0, lsl #4
	add	r0, r1, r0, lsl #4
	ldr	r8, .L9
	ldr	r7, .L9+4
	rsb	r5, r4, r0, lsl #1
	add	r6, r4, r6, lsl #1
.L3:
	ldr	r2, [r8]
	add	r1, r5, r4
	add	r2, r2, r1
	mov	r3, r9
	mov	r1, r4
	mov	r0, #3
	add	r4, r4, #2
	mov	lr, pc
	bx	r7
	cmp	r4, r6
	bne	.L3
.L4:
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage3DMA, .-drawImage3DMA
	.align	2
	.global	initSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSprites, %function
initSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	initPlayerCar
	.word	initEnemyCars
	.word	initSmoke
	.word	initFlags
	.word	initRocks
	.word	initHearts
	.word	initFuel
	.word	initScore
	.size	initSprites, .-initSprites
	.align	2
	.global	initSprites2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSprites2, %function
initSprites2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	initPlayerCar
	.word	initEnemyCars2
	.word	initRocks2
	.word	initFlags2
	.word	initSmoke
	.word	initFuel
	.word	initHearts
	.size	initSprites2, .-initSprites2
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #256
	mov	r1, #5248
	strh	r5, [r2]	@ movhi
	ldr	r4, .L21
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r3, .L21+4
	ldr	r1, .L21+8
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L21+16
	mov	r0, #3
	ldr	r1, .L21+20
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L21+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	DMANow
	.word	27840
	.word	startTiles
	.word	startPal
	.word	100704256
	.word	startMap
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #3
	ldr	r1, .L25
	ldr	r2, .L25+4
	ldr	r3, .L25+8
	str	r4, [r1]
	str	r2, [r3]
	bl	initSprites
	ldr	r3, .L25+12
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L25+16
	ldr	r4, .L25+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #0
	mov	ip, #100
	mov	r1, #10
	ldr	lr, .L25+24
	strh	r3, [r2, #16]	@ movhi
	ldr	r0, .L25+28
	strh	r3, [r2, #18]	@ movhi
	ldr	r2, .L25+32
	str	r3, [lr]
	pop	{r4, lr}
	str	ip, [r0]
	str	r1, [r2]
	b	goToStart
.L26:
	.align	2
.L25:
	.word	lives
	.word	collisionMapBitmap
	.word	collisionMap
	.word	hideSprites
	.word	shadowOAM
	.word	DMANow
	.word	score
	.word	fuelLevel
	.word	currFlagNum
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose.part.0, %function
lose.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	initialize
.L30:
	.align	2
.L29:
	.word	buttons
	.size	lose.part.0, .-lose.part.0
	.set	win.part.0,lose.part.0
	.align	2
	.global	goToLevel1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevel1, %function
goToLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #51200
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L33
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #384
	mov	r2, #100663296
	ldr	r1, .L33+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L33+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L33+12
	ldr	r1, .L33+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L33+20
	ldr	r1, .L33+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L33+28
	mov	r0, #3
	ldr	r1, .L33+32
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L33+36
	pop	{r4, lr}
	str	r2, [r3, #4]
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100679680
	.word	trackBGMap
	.word	100728832
	.word	rallyXSprites2Tiles
	.word	83886592
	.word	rallyXSprites2Pal
	.word	.LANCHOR0
	.size	goToLevel1, .-goToLevel1
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L40+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToLevel1
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToLevel2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #51200
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L44
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #384
	mov	r2, #100663296
	ldr	r1, .L44+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L44+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L44+12
	ldr	r1, .L44+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	lr, #10
	mov	r2, #2
	ldr	r1, .L44+20
	ldr	r3, .L44+24
	str	r0, [r1]
	ldr	ip, .L44+28
	ldr	r1, .L44+32
	ldr	r0, .L44+36
	str	lr, [ip]
	str	r2, [r3, #4]
	str	r2, [r3]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100679680
	.word	trackBG2Map
	.word	lives
	.word	.LANCHOR0
	.word	currFlagNum
	.word	collisionMap
	.word	collisionMap2Bitmap
	.size	goToLevel2, .-goToLevel2
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #5248
	mov	r4, #67108864
	mov	r6, #256
	ldr	r5, .L48
	strh	r6, [r4]	@ movhi
	mov	r3, #5504
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L48+4
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L48+12
	ldr	r1, .L48+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #3
	ldr	r2, .L48+20
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	DMANow
	.word	pauseTiles
	.word	pausePal
	.word	100704256
	.word	pauseMap
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L66
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L66+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L63
.L51:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L66+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L64
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	ldr	r5, .L66+8
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L65
.L52:
	cmp	r3, #2
	beq	.L53
.L62:
	ldrh	r3, [r4]
	b	.L51
.L64:
	bl	initialize
	pop	{r4, r5, r6, lr}
	b	goToStart
.L53:
	bl	goToLevel2
	b	.L62
.L65:
	bl	goToLevel1
	ldr	r3, [r5, #4]
	b	.L52
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #5248
	mov	r4, #67108864
	mov	r6, #256
	ldr	r5, .L70
	strh	r6, [r4]	@ movhi
	mov	r3, #11200
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L70+4
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L70+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L70+12
	ldr	r1, .L70+16
	mov	lr, pc
	bx	r5
	mov	r0, #10
	mov	r1, #50
	mov	r2, #5
	ldr	r3, .L70+20
	strh	r0, [r4, #16]	@ movhi
	strh	r1, [r4, #18]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	DMANow
	.word	loseTiles
	.word	losePal
	.word	100704256
	.word	loseMap
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.align	2
	.global	level1
	.syntax unified
	.arm
	.fpu softvfp
	.type	level1, %function
level1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L83
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L83+8
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L73
	ldr	r3, .L83+12
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L73
	ldr	r3, .L83+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L81
.L75:
	ldr	r3, .L83+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
	ldr	r3, .L83+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
.L72:
	pop	{r4, lr}
	bx	lr
.L73:
	bl	goToLose
	ldr	r3, .L83+16
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L75
.L81:
	bl	initSprites2
	mov	r0, #100
	ldr	r1, .L83+28
	ldr	r2, .L83+12
	ldr	r3, [r1]
	ldr	ip, [r2]
	add	r3, r3, ip
	str	r3, [r1]
	str	r0, [r2]
	bl	goToLevel2
	b	.L75
.L82:
	pop	{r4, lr}
	b	goToPause
.L84:
	.align	2
.L83:
	.word	updateGame
	.word	drawGame
	.word	lives
	.word	fuelLevel
	.word	currFlagNum
	.word	oldButtons
	.word	buttons
	.word	score
	.size	level1, .-level1
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #5248
	mov	r4, #67108864
	mov	r6, #256
	ldr	r5, .L87
	strh	r6, [r4]	@ movhi
	mov	r3, #14272
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L87+4
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L87+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L87+12
	ldr	r1, .L87+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #4
	ldr	r2, .L87+20
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	DMANow
	.word	winTiles
	.word	winPal
	.word	100704256
	.word	winMap
	.word	.LANCHOR0
	.size	goToWin, .-goToWin
	.align	2
	.global	level2
	.syntax unified
	.arm
	.fpu softvfp
	.type	level2, %function
level2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
	ldr	r3, .L100+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L98
.L90:
	ldr	r3, .L100+16
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L91
	ldr	r3, .L100+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L91
	ldr	r3, .L100+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L99
.L89:
	pop	{r4, lr}
	bx	lr
.L91:
	bl	goToLose
	ldr	r3, .L100+24
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L89
.L99:
	pop	{r4, lr}
	b	goToWin
.L98:
	bl	goToPause
	b	.L90
.L101:
	.align	2
.L100:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	lives
	.word	fuelLevel
	.word	currFlagNum
	.size	level2, .-level2
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L125
	ldr	r5, .L125+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+8
	mov	lr, pc
	bx	r3
	ldr	r9, .L125+12
	ldr	r3, [r5]
	ldr	fp, .L125+16
	ldr	r8, .L125+20
	ldr	r7, .L125+24
	ldr	r6, .L125+28
	ldr	r10, .L125+32
	ldr	r4, .L125+36
.L117:
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L103
.L105:
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L104
.L107:
	mov	lr, pc
	bx	r6
	ldrh	r1, [r9]
	ldr	r3, [r5]
.L111:
	strh	r1, [fp]	@ movhi
	ldrh	r1, [r4, #48]
	strh	r1, [r9]	@ movhi
	b	.L117
.L108:
	mov	lr, pc
	bx	r7
	ldrh	r1, [r9]
	ldr	r3, [r5]
	b	.L111
.L109:
	mov	lr, pc
	bx	r8
	ldrh	r1, [r9]
	ldr	r3, [r5]
	b	.L111
.L122:
	strh	r3, [fp]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
.L110:
	ldrh	r3, [fp]
	tst	r3, #8
	ldrh	r3, [r9]
	beq	.L122
	tst	r3, #8
	bne	.L122
	ldr	r3, .L125+40
	mov	lr, pc
	bx	r3
	ldrh	r1, [r9]
	ldr	r3, [r5]
	b	.L111
.L104:
	ldrh	r3, [fp]
	tst	r3, #8
	bne	.L116
.L123:
	ldrh	r3, [r9]
	strh	r3, [fp]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [fp]
	tst	r3, #8
	beq	.L123
.L116:
	ldr	r3, .L125+44
	mov	lr, pc
	bx	r3
	ldrh	r1, [r9]
	ldr	r3, [r5]
	b	.L111
.L106:
	ldrh	r3, [fp]
	tst	r3, #8
	bne	.L115
.L124:
	ldrh	r3, [r9]
	strh	r3, [fp]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [fp]
	tst	r3, #8
	beq	.L124
.L115:
	mov	lr, pc
	bx	r10
	ldrh	r1, [r9]
	ldr	r3, [r5]
	b	.L111
.L103:
	ldrh	r1, [r9]
	b	.L111
.L126:
	.align	2
.L125:
	.word	initialize
	.word	.LANCHOR0
	.word	mgba_open
	.word	buttons
	.word	oldButtons
	.word	level1
	.word	level2
	.word	pause
	.word	win.part.0
	.word	67109120
	.word	goToLevel1
	.word	lose.part.0
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L129
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L130:
	.align	2
.L129:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.global	state
	.global	currLevel
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	gameCounter,4,4
	.comm	currFlagNum,4,4
	.comm	fuelLevel,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	currLevel, %object
	.size	currLevel, 4
currLevel:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
