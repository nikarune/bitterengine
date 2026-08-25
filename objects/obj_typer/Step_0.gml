progress = min(progress + global.dialogue_speed, string_length(text));

if (pos_lock) {
	x = CAM_X + xstart;
	y = CAM_Y + ystart;
}