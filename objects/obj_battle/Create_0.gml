instance_deactivate_all(true);

global.partym_selected = noone;

partypos = [];
carousel_points = [];
party_units = [];
buttons = [
	spr_battle_button_fight,
	spr_battle_button_act,
	spr_battle_button_item,
];
menu_spr = spr_battle_menu;
menu_image_index = 0;
encounter_type = new Encounter(); 
menu_height = sprite_get_height(menu_spr);
menu_width = sprite_get_width(menu_spr);

theta = 360 / (array_length(carousel_points));
theta_offset = 180 / (array_length(carousel_points));
lerp_val_max = 0;

party_select = 0;
menu_select = 0;
current_menu = 0;

menu = [1, 1, 1];


enemy = noone;

#region Create Battle Instances

// Create party members
for (var i = 0; i < array_length(global.party_names); i++) {
	
	var _partym_name = global.party_names[i];
	var _partym_instance = partym_get_instance(_partym_name);
	
	carousel_points[i] = {x : 0, y : 0};
	
	if (i == 0) {
		party_units[i] = instance_create_depth(
			0,
			0,
			-999,
			obj_battle_party_leader,
			{name : _partym_name, carousel_spot : i}
		);
	}
	
	else {
		party_units[i] = instance_create_depth(
			0,
			0,
			-999,
			obj_battle_party_units,
			{name : _partym_name, carousel_spot : i}
		);	
	}
	
}

// Create enemy

// Variables
var _ellipse_corner_x1 = BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y1 = BATTLE_ENEMY_Y;
var _ellipse_corner_x2 = RES.WIDTH - BATTLE_PARTYMEMBER_XOFFSET;
var _ellipse_corner_y2 = BATTLE_PARTYLEADER_Y;

var _ellipse_center_x = (_ellipse_corner_x2 + _ellipse_corner_x1) / 2;
var _ellipse_center_y = (_ellipse_corner_y2 + _ellipse_corner_y1) / 2;

enemy = instance_create_depth(
	CAM_X + _ellipse_center_x,
	CAM_Y + _ellipse_center_y,
	-999, 
	obj_battle_enemy
);

array_push(carousel_points, {x : 0, y : 0});

#endregion

// what the fuck
for (var i = 0; i < array_length(party_units); i++) {
	var _offset = (theta_offset * ((array_length(carousel_points) mod 2 != 0))) / 2;
	var _unit = party_units[i];
	
	partypos[i] = (360 / array_length(party_units)) * _unit.carousel_spot + (2 * (180) + 90) + 180;
	
	partypos[i] = -abs(partypos[i]);
}

theta = partypos[0];