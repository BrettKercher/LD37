///scrDoEndOfDay()

with objGame {
    fadeDirection = 1;
    endOfDay = true;
    isNewDay = true;
    objGame.stored[AXE] = 0
    objGame.stored[PICK] = 0
    objGame.stored[SPEAR] = 0
}

with objMan {
    energy = fullEnergy;
    weak = false;
}

currentTime = 0;
dayNumber++;
