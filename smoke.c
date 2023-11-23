#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "game.h"

extern SPRITE smoke;
SPRITE playerCar;
OBJ_ATTR shadowOAM[128];

// keeps snapshot of where the smoke needs to stay
int currX;
int currY;
int currAniState;

void initSmoke()
{
  smoke.width = 16;
  smoke.height = 16;
  smoke.framesPassed = 100;
  smoke.numFrames = 4;
  smoke.aniFrame = 0; // 0 is hide, 1 is visible
  smoke.hide = 0;
}

void drawSmoke()
{
  // if triggered by player (visible)
  if (smoke.hide)
  {

    // place smoke properly
    switch (currAniState)
    {

    // car pointing UP
    case 0:
      smoke.x = currX;
      smoke.y = currY + playerCar.height;
      break;
    // car pointing DOWN
    case 1:
      smoke.x = currX;
      smoke.y = currY - smoke.height;
      break;
    // car pointing LEFT
    case 2:
      smoke.x = currX + playerCar.width;
      smoke.y = currY;
      break;
    // car pointing RIGHT
    case 3:
      smoke.x = currX - smoke.width;
      smoke.y = currY;
      break;
    default:
      break;
    }
    // animate the smoke
    // decrement frames paseed unti 0. upon reaching 0, hide smoke again. make it change appearance every 10 frames passed
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
      // smoke.aniFrame = 0;
      smoke.framesPassed = 100;
    }
    if (currY - vOff > -smoke.height && currY - vOff < SCREENHEIGHT)
    {
      shadowOAM[4].attr0 = ATTR0_Y(currY - vOff) | ATTR0_SQUARE;
    }
    else
    {
      shadowOAM[4].attr0 = ATTR0_HIDE;
    }

    shadowOAM[4].attr1 = ATTR1_X(currX - hOff) | ATTR1_SMALL;
    shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16 + smoke.aniState * 2, smoke.aniFrame * 2) | ATTR2_PRIORITY(0);
  }
  else
  {
    shadowOAM[4].attr0 = ATTR0_HIDE;
    currX = playerCar.x;
    currY = playerCar.y;
    currAniState = playerCar.aniState;
  }
}
