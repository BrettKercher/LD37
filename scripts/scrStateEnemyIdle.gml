///scrStateEnemyIdle

sprite_index = sprEnemy
hspeed = 0

//counts up idle time
idleTime ++

//at critical mass, changes state
if idleTime >= 300 {
    state = scrStateEnemyWandering
    alarm[0] = irandom_range(60, 180)
    idleTime = 0
    //make sure you don't walk out of room
    if (x < 200) {
        dir = 0
    } else if ((room_width - x) < 200) {
        dir = 180
    } else {
        dir = choose(0, 180)
    }
}

