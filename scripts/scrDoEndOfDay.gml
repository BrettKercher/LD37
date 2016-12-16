///scrDoEndOfDay()

with objGame {
    fadeDirection = 1;
    endOfDay = true;
    isNewDay = true;
    for(var i = 0; i < array_length_1d(tools); i++)
    {
        tools[i] = 0;
    }
}

with objMan {
    energy = fullEnergy;
    weak = false;
}

currentTime = 0;
dayNumber++;
