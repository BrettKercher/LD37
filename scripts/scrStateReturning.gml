///scrStateReturning()

//go back to bucket
if instance_exists(objBucket) {
    target = objBucket.x
    dir = point_direction(x, y, target, y)
    hspeed = lengthdir_x((normalSpeed/(2*weight)), dir)
}
//droppin' off
if abs(x - target) <= 5 {
    state = scrStateDropping
    hspeed = 0
}

