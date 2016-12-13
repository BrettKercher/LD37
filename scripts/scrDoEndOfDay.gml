///scrDoEndOfDay()

with objGame {
    fadeDirection = 1;
    endOfDay = true;
    for(var i = 0; i < array_length_1d(tools); i++)
    {
        tools[i] = 0;
    }
}

with objMan {
    energy = fullEnergy;
}

currentTime = 0;
dayNumber++;
