///scrStateEnemyIdle

//counts up idle time
idleTime ++

//at critical mass, changes state
if idleTime >= 300 {
    state = scrStateEnemyWandering
    alarm[0] = irandom_range(60, 180)
    idleTime = 0
    dir = choose(0, 180)
}

