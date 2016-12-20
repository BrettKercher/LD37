///scrDestroyTextBox
if toolTextBox != noone {
    with toolTextBox {
        instance_destroy()       
    }
    toolTextBox = noone
}

if insideTextBox != noone {
    with insideTextBox {
        instance_destroy()
    }
    insideTextBox = noone
}

if outsideTextBox != noone {
    with outsideTextBox {
        instance_destroy()
    }
    outsideTextBox = noone
}
