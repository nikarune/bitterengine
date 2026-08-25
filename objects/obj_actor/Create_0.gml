recording = true;
record = 0;

name = "bob";

party_status = -1;

local_frame = 0;
animation_end = false;

move_speed = 1;
x_speed = 0;
y_speed = 0;
is_colliding = false;

is_walking = false;

#region Functions

function actor_move_collide() {
	is_colliding = false; // Reset is_colliding
	
	// Horizontal Collision
	if (place_meeting(x + x_speed, y, COLLISION_OBJECTS)) {
		x_speed = 0;	
		is_colliding = true;
	}

	// Vertical Collision
	if (place_meeting(x, y + y_speed, COLLISION_OBJECTS)) {
		y_speed = 0;
		is_colliding = true;
	}
	
	x += x_speed;
	y += y_speed;
}

#endregion