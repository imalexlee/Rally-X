# 1 "enemyCars.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemyCars.c"
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
# 2 "enemyCars.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "enemyCars.c" 2
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
# 4 "enemyCars.c" 2
# 1 "enemyCars.h" 1


void initEnemyCars();
void initEnemyCars2();
void drawEnemyCars();
# 5 "enemyCars.c" 2
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
# 6 "enemyCars.c" 2

extern SPRITE enemyCars[3];
OBJ_ATTR shadowOAM[128];

int boundedX;
int boundedY;

void initEnemyCars()
{

  for (int i = 0; i < 3; i++)
  {
    enemyCars[i].width = 16;
    enemyCars[i].height = 16;
    enemyCars[i].xDel = 1;
    enemyCars[i].yDel = 1;
    enemyCars[i].framesPassed = 10;
    enemyCars[i].numFrames = 3;
    enemyCars[i].aniFrame = 0;
    enemyCars[i].aniState = i;
  }
  enemyCars[0].x = 120;
  enemyCars[0].y = 280;
  enemyCars[1].x = 288;
  enemyCars[1].y = 376;
  enemyCars[2].x = 376;
  enemyCars[2].y = 216;
}

void initEnemyCars2()
{
  enemyCars[0].x = 136;
  enemyCars[0].y = 232;
  enemyCars[1].x = 432;
  enemyCars[1].y = 248;
  enemyCars[2].x = 192;
  enemyCars[2].y = 376;
}

void drawEnemyCars()
{

  for (int i = 0; i < 3; i++)
  {

    if (enemyCars[i].framesPassed > 0)
    {
      enemyCars[i].framesPassed--;
    }
    else
    {
      enemyCars[i].aniFrame = ++enemyCars[i].aniFrame % enemyCars[i].numFrames;
      enemyCars[i].framesPassed = 10;
    }

    if (enemyCars[i].y - vOff > -enemyCars[i].height && enemyCars[i].y - vOff < 160)
    {
      shadowOAM[i + 1].attr0 = ((enemyCars[i].y - vOff) & 0xFF) | (0<<14);
    }
    else
    {
      shadowOAM[i + 1].attr0 = (2<<8);
    }
    shadowOAM[i + 1].attr1 = ((enemyCars[i].x - hOff) & 0x1FF) | (1<<14);
    shadowOAM[i + 1].attr2 = (((0) & 0xF) <<12) | (((enemyCars[i].aniFrame * 2)*32+(8 + enemyCars[i].aniState * 2)) & 0x3FF) | (((0) & 3) << 10);
  }
}
