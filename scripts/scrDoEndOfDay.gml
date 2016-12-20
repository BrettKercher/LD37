///scrDoEndOfDay()

//triggers day end transition in game object--
//other visible effects (room transition) are done when the screen actually hits black
with objGame {
    fadeDirection = 1;
    endOfDay = true;
    isNewDay = true;
    selected = noone;
    objGame.stored[AXE] = 0
    objGame.stored[PICK] = 0
    objGame.stored[SPEAR] = 0
}

scrRoomTransition()

