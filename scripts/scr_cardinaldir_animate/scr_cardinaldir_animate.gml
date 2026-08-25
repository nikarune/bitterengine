/// @desc Animates a sprite based on its calculated cardinal direction.
function cardinal_animate() {
	
	var _total_frames = sprite_get_number(sprite_index) / DIRECTION_COUNT;
	
	image_index = local_frame + (CARDINAL_DIR * _total_frames);
	
	local_frame += (sprite_get_speed(sprite_index) * image_speed) / FPS;
	
	// Reset the animation if it's past the set number of frames
	if (local_frame >= _total_frames) {
		animation_end = true;
		local_frame -= _total_frames;
	}
	
	else {
		animation_end = false;
	}
	
}

/// @deprecated
function cardinal_animate_battle() {
	var _total_frames = sprite_get_number(sprite_index) / 8;
	
	image_index = local_frame + (BATTLE_CARDINAL_DIR * _total_frames);
	
	local_frame += (sprite_get_speed(sprite_index) * image_speed) / FPS;
	
	if (local_frame >= _total_frames) {
		animation_end = true;
		local_frame -= _total_frames;
	}
	
	else {
		animation_end = false;
	}
}