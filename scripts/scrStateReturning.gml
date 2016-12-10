///scrStateReturning()

//go back to bucket
if instance_exists(objBucket) {
    target = objBucket.x
    dir = point_direction(x, y, target, y)
    speed = lengthdir_x((normalSpeed/(2*weight)), dir)
}
//droppin' off
if abs(x - target) <= 5 {
    state = scrStateDropping
    speed = 0
}

