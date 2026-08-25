// Based off of the youtube tutorial from Mimpy!!!!
// https://www.youtube.com/watch?v=P79MXZ4SsIg

/// @deprecated
/// @desc Draws text for dialogue boxes. **Is now replaced by obj_typer.**
function draw_text_dbox(_x, _y, _str, _progress, _width, _sep, _offset = 0, _asterisk = false) {
	#region Init (change this so it only has to run once)
	
	var _text = "";
	
	var _array = string_split_ext(_str, ["{", "}"], false);
	var _commands = [];
	var _command_positions = [];
	var _command_pos_up_until_now = 1;
	var _command_index = 0;
	
	for (var i = 0; i < array_length(_array); i++) {
		if (i mod 2 == 0) {	
			_text += _array[i];
			array_push(_command_positions, _command_pos_up_until_now + string_length(_array[i]));
			
			_command_pos_up_until_now += string_length(_array[i]);	
		}
		
		else {
			array_push(_commands, _array[i]);
		}
		
	}
	
	for (var i = 0; i < array_length(_commands); i++) {
		_commands[i] = string_split(_commands[i], ",");
	}
	
	#endregion
	
	var _draw_x = _offset;
	var _draw_y = 0;
	
	if (_asterisk) {
		draw_text(_x, _y + _draw_y, "*");
	}
	
	for (var i = 1; i <= _progress; i++) {
		
		var _char = string_char_at(_text, i);
		
		// Run dialogue commands
		if (array_contains(_command_positions, i)) {
			run_dialogue_command(_commands[_command_index]);
			_command_index = min(_command_index + 1, array_length(_commands) - 1);
		}
		
		// Normal line breaks (*)
		if (_char == "*") {
			// Reset position
			_draw_x = _offset;
			_draw_y += _sep;
			
			if (_asterisk) {
				draw_text(_x, _y + _draw_y, "*");
			}
		}
		
		// Draw without asterisk (\n)
		else if (_char == "\n") {
			// Reset position
			_draw_x = _offset;
			_draw_y += _sep;
		}
		
		// Dynamic line breaks.
		else if (_char == " ") {
			_draw_x += string_width(_char); // Skip past the space.
			
			var _word_width = 0;
			
			for (var ii = i + 1; ii <= string_length(_str); ii++) {
				var _word_char = string_char_at(_str, ii);
				
				// If we've reached the end of the word, stop this loop.
				if (_word_char == "\n" or _word_char == " " or _word_char == "*") {
					break;	
				}
				
				_word_width += string_width(_word_char);
				
				if (_draw_x + _word_width > _width - _offset) {
					
					_draw_x = _offset;
					_draw_y += _sep;
					break;
					
				}
				
			}
			
		}
	
		else {
			
			// Draw the character.
			draw_text(_x + _draw_x, _y + _draw_y, _char);
			_draw_x += string_width(_char);
			
		}
		
	}
	
}