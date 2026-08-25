/// @desc Runs commands parsed from dialogue.
/// @arg {Array} command The array of the command index and parameters to run.
function run_dialogue_command(_cmd) {
	
	// Get the command and its parameters
	var _cmd_index = _cmd[0];
	var _cmd_params = [];
	
	array_copy(_cmd_params, 0, _cmd, 1, array_length(_cmd) - 1);
	
	switch (_cmd_index) {
		// CLEAR COMMANDS (reset to defaults)
		case "clear":
		
			draw_set_font(fn_main);
			draw_set_color(c_white);
		
		break; 
		
		// Color switching
		case "c":
			
			// Get the from the color library.
			var _color_index = _cmd_params[0];
			var _color = global.color_library[$ _color_index];
			
			// Set the color.
			draw_set_color(_color);
			
		break;
		
		// Font switching
		case "f":
			
			// Get the font
			var _font = asset_get_index(_cmd_params[0]);
			
			draw_set_font(_font);		
			
		break;	
	}
}