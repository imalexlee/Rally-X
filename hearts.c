#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "hearts.h"
#include "game.h"

extern SPRITE hearts[HEARTNUM];
OBJ_ATTR shadowOAM[128];

void initHearts()
{

  for (int i = 0; i < HEARTNUM; i++)
  {
    hearts[i].width = 16;
    hearts[i].height = 16;
    hearts[i].x = 5 + i * 18;
    hearts[i].y = 140;
  }
}

void drawHearts()
{

  for (int i = 0; i < HEARTNUM; i++)
  {
    if (i < lives)
    {
      shadowOAM[i + 40].attr0 = ATTR0_Y(hearts[i].y) | ATTR0_SQUARE;
      shadowOAM[i + 40].attr1 = ATTR1_X(hearts[i].x) | ATTR1_SMALL;
      shadowOAM[i + 40].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 0) | ATTR2_PRIORITY(0);
    }
    else
    {
      shadowOAM[i + 40].attr0 = ATTR0_HIDE;
    }
  }
}
