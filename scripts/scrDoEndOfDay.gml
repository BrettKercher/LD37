///scrDoEndOfDay()

with objGame {
    fadeDirection = 1;
    endOfDay = true;
    for(var i = 0; i < array_length_1d(tools); i++)
    {
        tools[i] = 0;
    }
}

currentTime = 0;
dayNumber++;
