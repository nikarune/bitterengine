depth = -bbox_bottom;

// Update party status.
status = partym_get_status(name);

// Give the party leader player controls.
if (status == PARTY.LEADER) {
	global.record_ref = id; // The party manager will now record the position of this instance.

	#region Player Controls

	// Calculate movement (vectors and stuff)
	var _input_x = KEY_RIGHT - KEY_LEFT;
	var _input_y = KEY_DOWN - KEY_UP;
	var _input_dir = point_direction(0, 0, _input_x, _input_y);
	var _input_len = (_input_x != 0) or (_input_y != 0);
	
	x_speed = _input_x * move_speed;
	y_speed = _input_y * move_speed;
	
	actor_move_collide();
	
	// Set direction.
	if (_input_len != 0) {
		direction = _input_dir;
	}
	
	#endregion
	
	// Get whether the actor is walking or not.
	is_walking = (_input_len != 0);
}

// Record the position of the other party members.
else if (recording) {
	// Set the party member's position and direction.
	x = obj_party_manager.pos[record].x;
	y = obj_party_manager.pos[record].y;
	direction = obj_party_manager.pos[record].direction;
	
	// Get whether the actor is walking or not.
	is_walking = (x != xprevious or y != yprevious);
}

#region Sprites

var _start_sprite = sprite_index;

// Set sprite correctly.
if (is_walking) {
	sprite_index = partym_get_sprite(name, "walk");
}

else {
	sprite_index = partym_get_sprite(name, "idle");
}

// If the sprite changed, reset the local frame.
if (_start_sprite != sprite_index) {
	local_frame = 0;
}

cardinal_animate();

#endregion