///scrStateCombat

if objGame.selected == self {
    sprite_index = sprManAttackingSelected
} else {
    sprite_index = sprManAttacking
}
//gets rid of existing waypoints
if waypoint != noone {
    with waypoint {
        instance_destroy()
    }
    waypoint = noone
}

