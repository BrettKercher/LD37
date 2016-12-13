///scrManDeath()

var list = objGame.manList
var ind = ds_list_find_index(list, self)
ds_list_delete(list, ind)

if(ds_list_empty(list))
{
    room_goto(LoseRoom);
}

instance_destroy()

