///scrStateIdle

//counts up idle time
idleTime ++

//at critical mass, changes state
if ds_stack_size(held) > 0 and idleTime >= 300 {
    state = scrStateReturning
    idleTime = 0
}

