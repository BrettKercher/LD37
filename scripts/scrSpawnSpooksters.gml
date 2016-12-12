///scrSpawnSpooksters

if(room == Outside)
{
    if(spooksterSpawnTimer < room_speed)
    {
        spooksterSpawnTimer++;
    }
    else
    {
        spooksterSpawnTimer = 0;
        var rand = random(1);
        show_debug_message(rand);
        if(spooksterCount < maxSpooksterCount[objNightCycle.phase] and rand < spooksterSpawnChance[objNightCycle.phase])
        {
            //spawn spookster
            show_debug_message("spawning spookster");
            var xPos = choose(random_range(64,instance_find(objChurchZoneMarker, 0).x), random_range(instance_find(objChurchZoneMarker, 1).x,room_width - 64));
            instance_create(xPos, 0, objEnemy);
            spooksterCount++;
            randomize();
        }
    }
}
