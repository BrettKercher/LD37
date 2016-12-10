
var resource = instance_place(x, y, objResource);
if resource != noone and !resource.gathered {
    with resource {
            alarm[0] = 60 * (60/room_speed)
            show_debug_message("dingalingaling")
            gathered = true
    }
}

