# 1 "smoke.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "smoke.c"
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
# 2 "smoke.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "smoke.c" 2
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
# 4 "smoke.c" 2
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
# 5 "smoke.c" 2

extern SPRITE smoke;
SPRITE playerCar;
OBJ_ATTR shadowOAM[128];


int currX;
int currY;
int currAniState;

void initSmoke()
{
  smoke.width = 16;
  smoke.height = 16;
  smoke.framesPassed = 100;
  smoke.numFrames = 4;
  smoke.aniFrame = 0;
  smoke.hide = 0;
}

void drawSmoke()
{

  if (smoke.hide)
  {


    switch (currAniState)
    {


    case 0:
      smoke.x = currX;
      smoke.y = currY + playerCar.height;
      break;

    case 1:
      smoke.x = currX;
      smoke.y = currY - smoke.height;
      break;

    case 2:
      smoke.x = currX + playerCar.width;
      smoke.y = currY;
      break;

    case 3:
      smoke.x = currX - smoke.width;
      smoke.y = currY;
      break;
    default:
      break;
    }


    if (smoke.framesPassed > 0)
    {
      smoke.framesPassed--;
      if (!(smoke.framesPassed % 10))
      {
        smoke.aniFrame = ++smoke.aniFrame % smoke.numFrames;
      }
    }
    else
    {
      smoke.hide = 0;

      smoke.framesPassed = 100;
    }
    if (currY - vOff > -smoke.height && currY - vOff < 160)
    {
      shadowOAM[4].attr0 = ((currY - vOff) & 0xFF) | (0<<14);
    }
    else
    {
      shadowOAM[4].attr0 = (2<<8);
    }

    shadowOAM[4].attr1 = ((currX - hOff) & 0x1FF) | (1<<14);
    shadowOAM[4].attr2 = (((0) & 0xF) <<12) | (((smoke.aniFrame * 2)*32+(16 + smoke.aniState * 2)) & 0x3FF) | (((0) & 3) << 10);
  }
  else
  {
    shadowOAM[4].attr0 = (2<<8);
    currX = playerCar.x;
    currY = playerCar.y;
    currAniState = playerCar.aniState;
  }
}
