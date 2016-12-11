///scrStateRemovingGate

if(interactingWith == noone or interactingWith.object_index != objGate or tool != interactingWith.requiredTool)
{
    state = scrStateIdle;
    interactingWith = noone;
    actionDelay = 0;
}

if(actionDelay > 0) {
    actionDelay--;
}
else {
    state = scrStateIdle;
    if(interactingWith != noone)
    {
        with(interactingWith)
        {
            instance_destroy();
            interactingWith = noone;
            actionDelay = 0;
        }
    }
}
