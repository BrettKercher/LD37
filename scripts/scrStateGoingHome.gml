///scrStateGoingHome

//go back to church door
if instance_exists(objDoor) {
    target = objDoor.x
    dir = point_direction(x, y, target, y)
    hspeed = lengthdir_x((normalSpeed/(2*weight)), dir)
    image_speed = .1
}
//goin' inside
if abs(x - target) <= 5 {
    image_alpha -= 0.05;
    hspeed = 0
    image_speed = 0
    image_index = 0
}
