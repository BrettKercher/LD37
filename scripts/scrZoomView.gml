///scrZoomView()

if mouse_wheel_up() {
    if view_wview >= viewwMin + viewwMin/zoomSpeed {
        view_wview -= viewwMin/zoomSpeed
        view_hview -= viewhMin/zoomSpeed
        view_xview += viewwMin/(zoomSpeed*2)
        view_yview += viewhMin/zoomSpeed
    }
}

if mouse_wheel_down() {
    if view_wview <= viewwMax - viewwMin/zoomSpeed {
        view_wview += viewwMin/zoomSpeed
        view_hview += viewhMin/zoomSpeed       
        view_xview -= viewwMin/(zoomSpeed*2)
        view_yview -= viewhMin/(zoomSpeed*2)     
    }
}

