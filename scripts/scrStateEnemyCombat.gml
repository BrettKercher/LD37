///scrStateEnemyCombat

var len = normalSpeed
dir = point_direction(x, y, combatTarget.x, combatTarget.y)
hspeed = lengthdir_x(len, dir)

if point_distance(x,y, combatTarget.x, combatTarget.y) >= 64 {
    state = scrStateEnemyIdle
    inCombat = false
    combatTarget = noone
}

if place_meeting(x,y, objMan) {
    attacking = true
}

