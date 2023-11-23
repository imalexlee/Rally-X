#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "tileset.h"
#include "trackBG.h"
#include "trackBG2.h"
#include "rallyXSprites2.h"
#include "playerCar.h"
#include "enemyCars.h"
#include "smoke.h"
#include "game.h"
#include "rocks.h"
#include "collisionMap.h"
#include "collisionMap2.h"
#include "flags.h"
#include "hearts.h"
#include "start.h"
#include "lose.h"
#include "fuel.h"
#include "win.h"
#include "score.h"
#include "pause.h"

void initialize();
void drawGame();
void initSprites();
void goToStart();
void start();
void goToLevel1();
void level1();
void goToLevel2();
void level2();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

unsigned short oldButtons;
unsigned short buttons;

extern u8 *collisionMap;

int drawImage3DMA(int x, int y, int width, int height, const u16 *image)
{
    int r;
    for (r = 0; r < height; r++)
    {
        DMANow(3, &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET(r + y, x, 240)], width);
    }
}

enum state
{
    START,
    LEVEL1,
    LEVEL2,
    PAUSE,
    WIN,
    LOSE
};

int currLevel = START;
int state = START;

int main()
{
    initialize();
    mgba_open();

    while (1)
    {

        switch (state)
        {
        case START:
            start();
            break;
        case LEVEL1:
            level1();
            break;
        case LEVEL2:
            level2();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        default:
            break;
        }

        oldButtons = buttons;
        buttons = REG_BUTTONS;
    }
}

void initSprites()
{
    initPlayerCar();
    initEnemyCars();
    initSmoke();
    initFlags();
    initRocks();
    initHearts();
    initFuel();
    initScore();
}

void initSprites2()
{
    initPlayerCar();
    initEnemyCars2();
    initRocks2();
    initFlags2();
    initSmoke();
    initFuel();
    initHearts();
}

void initialize()
{

    collisionMap = (unsigned char *)collisionMapBitmap;
    lives = 3;
    initSprites();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    fuelLevel = 100;
    currFlagNum = 10;
    score = 0;
    goToStart();
}

void goToStart()
{
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL | BG_8BPP;
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startPal, PALETTE, 256);
    DMANow(3, startMap, &SCREENBLOCK[20], startMapLen / 2);

    state = START;
}

void start()
{
    if (BUTTON_PRESSED(BUTTON_START))
        goToLevel1();
}

void goToLevel1()
{
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_LARGE;

    // bg stuff
    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, tilesetPal, PALETTE, 256);
    DMANow(3, trackBGMap, &SCREENBLOCK[8], trackBGMapLen / 2);

    // load sprites into memory
    DMANow(3, rallyXSprites2Tiles, &CHARBLOCK[4], rallyXSprites2TilesLen / 2);
    DMANow(3, rallyXSprites2Pal, SPRITEPALETTE, rallyXSprites2PalLen / 2);
    currLevel = LEVEL1;
    state = LEVEL1;
}

void level1()
{
    updateGame();
    drawGame();

    if (lives <= 0 || fuelLevel <= 0)
        goToLose();

    if (currFlagNum <= 0)
    {
        initSprites2();
        score += fuelLevel;
        fuelLevel = 100;
        goToLevel2();
    }

    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();
}

void goToLevel2()
{
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_LARGE;

    DMANow(3, tilesetTiles, &CHARBLOCK[0], tilesetTilesLen / 2);
    DMANow(3, tilesetPal, PALETTE, 256);
    DMANow(3, trackBG2Map, &SCREENBLOCK[8], trackBG2MapLen / 2);
    lives = 3;
    currFlagNum = 10;
    currLevel = LEVEL2;
    state = LEVEL2;
    collisionMap = (unsigned char *)collisionMap2Bitmap;
}

void level2()
{
    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START))
        goToPause();

    if (lives <= 0 || fuelLevel <= 0)
        goToLose();

    if (currFlagNum <= 0)
        goToWin();
}

void goToPause()
{
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL | BG_8BPP;

    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pausePal, PALETTE, 256);
    DMANow(3, pauseMap, &SCREENBLOCK[20], pauseMapLen / 2);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    state = PAUSE;
}

void pause()
{
    if (BUTTON_PRESSED(BUTTON_START))
    {
        if (currLevel == LEVEL1)
            goToLevel1();

        if (currLevel == LEVEL2)
            goToLevel2();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        initialize();

        goToStart();
    }
}

void goToLose()
{
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL | BG_8BPP;

    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseMap, &SCREENBLOCK[20], loseMapLen / 2);
    REG_BG0HOFF = 10;
    REG_BG0VOFF = 50;
    state = LOSE;
}

void lose()
{
    if (BUTTON_PRESSED(BUTTON_START))
        initialize();
}

void goToWin()
{
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL | BG_8BPP;

    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winMap, &SCREENBLOCK[20], winMapLen / 2);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    state = WIN;
}

void win()
{
    if (BUTTON_PRESSED(BUTTON_START))
        initialize();
}
