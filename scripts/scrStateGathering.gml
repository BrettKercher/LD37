
var resource = instance_place(x, y, objResource);
if resource != noone and !resource.beingGathered {
    with resource {
        alarm[0] = 60 * (60/room_speed);
        beingGathered = true
    }
}

