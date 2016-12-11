///scrStateEnemyCombat

if instance_exists(objMan) {
    //head towards combatTarget
    var len = normalSpeed
    dir = point_direction(x, y, combatTarget.x, combatTarget.y)
    hspeed = lengthdir_x(len, dir)
    
    //disengage if far away
    if point_distance(x,y, combatTarget.x, combatTarget.y) >= 64 {
    state = scrStateEnemyIdle
    inCombat = false
    hspeed = 0
    combatTarget = noone
    }
    //try and hit target
    if place_meeting(x,y, objMan) {
        attacking = true
    }

}


