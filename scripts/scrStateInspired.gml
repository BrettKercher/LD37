
//find waypoint, move towards it
if objGame.selected == self and instance_exists(objWaypoint) and !attacking  and !crafting {
    target = waypoint.x
    idleTime = 0
    dir = point_direction(x, y, target, y)
    if !weak {
        hspeed = lengthdir_x((normalSpeed/(2*weight)), dir)
    } else {
        hspeed = lengthdir_x((wanderSpeed/(2*weight)), dir)
    }
    if ds_stack_empty(held) {
        sprite_index = sprMan
    } else {
        sprite_index = sprManCollecting
    }
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
                with myIndicator {
                    instance_destroy()
                }
                instance_destroy();
                exit;
            }
        }
        with myIndicator {
            instance_destroy()
        }
        instance_destroy()
    }
    hspeed = 0
    image_speed = 0
    image_index = 0
    target = noone
    if place_meeting(x, y, objResource) {
        var res = instance_place(x, y, objResource);
        if(res.requiredTool == noone or res.requiredTool == tool and !res.beingGathered and !weak)
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
        //only starts equipping if you even can
        var hit = instance_place(x,y,objToolBox)
        if hit.sprite_index != hit.emptySprite and (tool == hit.toolType or tool == noone) and ds_stack_empty(held){
            state = scrStateEquipping;
            hit.beingEquipped = true
            idleTime = 0;
            show_debug_message("Equipping");
        }
    } 
    else {
        state = scrStateIdle
        idleTime = idleTime/2
        show_debug_message("Idle")
    }
}
