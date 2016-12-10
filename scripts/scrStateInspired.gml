
//find waypoint, move towards it
if instance_exists(objWaypoint) {
    target = objWaypoint.x
    dir = point_direction(x, y, target, y)
    speed = lengthdir_x((normalSpeed - weight), dir)
}

//destroy it when there
if abs(x - target) <= 5 {
    with objWaypoint {
        instance_destroy()
    }
    speed = 0
    if place_meeting(x, y, objResource) {
        state = scrStateGathering
        show_debug_message("Gathering")
    } else {
        state = scrStateIdle
        show_debug_message("Idle")
    }
}
