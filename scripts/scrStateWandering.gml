///scrStateWandering

//start moving, unless you hit a door you can't open
if(!collided)
{
    var len = wanderSpeed
    hspeed = lengthdir_x(len, dir)
    image_speed = animationSpeed
}
else {
    state = scrStateIdle;
    hspeed = 0;
    image_speed = 0;
    collided = false;
}
