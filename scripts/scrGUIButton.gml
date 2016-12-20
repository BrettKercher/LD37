///scrGUIEndDay(sprite,x,y)

var result = false

//sprite specs
var sprite = argument0
var spritex = argument1
var spritey = argument2
var spritew = sprite_get_width(sprite)
var spriteh = sprite_get_height(sprite)

//mouse location on gui
var xx = device_mouse_x_to_gui(0)
var yy = device_mouse_y_to_gui(0)

//edges of button to be pressed
var left = spritex - spritew/2
var top = spritey
var right = spritex + spritew/2
var bottom = spritey + spriteh

if (xx > left and xx < right) and (yy > top and yy < bottom) {
    draw_sprite_ext(sprite, 0, spritex, spritey,1.1,1.1,0,c_white,1)
    if mouse_check_button_released(mb_left) {
        result = true
    }
} else {
    draw_sprite(sprite, 0,spritex, spritey)
}

return(result)

