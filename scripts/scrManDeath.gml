///scrManDeath()

var list = objGame.manList
var ind = ds_list_find_index(list, self)
ds_list_delete(list, ind)

instance_destroy()

