#region Menu init

// Main Selection
var _menux = party_units[party_select].x + BATTLE_MENU_XOFFSET;
var _menuy = party_units[party_select].y + BATTLE_MENU_YOFFSET;

// Menu Animation
menu_image_index = menu_image_index mod sprite_get_number(menu_spr);
menu_image_index += sprite_get_speed(menu_spr) / FPS;

draw_sprite_stretched(menu_spr, menu_image_index, _menux, _menuy, menu_width, menu_height); // Draw the menu BG

#endregion

#region Main Menu (action selection)

if (current_menu == 0) {
	
	#region Variables
	
	// Scale
	menu_height = sprite_get_height(menu_spr);
	menu_width = sprite_get_width(menu_spr);
	
	// Button variables
	var _button_line_x = _menux + BATTLE_MENU_BUTTON_MARGIN;
	var _button_line_y = _menuy + sprite_get_height(menu_spr) / 2;
	var _button_line_w = sprite_get_width(menu_spr) - (BATTLE_MENU_BUTTON_MARGIN * 2);

	#endregion
	
	#region Draw
	
	// Draw the buttons
	for (var i = 0; i < array_length(buttons); i++) {

		var _button_spr = buttons[i];
		var _button_x = _button_line_x + ((_button_line_w / (array_length(buttons) - 1)) * i);
		var _button_y = _button_line_y;
	
		if (menu_select == i) {
			draw_sprite_ext(_button_spr, 0, _button_x, _button_y, 1, 1, 0, c_yellow, 1);
		}
		
		else {
			draw_sprite_ext(_button_spr, 0, _button_x, _button_y, 1, 1, 0, c_white, 1);
		}
	
	}
	
	#endregion
	
}

#endregion

#region Submenu (actions menu)

else if (current_menu == 1) {
	
	// Loop through the actions
	for (var i = 0; i < array_length(encounter_type.actions); i++) {
		
		#region Variables
		
		// Info
		var _action = encounter_type.actions[i]
		var _action_name = _action.name;
		var _action_desc = _action.description;
		
		// Scale
		var _text_chunk_width = sprite_get_width(menu_spr) - (BATTLE_MENU_TEXT_MARGIN * 2);
		var _text_chunk_height = BATTLE_MENU_TEXT_NAME_SEP + (BATTLE_MENU_TEXT_DESC_SEP + string_height_ext(_action_desc, BATTLE_MENU_TEXT_DESC_SEP, _text_chunk_width));
		
		// Coordinates
		var _namex = _menux + BATTLE_MENU_TEXT_MARGIN;
		var _namey = _menuy + BATTLE_MENU_TEXT_MARGIN + (_text_chunk_height * i);
		var _descx = _namex;
		var _descy = _namey + BATTLE_MENU_TEXT_NAME_SEP
		
		#endregion
		
		#region Draw 
		
		// Draw init
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fn_main);
		draw_set_color(c_white);
		
		draw_text(CAM_X + _namex, CAM_Y + _namey, _action_name); // Draw the action name
		
		// Draw init for the description
		draw_set_font(fn_main_1);
		draw_set_color(c_grey);
		
		draw_text_ext(CAM_X + _descx, CAM_Y + _descy, _action_desc, BATTLE_MENU_TEXT_DESC_SEP, _text_chunk_width); // Draw the action description
		
		#endregion
		
		menu_height = (_text_chunk_width * i) + BATTLE_MENU_TEXT_MARGIN; // Set the menu height correctly
		
	}
	
}

#endregion

// Battle nametag
draw_sprite(partym_get_sprite(global.party_names[party_select], "battle_nametag"), 0, _menux, _menuy);

for (var i = 0; i < array_length(global.party_names); i++) {
	draw_set_font(fn_main_1);
	
	var _partym_name = global.party_names[i];
	var _icon = partym_get_sprite(_partym_name, "icon");
	
	var _iconx = BATTLE_MENU_ICON_MARGIN;
	var _icony = BATTLE_MENU_ICON_MARGIN + BATTLE_MENU_ICON_SEP * i;
	
	if (party_select == i) {
		draw_text(_iconx, _icony, ">")	
		
		_iconx += 10;
	}
	
	draw_sprite(_icon, 0, _iconx, _icony);
	draw_text(_iconx + 20, _icony, _partym_name)
	
}