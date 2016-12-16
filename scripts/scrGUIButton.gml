///scrGUIButton(button1,button2,x1,y1,buffer,food1,food2)

var result = noone

//foreach
var food1 = argument5
var food2 = argument6

//sprite specs
var sprite1 = argument0
var sprite2 = argument1
var spritex = argument2
var spritey = argument3
var buffer = argument4
var spritew = sprite_get_width(sprite1)
var spriteh = sprite_get_height(sprite1)

//mouse location on gui
var xx = device_mouse_x_to_gui(0)
var yy = device_mouse_y_to_gui(0)

//edges of button to be pressed
var left = spritex
var top = spritey
var right = spritex + spritew
var bottom = spritey + spriteh

//draws food1 buttons first
for (i = 0; i < food1; i++) {
    var toNextButton = right + buffer
    if (xx > left + toNextButton*i and xx < right + toNextButton*i) and (yy > top and yy < bottom) {
        draw_sprite_ext(sprite1,0,spritex + toNextButton*i, spritey,1.1,1.1,0,c_white,1)
        if mouse_check_button_released(mb_left) {
            result = STEW
        }
    } else {
        draw_sprite(sprite1,0,spritex + right*i + buffer*i,spritey)
    }
}
//draws food2 buttons next
for (i = food1; i < food1 + food2; i++) {
    var toNextButton = right + buffer
    if (xx > left + toNextButton*i and xx < right + toNextButton*i) and (yy > top and yy < bottom) {
        draw_sprite_ext(sprite2,0,spritex + toNextButton*i, spritey,1.1,1.1,0,c_white,1)
        if mouse_check_button_released(mb_left) {
            result = GOURMET
        }
    } else {
        draw_sprite(sprite2,0,spritex + right*i + buffer*i,spritey)
    }
}

return(result)
