#region Ellipse

// Variables
var _ellipse_corner_x1 = BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y1 = BATTLE_ENEMY_Y;
var _ellipse_corner_x2 = RES.WIDTH - BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y2 = BATTLE_PARTYLEADER_Y;

var _ellipse_center_x = (_ellipse_corner_x2 + _ellipse_corner_x1) / 2;
var _ellipse_center_y = (_ellipse_corner_y2 + _ellipse_corner_y1) / 2;

var _semi_horizontal_radius = (_ellipse_corner_x2 - _ellipse_corner_x1) / 2;
var _semi_vertical_radius = (_ellipse_corner_y2 - _ellipse_corner_y1) / 2;

var _major_axis = max(_semi_horizontal_radius, _semi_vertical_radius) * 2;
var _minor_axis = min(_semi_horizontal_radius, _semi_vertical_radius) * 2;

// Position calculations
for (var i = 0; i < array_length(carousel_points); i++) {
	
	var _offset = (theta_offset * (array_length(carousel_points) mod 2 != 0));
	var _point = (360 / array_length(party_units)) * i + theta;
	
	carousel_points[i].x = CAM_X + (_ellipse_center_x + (_semi_horizontal_radius * dcos(_point)));
	carousel_points[i].y = CAM_Y + (_ellipse_center_y + (_semi_vertical_radius * dsin(_point)));
	
}

#endregion

theta = lerp(theta, lerp_val_max, 0.1);

lerp_val_max = partypos[party_select];

party_select += (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up));
party_select = clamp(party_select, 0, array_length(global.party_names) - 1);

menu_select += (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left));

global.partym_selected = global.party_names[party_select];

if (KEY_ACCEPT) {
	current_menu = menu[menu_select];
}

if (KEY_CANCEL) {
	current_menu = 0;	
}

