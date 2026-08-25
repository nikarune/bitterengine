// Update the target positions
if (follow != noone) {
	
	if (perfect_center) {
		var _sprite_topleft_x = follow.x - follow.sprite_xoffset;
		var _sprite_topleft_y = follow.y - follow.sprite_yoffset;
		
		var _x = _sprite_topleft_x + (follow.sprite_width div 2);
		var _y = _sprite_topleft_y + (follow.sprite_height div 2);
		
		x_to = _x;
		y_to = _y;
	}
	
	else {
		x_to = follow.x;
		y_to = follow.y;
	}
	
}

// For smooth camera stuff (if needed in the future)
var _delta_x = (x_to - x) / camera_easein_time;
var _delta_y = (y_to - y) / camera_easein_time;

x += _delta_x;
y += _delta_y;

// Camera

// Center the camera on screen
var _cam_x = x - (RES.WIDTH / 2);
var _cam_y = y - (RES.HEIGHT / 2);

_cam_x = clamp(_cam_x, 0, room_width - RES.WIDTH);
_cam_y = clamp(_cam_y, 0, room_height - RES.HEIGHT);

camera_set_view_pos(CAM, _cam_x, _cam_y);