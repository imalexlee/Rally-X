#include "playerCar.h"
#include "enemyCars.h"
#include "smoke.h"
#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "flags.h"
#include "rocks.h"
#include "hearts.h"
#include "fuel.h"
#include "score.h"

// func defs
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
SPRITE hearts[HEARTNUM];
SPRITE flags[FLAGNUM];
SPRITE rocks[ROCKNUM];
SPRITE fuels[FUELNUM];
SPRITE enemyCars[ENEMYNUM];
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
  return collisionMap[OFFSET(x, y, MAPWIDTH)];
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
  DMANow(3, shadowOAM, OAM, 512);
  REG_BG0HOFF = hOff;
  REG_BG0VOFF = vOff;
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
  // int right = playerCar.x + playerCar.width + 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;
  // return 1;
  return colorAt(left - playerCar.xDel, top) && colorAt(left - playerCar.xDel, bottom);
}

int canMoveRight()
{

  int left = playerCar.x;
  int right = playerCar.x + playerCar.width - 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;
  // return 1;
  return colorAt(right + playerCar.xDel, top) && colorAt(right + playerCar.xDel, bottom);
}

int canMoveUp()
{
  int left = playerCar.x;
  int right = playerCar.x + playerCar.width - 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;
  // return 1;
  return colorAt(left, top - playerCar.yDel) && colorAt(right, top - playerCar.yDel);
}

int canMoveDown()
{
  int left = playerCar.x;
  int right = playerCar.x + playerCar.width - 1;
  int top = playerCar.y;
  int bottom = playerCar.y + playerCar.height - 1;
  // return 1;
  return colorAt(right, bottom + playerCar.yDel) && colorAt(left, bottom + playerCar.yDel);
}

void updatePlayer()
{

  // read button press for player
  if (BUTTON_PRESSED(BUTTON_LEFT))
  {
    playerCar.aniState = LEFT;
  }

  else if (BUTTON_PRESSED(BUTTON_RIGHT))
  {
    playerCar.aniState = RIGHT;
  }

  else if (BUTTON_PRESSED(BUTTON_UP))
  {
    playerCar.aniState = UP;
  }

  else if (BUTTON_PRESSED(BUTTON_DOWN))
  {
    playerCar.aniState = DOWN;
  }

  // moves player continuously based on direction
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

  hOff = playerCar.x - (SCREENWIDTH - playerCar.width) / 2;
  vOff = playerCar.y - (SCREENHEIGHT - playerCar.height) / 2;

  if (playerCar.x < 0)
    playerCar.x = 0;
  if (playerCar.y < 0)
    playerCar.y = 0;
  if (playerCar.x > MAPWIDTH - playerCar.width)
    playerCar.x = MAPWIDTH - playerCar.width;
  if (playerCar.y > MAPHEIGHT - playerCar.height)
    playerCar.y = MAPHEIGHT - playerCar.height;

  if (hOff < 0)
    hOff = 0;
  if (vOff < 0)
    vOff = 0;
  if (hOff > MAPWIDTH - SCREENWIDTH)
    hOff = MAPWIDTH - SCREENWIDTH;
  if (vOff > MAPHEIGHT - SCREENHEIGHT)
    vOff = MAPHEIGHT - SCREENHEIGHT;
}

void updateEnemyCars()
{
  for (int i = 0; i < ENEMYNUM; i++)
  {

    if (ezSpriteCollision(playerCar, enemyCars[i]))
    {
      lives--;
      playerCar.x = 30;
      playerCar.y = 30;
    }

    // track player
    if (!(playerCar.framesPassed % 2))
    {
      // if this sprite is in the smoke, dont update position
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
  if (BUTTON_PRESSED(BUTTON_A))
  {
    if (!smoke.hide)
      fuelLevel -= 10;

    smoke.hide = 1;
  }
}

void updateRocks()
{
  for (int i = 0; i < ROCKNUM; i++)
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