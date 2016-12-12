///scrCreateResource(type, x)

var resType = argument0;
var xPos = argument1;

var r = instance_create(xPos, 0, objResource);

r.type = resType

if(resType == WOOD)
{
    r.sprite_index = sprWood;
}
else if(resType == ROCK)
{
    r.sprite_index = sprRocks;
}
else if(resType == FOOD)
{
    r.sprite_index = sprCarrots;
}
else if(resType == SAP)
{
    r.sprite_index = sprSap;
}
else if(resType == GEM)
{
    r.sprite_index = sprGem;
}
else if(resType == FUR)
{
    r.sprite_index = sprFur;
}

r.y = room_height - 32 - sprite_get_width(sprite_index);

return r;
