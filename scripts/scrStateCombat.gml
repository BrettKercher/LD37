///scrStateCombat

sprite_index = sprManAttacking

//gets rid of existing waypoints
if waypoint != noone {
    with waypoint {
        with myIndicator {
            instance_destroy()
        }
        instance_destroy()
    }
    waypoint = noone
}

