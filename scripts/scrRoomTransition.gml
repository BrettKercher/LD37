///scrRoomTransition()

//makes men to door, drop resources
if room == Outside {
    for(var i = 0; i < instance_number(objMan); i++)
    {
        var person = instance_find(objMan, i);
        with(person)
        {
            sprite_index = sprMan
            state = scrStateGoingHome;
            scrDropResources();
        }
    }
}

//removes things that shouldn't stick around when you aren't looking for them
with(objWaypointIndicator)
{
    instance_destroy()
}
with(objWaypoint)
{
    instance_destroy()
}
with(objIndicator)
{
    instance_destroy()
}
