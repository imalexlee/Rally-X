# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "playerCar.h" 1
void initPlayerCar();
void drawPlayerCar();
# 2 "game.c" 2
# 1 "enemyCars.h" 1


void initEnemyCars();
void initEnemyCars2();
void drawEnemyCars();
# 3 "game.c" 2
# 1 "smoke.h" 1
void initSmoke();
void drawSmoke();
# 4 "game.c" 2
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
# 5 "game.c" 2
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
# 6 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 7 "game.c" 2
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
# 8 "game.c" 2
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
# 9 "game.c" 2
# 1 "flags.h" 1


void initFlags();
void initFlags2();
void drawFlags();
# 10 "game.c" 2
# 1 "rocks.h" 1


void initRocks();
void initRocks2();
void drawRocks();
# 11 "game.c" 2
# 1 "hearts.h" 1

void initHearts();
void drawHearts();
# 12 "game.c" 2
# 1 "fuel.h" 1

void initFuel();
void drawFuel();
# 13 "game.c" 2
# 1 "score.h" 1
void initScore();
void drawScore();
# 14 "game.c" 2


extern void drawGame();
extern void updateGame();
void updatePlayer();
void updateEnemyCars();
void updateSmoke();
int canMoveLeft();
int canMoveRight();
int canMoveUp();
int canMoveDown();
int ezSpriteCollision(SPRITE s1, SPRITE s2);

SPRITE playerCar;
SPRITE smoke;
SPRITE hearts[3];
SPRITE flags[10];
SPRITE rocks[3];
SPRITE fuels[10];
SPRITE enemyCars[3];
SPRITE scores[3];

int lives;
int prevLiveCount;
int fuelLevel;
int gameCounter;
int score = 0;
int currFlagNum;

u8 *collisionMap;

typedef enum
{
  UP,
  DOWN,
  LEFT,
  RIGHT
} DIRECTION;

inline unsigned char colorAt(int x, int y)
{
  return collisionMap[((y) * (512) + (x))];
}

void drawGame()
{
  drawPlayerCar();
  drawEnemyCars();
  drawSmoke();
  drawFlags();
  drawRocks();
  drawHearts();
  drawFuel();
  drawScore();
  waitForVBlank();
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
  (*(volatile unsigned short *)0x04000010) = hOff;
  (*(volatile unsigned short *)0x04000012) = vOff;
}

void updateGame()
{
  updatePlayer();
  updateEnemyCars();
  updateSmoke();
  updateRocks();
  updateFlags();
  gameCounter++;
}

int canMoveLeft()
{

  int left = playerCar.x;

  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;

  return colorAt(left - playerCar.xDel, top) && colorAt(left - playerCar.xDel, bottom);
}

int canMoveRight()
{

  int left = playerCar.x;
  int right = playerCar.x + playerCar.width - 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;

  return colorAt(right + playerCar.xDel, top) && colorAt(right + playerCar.xDel, bottom);
}

int canMoveUp()
{
  int left = playerCar.x;
  int right = playerCar.x + playerCar.width - 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;

  return colorAt(left, top - playerCar.yDel) && colorAt(right, top - playerCar.yDel);
}

int canMoveDown()
{
  int left = playerCar.x;
  int right = playerCar.x + playerCar.width - 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;

  return colorAt(right, bottom + playerCar.yDel) && colorAt(left, bottom + playerCar.yDel);
}

void updatePlayer()
{


  if ((!(~(oldButtons) & ((1 << 5))) && (~(buttons) & ((1 << 5)))))
  {
    playerCar.aniState = LEFT;
  }

  else if ((!(~(oldButtons) & ((1 << 4))) && (~(buttons) & ((1 << 4)))))
  {
    playerCar.aniState = RIGHT;
  }

  else if ((!(~(oldButtons) & ((1 << 6))) && (~(buttons) & ((1 << 6)))))
  {
    playerCar.aniState = UP;
  }

  else if ((!(~(oldButtons) & ((1 << 7))) && (~(buttons) & ((1 << 7)))))
  {
    playerCar.aniState = DOWN;
  }


  switch (playerCar.aniState)
  {
  case UP:
    playerCar.y -= canMoveUp() ? playerCar.yDel : 0;
    break;
  case DOWN:
    playerCar.y += canMoveDown() ? playerCar.yDel : 0;
    break;
  case LEFT:
    playerCar.x -= canMoveLeft() ? playerCar.xDel : 0;
    break;
  case RIGHT:
    playerCar.x += canMoveRight() ? playerCar.xDel : 0;
    break;
  default:
    break;
  }

  hOff = playerCar.x - (240 - playerCar.width) / 2;
  vOff = playerCar.y - (160 - playerCar.height) / 2;

  if (playerCar.x < 0)
    playerCar.x = 0;
  if (playerCar.y < 0)
    playerCar.y = 0;
  if (playerCar.x > 512 - playerCar.width)
    playerCar.x = 512 - playerCar.width;
  if (playerCar.y > 512 - playerCar.height)
    playerCar.y = 512 - playerCar.height;

  if (hOff < 0)
    hOff = 0;
  if (vOff < 0)
    vOff = 0;
  if (hOff > 512 - 240)
    hOff = 512 - 240;
  if (vOff > 512 - 160)
    vOff = 512 - 160;
}

void updateEnemyCars()
{
  for (int i = 0; i < 3; i++)
  {

    if (ezSpriteCollision(playerCar, enemyCars[i]))
    {
      lives--;
      playerCar.x = 30;
      playerCar.y = 30;
    }


    if (!(playerCar.framesPassed % 2))
    {

      if (ezSpriteCollision(smoke, enemyCars[i]) && smoke.hide)
      {
        continue;
      }

      int left = enemyCars[i].x;
      int right = enemyCars[i].x + enemyCars[i].width + 1;
      int top = enemyCars[i].y;
      int bottom = enemyCars[i].y + enemyCars[i].height - 1;
      if (playerCar.y < enemyCars[i].y)
      {
        enemyCars[i].y -= (colorAt(left, top - enemyCars[i].yDel) && colorAt(right, top - enemyCars[i].yDel)) ? enemyCars[i].yDel : 0;
        enemyCars[i].aniState = UP;
      }
      else if (playerCar.y > enemyCars[i].y)
      {
        enemyCars[i].y += (colorAt(left, bottom + enemyCars[i].yDel) && colorAt(right, bottom + enemyCars[i].yDel)) ? enemyCars[i].yDel : 0;
        enemyCars[i].aniState = DOWN;
      }
      if (playerCar.x > enemyCars[i].x)
      {
        enemyCars[i].x += (colorAt(right + enemyCars[i].xDel, top) && colorAt(right + enemyCars[i].xDel, bottom)) ? enemyCars[i].xDel : 0;
        enemyCars[i].aniState = RIGHT;
      }
      else if (playerCar.x < enemyCars[i].x)
      {
        enemyCars[i].x -= (colorAt(left - enemyCars[i].xDel, top) && colorAt(left - enemyCars[i].xDel, bottom)) ? enemyCars[i].xDel : 0;
        enemyCars[i].aniState = LEFT;
      }
    }
  }
}

void updateSmoke()
{
  if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0)))))
  {
    if (!smoke.hide)
      fuelLevel -= 10;

    smoke.hide = 1;
  }
}

void updateRocks()
{
  for (int i = 0; i < 3; i++)
  {

    if (ezSpriteCollision(rocks[i], playerCar) && rocks[i].hide)
    {

      lives--;
      playerCar.x = 30;
      playerCar.y = 30;
      rocks[i].hide = 0;
    }
  }
}

void updateFlags()
{
}
