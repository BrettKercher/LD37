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
//faces the enemy
dir = point_direction(x, y, combatTarget.x, combatTarget.y)
if abs(dir - 0) < 45 {
    image_xscale = 1
} else {
    image_xscale = -1
}

//begins attack
if place_meeting(x,y, objEnemy) {
    attacking = true
}

