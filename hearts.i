# 1 "hearts.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hearts.c"
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
# 2 "hearts.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "hearts.c" 2
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
# 4 "hearts.c" 2
# 1 "hearts.h" 1

void initHearts();
void drawHearts();
# 5 "hearts.c" 2
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
# 6 "hearts.c" 2

extern SPRITE hearts[3];
OBJ_ATTR shadowOAM[128];

void initHearts()
{

  for (int i = 0; i < 3; i++)
  {
    hearts[i].width = 16;
    hearts[i].height = 16;
    hearts[i].x = 5 + i * 18;
    hearts[i].y = 140;
  }
}

void drawHearts()
{

  for (int i = 0; i < 3; i++)
  {
    if (i < lives)
    {
      shadowOAM[i + 40].attr0 = ((hearts[i].y) & 0xFF) | (0<<14);
      shadowOAM[i + 40].attr1 = ((hearts[i].x) & 0x1FF) | (1<<14);
      shadowOAM[i + 40].attr2 = (((0) & 0xF) <<12) | (((0)*32+(21)) & 0x3FF) | (((0) & 3) << 10);
    }
    else
    {
      shadowOAM[i + 40].attr0 = (2<<8);
    }
  }
}
