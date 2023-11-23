# 1 "score.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "score.c"
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
# 2 "score.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "score.c" 2
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
# 4 "score.c" 2
# 1 "hearts.h" 1

void initHearts();
void drawHearts();
# 5 "score.c" 2
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
# 6 "score.c" 2

extern SPRITE scores[3];
OBJ_ATTR shadowOAM[128];

int scoreValues[3];

void initScore()
{

  for (int i = 0; i < 3; i++)
  {
    scores[i].width = 8;
    scores[i].height = 8;
    scores[i].x = 220 - i * 10;
    scores[i].y = 5;
  }
}

int pow(int base, int exp){
  int t = 1;
  for (int i = 0; i < exp; i++)
  {
    t *= base;
  }
  return t;
}

void drawScore()
{

  for (int i = 0; i < 3; i++)
  {

    scoreValues[i] = score / pow(10,i) % 10;
    shadowOAM[i + 60].attr0 = ((scores[i].y) & 0xFF) | (0<<14);
    shadowOAM[i + 60].attr1 = ((scores[i].x) & 0x1FF) | (0<<14);
    shadowOAM[i + 60].attr2 = (((0) & 0xF) <<12) | (((6)*32+(scoreValues[i])) & 0x3FF) | (((0) & 3) << 10);
  }
}
