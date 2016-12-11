///scrStateIdle

if(room == Outside)
{
    //counts up idle time
    idleTime ++
    
    //at critical mass, changes state
    //if you have resource, go drop it off
    if ds_stack_size(held) > 0 and idleTime >= 300 {
        state = scrStateReturning
        idleTime = 0
    //if you don't, wander around
    } else if idleTime >= 300 {
        state = scrStateWandering
        alarm[0] = irandom_range(60, 180)
        idleTime = 0
        //wander around home
        if distanceHome < sprite_get_width(sprRoomOutside) {
            dir = choose(180, 0)
        //if youre home, stay around there
        } else if distanceHome < 2*sprite_get_width(sprRoomOutside){
            dir = point_direction(x, y, objDoor.x, objDoor.y)
        //if youre far away, make sure you arent about to walk out of the room
        } else {
            if (x < 200) {
                dir = 0
            } else if ((room_width - x) < 200) {
                dir = 180
            } else {
                //random direction if you aren't in danger of escaping
                dir = choose(0, 180)
            }
        }
    }
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

//if youre idle on the bucket, just shifts you straight to returning if you have something
if place_meeting(x, y, objBucket) and !ds_stack_empty(held) {
    state = scrStateReturning
}

