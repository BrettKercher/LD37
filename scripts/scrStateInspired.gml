
//find waypoint, move towards it
if objGame.selected == self and instance_exists(objWaypoint) {
    target = waypoint.x
    dir = point_direction(x, y, target, y)
    hspeed = lengthdir_x((normalSpeed/(2*weight)), dir)
    image_speed = animationSpeed
}

//destroy it when there
if abs(x - target) <= 5 {
    with waypoint {
        instance_destroy()
    }
    hspeed = 0
    image_speed = 0
    image_index = 0
    if place_meeting(x, y, objResource) {
        var res = instance_place(x, y, objResource);
        if(res.requiredTool == noone or res.requiredTool == tool)
        {
            state = scrStateGathering;
            idleTime = 0;
            show_debug_message("Gathering");
        }
    } 
    else if(place_meeting(x, y, objToolBox)) {
        state = scrStateEquipping;
        idleTime = 0;
        show_debug_message("Equipping");
    } 
    else {
        state = scrStateIdle
        idleTime = idleTime/2
        show_debug_message("Idle")
    }
}
