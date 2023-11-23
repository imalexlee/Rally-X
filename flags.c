#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "flags.h"
#include "game.h"
#include "print.h"

extern SPRITE flags[FLAGNUM];
OBJ_ATTR shadowOAM[128];

int ezSpriteCollision(SPRITE s1, SPRITE s2);
SPRITE playerCar;

void initFlags()
{
  mgba_open();
  mgba_printf("init flags %d", 1);
  for (int i = 0; i < FLAGNUM; i++)
  {
    flags[i].width = 16;
    flags[i].height = 16;
    // all showing at first
    flags[i].hide = 1;
  }
  flags[0].x = 144;
  flags[0].y = 32;
  flags[1].x = 312;
  flags[1].y = 40;
  flags[2].x = 136;
  flags[2].y = 120;
  flags[3].x = 312;
  flags[3].y = 120;
  flags[4].x = 40;
  flags[4].y = 240;
  flags[5].x = 376;
  flags[5].y = 240;
  flags[6].x = 208;
  flags[6].y = 304;
  flags[7].x = 384;
  flags[7].y = 376;
  flags[8].x = 152;
  flags[8].y = 432;
  flags[9].x = 384;
  flags[9].y = 456;
}

void initFlags2()
{
  for (int i = 0; i < FLAGNUM; i++)
  {
    flags[i].hide = 1;
  }
  flags[0].x = 168;
  flags[0].y = 40;
  flags[1].x = 296;
  flags[1].y = 64;
  flags[2].x = 464;
  flags[2].y = 48;
  flags[3].x = 144;
  flags[3].y = 120;
  flags[4].x = 352;
  flags[4].y = 160;
  flags[5].x = 112;
  flags[5].y = 272;
  flags[6].x = 360;
  flags[6].y = 296;
  flags[7].x = 144;
  flags[7].y = 368;
  flags[8].x = 464;
  flags[8].y = 408;
  flags[9].x = 264;
  flags[9].y = 456;
}

void drawFlags()
{
  for (int i = 0; i < FLAGNUM; i++)
  {
    if (flags[i].hide)
    {
      if (flags[i].y - vOff > -flags[i].height && flags[i].y - vOff < SCREENHEIGHT)
      {
        shadowOAM[50 + i].attr0 = ATTR0_Y(flags[i].y - vOff) | ATTR0_SQUARE;
        // mgba_printf("flag %d on screen", i);
      }
      else
      {
        // flags[i].hide = 0;

        shadowOAM[50 + i].attr0 = ATTR0_HIDE;
      }
      shadowOAM[50 + i].attr1 = ATTR1_X(flags[i].x - hOff) | ATTR1_SMALL;
      shadowOAM[50 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(18, 0) | ATTR2_PRIORITY(0);
      if (ezSpriteCollision(flags[i], playerCar) && shadowOAM[50 + i].attr0 != ATTR0_HIDE)
      {
        score += 5;
        currFlagNum--;
        // mgba_printf("~~~~flag %d hit~~~~~", i);
        flags[i].hide = 0;
      }
    }
    else
    {
      shadowOAM[50 + i].attr0 = ATTR0_HIDE;
    }
    // mgba_printf("sprite %d HIDE is %s", i, shadowOAM[i + 110].attr0 == ATTR0_HIDE ? "true" : "false");
  }
}