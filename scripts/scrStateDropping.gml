///scrStateDropping()

while !ds_stack_empty(held) {
    var trash = ds_stack_pop(held);
    with trash {
        y = room_height - 32 - sprite_get_height(sprite_index)
        x = player.x + irandom_range(-1*sprite_get_width(player.sprite_index),sprite_get_width(player.sprite_index))
        gathered = false
        player = noone
    }
    weight -- 
}

state = scrStateIdle
if objGame.selected = id {
    sprite_index = sprManSelected
} else {
    sprite_index = sprMan
}

