#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "flags.h"
#include "rocks.h"
#include "game.h"
#include "print.h"

extern SPRITE rocks[ROCKNUM];
OBJ_ATTR shadowOAM[128];

void initRocks()
{
  mgba_open();
  mgba_printf("init flags %d", 1);
  for (int i = 0; i < ROCKNUM; i++)
  {
    rocks[i].width = 16;
    rocks[i].height = 16;
    rocks[i].hide = 1;
  }
  rocks[0].x = 264;
  rocks[0].y = 128;
  rocks[1].x = 288;
  rocks[1].y = 320;
  rocks[2].x = 160;
  rocks[2].y = 400;
}
void initRocks2()
{
  for (int i = 0; i < ROCKNUM; i++)
  {
    rocks[i].hide = 1;
  }
  rocks[0].x = 384;
  rocks[0].y = 176;
  rocks[1].x = 24;
  rocks[1].y = 288;
  rocks[2].x = 248;
  rocks[2].y = 336;
}

void drawRocks()
{

  for (int i = 0; i < ROCKNUM; i++)
  {
    // mgba_printf("flag x: %d, flag y: %d", flags[0].x - hOff, flags[0].y - vOff);
    if (rocks[i].hide)
    {
      if (rocks[i].y - vOff > -rocks[i].height && rocks[i].y - vOff < SCREENHEIGHT)
      {
        shadowOAM[20 + i].attr0 = ATTR0_Y(rocks[i].y - vOff) | ATTR0_SQUARE;
      }
      else
      {
        shadowOAM[20 + i].attr0 = ATTR0_HIDE;
      }
      shadowOAM[20 + i].attr1 = ATTR1_X(rocks[i].x - hOff) | ATTR1_TINY;
      shadowOAM[20 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 0) | ATTR2_PRIORITY(0);
    }
    else
    {
      shadowOAM[20 + i].attr0 = ATTR0_HIDE;
    }
  }
}