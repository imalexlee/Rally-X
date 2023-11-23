#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "enemyCars.h"
#include "game.h"

extern SPRITE enemyCars[ENEMYNUM];
OBJ_ATTR shadowOAM[128];

int boundedX;
int boundedY;

void initEnemyCars()
{

  for (int i = 0; i < ENEMYNUM; i++)
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

  for (int i = 0; i < ENEMYNUM; i++)
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

    if (enemyCars[i].y - vOff > -enemyCars[i].height && enemyCars[i].y - vOff < SCREENHEIGHT)
    {
      shadowOAM[i + 1].attr0 = ATTR0_Y(enemyCars[i].y - vOff) | ATTR0_SQUARE;
    }
    else
    {
      shadowOAM[i + 1].attr0 = ATTR0_HIDE;
    }
    shadowOAM[i + 1].attr1 = ATTR1_X(enemyCars[i].x - hOff) | ATTR1_SMALL;
    shadowOAM[i + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8 + enemyCars[i].aniState * 2, enemyCars[i].aniFrame * 2) | ATTR2_PRIORITY(0);
  }
}
