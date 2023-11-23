#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "fuel.h"
#include "game.h"

extern SPRITE fuels[FUELNUM];
OBJ_ATTR shadowOAM[128];

// how fuel efficient your car is
int FUEL_EFFICIENCY = 750;

void initFuel()
{

  for (int i = 0; i < FUELNUM; i++)
  {
    fuels[i].width = 8;
    fuels[i].height = 8;
    fuels[i].x = 5 + i * 8;
    fuels[i].y = 5;
  }
}

void drawFuel()
{

  for (int i = 0; i < FUELNUM; i++)
  {
    if (i < fuelLevel / 10)
    {
      shadowOAM[i + 90].attr0 = ATTR0_Y(fuels[i].y) | ATTR0_SQUARE;
      shadowOAM[i + 90].attr1 = ATTR1_X(fuels[i].x) | ATTR1_TINY;
      shadowOAM[i + 90].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 0) | ATTR2_PRIORITY(0);
    }
    else
    {
      shadowOAM[i + 90].attr0 = ATTR0_HIDE;
    }
    if (!(gameCounter % FUEL_EFFICIENCY))
    {
      fuelLevel--;
    }
  }
}
