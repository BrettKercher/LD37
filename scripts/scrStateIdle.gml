///scrStateIdle

//counts up idle time
idleTime ++

//at critical mass, changes state
if ds_stack_size(held) > 0 and idleTime >= 300 {
    state = scrStateReturning
    idleTime = 0
}

//keeps them from overlapping too much
if place_meeting(x, y, objMan) {
    var overlap = instance_place(x, y, objMan);
    if overlap.state = scrStateIdle {
        var tempDir = point_direction(overlap.x, overlap.y, x, y)
        hspeed = lengthdir_x(normalSpeed/(2*weight), tempDir)
    }
} else {
    hspeed = 0
}

//if youre idle on the bucket, just shifts you straight to returning if you have something
if place_meeting(x, y, objBucket) and !ds_stack_empty(held) {
    state = scrStateReturning
}

