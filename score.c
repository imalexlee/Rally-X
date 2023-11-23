#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "hearts.h"
#include "game.h"

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
    shadowOAM[i + 60].attr0 = ATTR0_Y(scores[i].y) | ATTR0_SQUARE;
    shadowOAM[i + 60].attr1 = ATTR1_X(scores[i].x) | ATTR1_TINY;
    shadowOAM[i + 60].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(scoreValues[i], 6) | ATTR2_PRIORITY(0);
  }
}
