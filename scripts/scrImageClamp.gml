///scrScaleClamp()

//xscale
if image_xscale <= 0 {
    image_xscale = 0
} else if image_xscale >= 1 {
    image_xscale = 1
}

//yscale
if image_yscale <= 0 {
    image_yscale = 0
} else if image_yscale >= 1 {
    image_yscale = 1
}

//alpha
if image_alpha <= 0 {
    image_alpha = 0
} else if image_alpha >= 1 {
    image_alpha = 1
}
