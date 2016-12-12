///scrStateReturning()

//go back to bucket
if instance_exists(objBucket) {
    var bwidth = sprite_get_width(sprBucket);
    target = irandom_range(objBucket.x - sprBucket/4, objBucket.x + sprBucket/4)
    dir = point_direction(x, y, target, y)
    if !weak {
        hspeed = lengthdir_x((normalSpeed/(2*weight)), dir)
    } else {
        hspeed = lengthdir_x((wanderSpeed/(2*weight)), dir)
    }
    image_speed = animationSpeed
}
//droppin' off
if abs(x - target) <= 5 {
    state = scrStateDropping
    target = 0
    hspeed = 0
    image_speed = 0
    image_index = 0
}

