///scrPlaceResources

//Get church boundaries
var churchX = objRoomOutside.x;
var churchLeftX = churchX - (sprite_get_width(sprRoomOutside) / 2);
var churchRightX = churchX + (sprite_get_width(sprRoomOutside) / 2);

//Chance for a spawner to not spawn
var emptyChance = 0.25;
//Define Percent Threshold for each resource to appear
var resourceChance;
resourceChance[WOOD] = 0.45;
resourceChance[ROCK] = 0.90;
resourceChance[FOOD] = 1.00;

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
var actualY = room_height - 32 - sprite_get_width(sprWood);

var separationConstant = 4;
var resoureceHalfWidth = sprite_get_width(sprWood) / 2;

var randomPercent = 0;
var resourceType = 0;
var resource = noone;

for(i = 0; i < ds_list_size(spawners);  i++)
{
    prevX = curX;
    curX = ds_list_find_value(spawners, i);
    nextX = ds_list_find_value(spawners, i + 1);
    
    randomPercent = random(1);
    if(randomPercent < emptyChance)
    {
        continue;
    }
    
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
    
    resource = instance_create(actualX, actualY, objResource);
    
    randomPercent = random(1);
    for(resourceType = 0; resourceType < array_length_1d(resourceChance); resourceType++)
    {
        if(randomPercent < resourceChance[resourceType])
        {
            break;
        }
    }
    
    if(resourceType == WOOD)
    {
        resource.sprite_index = sprWood;
    }
    else if(resourceType == ROCK)
    {
        resource.sprite_index = sprRocks;
    }
    else
    {
        resource.sprite_index = sprCarrots;
    }
    
    
    
    resource.type = resourceType;
}






