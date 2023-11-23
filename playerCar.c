#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "game.h"

extern SPRITE playerCar;
OBJ_ATTR shadowOAM[128];

void initPlayerCar()
{
  playerCar.width = 16;
  playerCar.height = 16;
  playerCar.xDel = 1;
  playerCar.yDel = 1;
  playerCar.framesPassed = 10;
  playerCar.numFrames = 3;
  playerCar.aniFrame = 0;
  playerCar.aniState = 3;
  playerCar.x = 30;
  playerCar.y = 30;
}

void drawPlayerCar()
{

  if (playerCar.framesPassed > 0)
  {
    playerCar.framesPassed--;
  }
  else
  {
    playerCar.aniFrame = ++playerCar.aniFrame % playerCar.numFrames;
    playerCar.framesPassed = 10;
  }

  shadowOAM[0].attr0 = ATTR0_Y(playerCar.y - vOff) | ATTR0_SQUARE;
  shadowOAM[0].attr1 = ATTR1_X(playerCar.x - hOff) | ATTR1_SMALL;
  shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(playerCar.aniState * 2, playerCar.aniFrame * 2) | ATTR2_PRIORITY(0);
}
