
//find waypoint, move towards it
if objGame.selected == self and instance_exists(objWaypoint) and !attacking{
    target = waypoint.x
    idleTime = 0
    dir = point_direction(x, y, target, y)
    hspeed = lengthdir_x((normalSpeed/(2*weight)), dir)
    image_speed = animationSpeed
}

//destroy it when there
if (abs(x - target) <= 5 or collided) {
    with waypoint {
        if(other.collided)
        {
            other.collided = false;
            if place_meeting(x, y, objGate)
            {
                other.state = scrStateRemovingGate;
                other.idleTime = 0;
                other.interactingWith = instance_position(x, y, objGate);
                other.actionDelay = other.gateDestroyDelayTime;
                other.energy -= 10
                other.hspeed = 0;
                other.image_index = 0;
                other.image_speed = 0;
                show_debug_message("Removing Gate");
                instance_destroy();
                exit;
            }
        }
        instance_destroy()
    }
    hspeed = 0
    image_speed = 0
    image_index = 0
    target = noone
    if place_meeting(x, y, objResource) {
        var res = instance_place(x, y, objResource);
        if(res.requiredTool == noone or res.requiredTool == tool and !res.beingGathered)
        {
            res.beingGathered = true
            state = scrStateGathering;
            idleTime = 0;
            show_debug_message("Gathering");
        }
        else {
            state = scrStateIdle;
            idleTime = idleTime/2;
            show_debug_message("Idle");
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
