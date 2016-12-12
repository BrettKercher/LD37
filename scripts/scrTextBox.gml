///scrTextBox(Text, x, y, speed)
xCoord = argument1;
yCoord = argument2;


var textObj = instance_create(xCoord, yCoord, objTextBox);

with(textObj) {

    padding = 16;
    maxLength = room_width;
    font = fnPixelatedSmaller;
    text = argument0;
    spd = argument3;
    
    textLength = string_length(text);
    fontSize = font_get_size(font);
    
    draw_set_font(font);
    textWidth = string_width_ext(text, fontSize + (fontSize / 2), maxLength);
    textHeight = string_height_ext(text, fontSize + (fontSize / 2), maxLength);

    boxWidth = textWidth + (padding * 2);
    boxHeight = textHeight + (padding * 2);
}




