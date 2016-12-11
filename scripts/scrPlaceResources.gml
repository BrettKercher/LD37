///scrPlaceResources

//Get church boundaries
var churchLeftX = instance_find(objChurchZoneMarker, 0).x;
var churchRightX = instance_find(objChurchZoneMarker, 1).x;

var gateY = room_height - 32 - sprite_get_height(sprAxeGate);
var gateLeftX = instance_find(objGateMarker, 0).x;
var gateRightX = instance_find(objGateMarker, 1).x;

var leftGate = instance_create(gateLeftX, gateY, objGate);
var rightGate = instance_create(gateRightX, gateY, objGate);

leftGate.sprite_index = choose(sprAxeGate, sprPickGate);
rightGate.sprite_index = choose(sprAxeGate, sprPickGate);

//Chance for a spawner to not spawn
var emptyChance = 0.05;
//Chance to spawn a neat-o tier 2 resource (only after gates)
var tierTwoChance = 0.6;
//Define Percent Threshold for each resource to appear
var resourceChance;
resourceChance[WOOD] = 0.33;
resourceChance[ROCK] = 0.67;
resourceChance[FOOD] = 1.00;

//get all instances of spawner, save its X position to a list
var spawners = ds_list_create();
var spawner = noone;
var randomPercent = 0;
var i;
for(i = 0; i < instance_number(objResourceSpawner); i++)
{
    randomPercent = random(1);
    if(randomPercent < emptyChance)
    {
        continue;
    }
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

var separationConstant = 4;
var resoureceHalfWidth = sprite_get_width(sprWood) / 2;

var resourceType = 0;
var isTierTwo = 0;
var resource = noone;

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
    else if(prevX < gateRightX and curX > gateRightX)
    {
        prevX = gateRightX;
    }
    else if(prevX < gateLeftX and curX > gateLeftX)
    {
        prevX = gateLeftX;
    }
    
    if(nextX > churchLeftX and curX < churchLeftX)
    {
        nextX = churchLeftX;
    }
    else if(nextX > gateLeftX and curX < gateLeftX)
    {
        nextX = gateLeftX;
    }
    else if(nextX > gateRightX and curX < gateRightX)
    {
        nextX = gateRightX;
    }
    
    wiggleRoomLeft = (((curX - resoureceHalfWidth) - (prevX + resoureceHalfWidth)) / 2);
    wiggleRoomRight = (((nextX - resoureceHalfWidth) - (curX + resoureceHalfWidth)) / 2);
    actualX = random_range(curX - wiggleRoomLeft, curX + wiggleRoomRight);
    
    //Y will be set later, after picking the sprite
    resource = instance_create(actualX, 0, objResource);
    
    randomPercent = random(1);
    for(resourceType = 0; resourceType < array_length_1d(resourceChance); resourceType++)
    {
        if(randomPercent < resourceChance[resourceType])
        {
            break;
        }
    }
    
    if(curX < gateLeftX or curX > gateRightX)
    {
        randomPercent = random(1);
        isTierTwo = (randomPercent <= tierTwoChance);
    }
    else
    {
        isTierTwo = false;
    }
    
    if(resourceType == WOOD)
    {
        if(isTierTwo)
        {
            resource.requiredTool = AXE;
            resource.sprite_index = sprTree;
        }
        else
        {
            resource.sprite_index = sprWood;
        }
    }
    else if(resourceType == ROCK)
    {
        if(isTierTwo)
        {
            resource.requiredTool = PICK;
            resource.sprite_index = sprBoulder;
        }
        else
        {
            resource.sprite_index = sprRocks;
        }
    }
    else
    {
        if(isTierTwo)
        {
            resource.requiredTool = SPEAR;
            resource.sprite_index = sprWildlife;
        }
        else
        {
            resource.sprite_index = sprCarrots;
        }
    }
    
    resource.type = resourceType;
    resource.y = room_height - 32 - sprite_get_height(resource.sprite_index);
}






