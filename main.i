# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 38 "gba.h"
void waitForVBlank();
# 55 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 71 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 104 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 4 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xDel;
    int yDel;
    int width;
    int height;
    int framesPassed;
    int direction;
    int aniState;
    int aniFrame;
    int numFrames;
    int hide;
} SPRITE;
# 5 "main.c" 2
# 1 "tileset.h" 1
# 9 "tileset.h"
extern const unsigned short tilesetTiles[384];


extern const unsigned short tilesetPal[16];
# 6 "main.c" 2
# 1 "trackBG.h" 1







extern const unsigned short trackBGMap[4096];
# 7 "main.c" 2
# 1 "trackBG2.h" 1







extern const unsigned short trackBG2Map[4096];
# 8 "main.c" 2
# 1 "rallyXSprites2.h" 1
# 21 "rallyXSprites2.h"
extern const unsigned short rallyXSprites2Tiles[16384];


extern const unsigned short rallyXSprites2Pal[256];
# 9 "main.c" 2
# 1 "playerCar.h" 1
void initPlayerCar();
void drawPlayerCar();
# 10 "main.c" 2
# 1 "enemyCars.h" 1


void initEnemyCars();
void initEnemyCars2();
void drawEnemyCars();
# 11 "main.c" 2
# 1 "smoke.h" 1
void initSmoke();
void drawSmoke();
# 12 "main.c" 2
# 1 "game.h" 1
void drawGame();
void updateGame();

int hOff;
int vOff;
int lives;
int score;
int fuelLevel;
int currFlagNum;
int gameCounter;
# 13 "main.c" 2
# 1 "rocks.h" 1


void initRocks();
void initRocks2();
void drawRocks();
# 14 "main.c" 2
# 1 "collisionMap.h" 1
# 21 "collisionMap.h"
extern const unsigned short collisionMapBitmap[131072];


extern const unsigned short collisionMapPal[256];
# 15 "main.c" 2
# 1 "collisionMap2.h" 1
# 21 "collisionMap2.h"
extern const unsigned short collisionMap2Bitmap[131072];


extern const unsigned short collisionMap2Pal[256];
# 16 "main.c" 2
# 1 "flags.h" 1


void initFlags();
void initFlags2();
void drawFlags();
# 17 "main.c" 2
# 1 "hearts.h" 1

void initHearts();
void drawHearts();
# 18 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[27840];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 19 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[11200];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 20 "main.c" 2
# 1 "fuel.h" 1

void initFuel();
void drawFuel();
# 21 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[14272];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 22 "main.c" 2
# 1 "score.h" 1
void initScore();
void drawScore();
# 23 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[5504];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 24 "main.c" 2

void initialize();
void drawGame();
void initSprites();
void goToStart();
void start();
void goToLevel1();
void level1();
void goToLevel2();
void level2();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

unsigned short oldButtons;
unsigned short buttons;

extern u8 *collisionMap;

int drawImage3DMA(int x, int y, int width, int height, const u16 *image)
{
    int r;
    for (r = 0; r < height; r++)
    {
        DMANow(3, &image[((0) * (width) + (r))], &videoBuffer[((x) * (240) + (r + y))], width);
    }
}

enum state
{
    START,
    LEVEL1,
    LEVEL2,
    PAUSE,
    WIN,
    LOSE
};

int currLevel = START;
int state = START;

int main()
{
    initialize();
    mgba_open();

    while (1)
    {

        switch (state)
        {
        case START:
            start();
            break;
        case LEVEL1:
            level1();
            break;
        case LEVEL2:
            level2();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        default:
            break;
        }

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
    }
}

void initSprites()
{
    initPlayerCar();
    initEnemyCars();
    initSmoke();
    initFlags();
    initRocks();
    initHearts();
    initFuel();
    initScore();
}

void initSprites2()
{
    initPlayerCar();
    initEnemyCars2();
    initRocks2();
    initFlags2();
    initSmoke();
    initFuel();
    initHearts();
}

void initialize()
{

    collisionMap = (unsigned char *)collisionMapBitmap;
    lives = 3;
    initSprites();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    fuelLevel = 100;
    currFlagNum = 10;
    score = 0;
    goToStart();
}

void goToStart()
{
    (*(volatile unsigned short *)0x4000000) = ((0)&7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (0<<14) | (1<<7);
    DMANow(3, startTiles, &((charblock *)0x06000000)[0], 55680 / 2);
    DMANow(3, startPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, startMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    state = START;
}

void start()
{
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3)))))
        goToLevel1();
}

void goToLevel1()
{
    (*(volatile unsigned short *)0x4000000) = ((0)&7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((8) << 8) | (3<<14);


    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], 768 / 2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, trackBGMap, &((screenblock *)0x6000000)[8], (8192) / 2);


    DMANow(3, rallyXSprites2Tiles, &((charblock *)0x06000000)[4], 32768 / 2);
    DMANow(3, rallyXSprites2Pal, ((u16 *)0x5000200), 512 / 2);
    currLevel = LEVEL1;
    state = LEVEL1;
}

void level1()
{
    updateGame();
    drawGame();

    if (lives <= 0 || fuelLevel <= 0)
        goToLose();

    if (currFlagNum <= 0)
    {
        initSprites2();
        score += fuelLevel;
        fuelLevel = 100;
        goToLevel2();
    }

    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3)))))
        goToPause();
}

void goToLevel2()
{
    (*(volatile unsigned short *)0x4000000) = ((0)&7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((8) << 8) | (3<<14);

    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], 768 / 2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, trackBG2Map, &((screenblock *)0x6000000)[8], (8192) / 2);
    lives = 3;
    currFlagNum = 10;
    currLevel = LEVEL2;
    state = LEVEL2;
    collisionMap = (unsigned char *)collisionMap2Bitmap;
}

void level2()
{
    updateGame();
    drawGame();

    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3)))))
        goToPause();

    if (lives <= 0 || fuelLevel <= 0)
        goToLose();

    if (currFlagNum <= 0)
        goToWin();
}

void goToPause()
{
    (*(volatile unsigned short *)0x4000000) = ((0)&7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (0<<14) | (1<<7);

    DMANow(3, pauseTiles, &((charblock *)0x06000000)[0], 11008 / 2);
    DMANow(3, pausePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[20], 2048 / 2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = PAUSE;
}

void pause()
{
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3)))))
    {
        if (currLevel == LEVEL1)
            goToLevel1();

        if (currLevel == LEVEL2)
            goToLevel2();
    }

    if ((!(~(oldButtons) & ((1 << 2))) && (~(buttons) & ((1 << 2)))))
    {
        initialize();

        goToStart();
    }
}

void goToLose()
{
    (*(volatile unsigned short *)0x4000000) = ((0)&7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (0<<14) | (1<<7);

    DMANow(3, loseTiles, &((charblock *)0x06000000)[0], 22400 / 2);
    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[20], 2048 / 2);
    (*(volatile unsigned short *)0x04000010) = 10;
    (*(volatile unsigned short *)0x04000012) = 50;
    state = LOSE;
}

void lose()
{
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3)))))
        initialize();
}

void goToWin()
{
    (*(volatile unsigned short *)0x4000000) = ((0)&7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (0<<14) | (1<<7);

    DMANow(3, winTiles, &((charblock *)0x06000000)[0], 28544 / 2);
    DMANow(3, winPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winMap, &((screenblock *)0x6000000)[20], 2048 / 2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = WIN;
}

void win()
{
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3)))))
        initialize();
}
