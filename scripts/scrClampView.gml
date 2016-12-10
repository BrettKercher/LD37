///scrClampView()

if view_xview < 0 {
    view_xview = 0
}

if view_xview + view_wview > room_width {
    view_xview = room_width - view_wview
}

if view_yview < 0 {
    view_yview = 0
}

if view_yview + view_hview[0] > room_height {
    view_yview = room_height - view_hview
}
