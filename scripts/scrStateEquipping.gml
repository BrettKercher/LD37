///scrStateEquipping

var toolBox = instance_place(x, y, objToolBox);

if toolBox != noone and toolBox.numTools > 0 and tool == noone {
    toolBox.numTools--;
    toolBox.image_index = clamp(toolBox.numTools, 0, 2);
    tool = toolBox.toolType;
}
else if(toolBox != noone and tool == toolBox.toolType) {
    toolBox.numTools++;
    toolBox.image_index = clamp(toolBox.numTools, 0, 2);
    tool = noone;
}

state = scrStateIdle;
