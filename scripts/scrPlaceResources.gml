///scrPlaceResources

//Get church boundaries
var churchX = objRoomOutside.x;
var churchLeftX = churchX - (sprite_get_width(sprRoomOutside) / 2);
var churchRightX = churchX + (sprite_get_width(sprRoomOutside) / 2);

//get all instances of spawner, save its X position to a list
var spawners = ds_list_create();
var spawner = noone;
var i;
for(i = 0; i < instance_number(objResourceSpawner); i++)
{
    spawner = instance_find(objResourceSpawner, i);
    ds_list_add(spawners, spawner.x);
}

//Early out if there are no spawners
if(ds_list_size(spawners) == 0)
{
    exit;
}

//sort list in ascending order
ds_list_sort(spawners, true);

//loop through sorted list, get distance towards left neighbor and right neighbor (or room edge)
// and do random scattering
var prevX = 0;
var curX = 0;
var nextX = ds_list_find_value(spawners, 0);
var wiggleRoomLeft = 0;
var wiggleRoomRight = 0;
var actualX = 0;
var actualY = room_height - 32 - sprite_get_width(sprResource);
var separationConstant = 4;
var resoureceHalfWidth = sprite_get_width(sprResource) / 2;

for(i = 0; i < ds_list_size(spawners);  i++)
{
    prevX = curX;
    curX = ds_list_find_value(spawners, i);
    nextX = ds_list_find_value(spawners, i + 1);
    
    if(is_undefined(nextX))
    {
        nextX = room_width;
    }
    
    if(prevX < churchRightX and curX > churchRightX)
    {
        prevX = churchRightX;
    }
    
    if(nextX > churchLeftX and curX < churchLeftX)
    {
        nextX = churchLeftX;
    }
    
    wiggleRoomLeft = (((curX - resoureceHalfWidth) - (prevX + resoureceHalfWidth)) / 2);
    wiggleRoomRight = (((nextX - resoureceHalfWidth) - (curX + resoureceHalfWidth)) / 2);
    actualX = random_range(curX - wiggleRoomLeft, curX + wiggleRoomRight);
    
    if(i = 0)
    {
        show_debug_message(prevX);
        show_debug_message(churchRightX);
        show_debug_message(wiggleRoomLeft);
    }
    
    instance_create(actualX, actualY, objResource);
}
