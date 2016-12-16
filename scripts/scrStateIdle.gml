///scrStateIdle
//counts up idle time
idleTime ++

//at critical mass, changes state
//if you have resource, go drop it off
if ds_stack_size(held) > 0 and idleTime >= 300 {
    state = scrStateReturning
    idleTime = 0
//if you don't, wander around (alarm returns to idle after)
} else if idleTime >= 300 {
    state = scrStateWandering
    alarm[0] = irandom_range(60, 180)
    idleTime = 0
}  
    
//keeps them from overlapping too much
if place_meeting(x, y, objMan) {
    var overlap = instance_place(x, y, objMan);
    if overlap.state = scrStateIdle {
        //cheesey fix for pixel perfect colliding
        if(overlap.x == x)
        {
            x += 1;
        }
        var tempDir = point_direction(overlap.x, overlap.y, x, y)
        hspeed = lengthdir_x(normalSpeed/(2*weight), tempDir)
    }
} else {
    hspeed = 0
}

//find the closest boundary to make sure you don't go past it
nearestBound = instance_nearest(x,y,objWanderBoundary)
var distanceToBound = point_distance(x, y, nearestBound.x, nearestBound.y)
//if you're not close to a bound, do whatever (90 is the furthest you can wander)
if distanceToBound > 90 {
    dir = choose(180, 0)
//if you're close to a bound, turn around
} else if distanceToBound < 90 {
    dir = point_direction(nearestBound.x, nearestBound.y, x, y)
}


//if youre idle on the bucket, just shifts you straight to returning if you have something
if place_meeting(x, y, objBucket) and !ds_stack_empty(held) {
    state = scrStateReturning
}

