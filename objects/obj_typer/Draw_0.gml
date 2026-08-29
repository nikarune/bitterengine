var _draw_x = offset;
var _draw_y = 0;

var _command_index = 0;
	
for (var i = 1; i <= progress; i++) {
	var _char = string_char_at(final_text, i);
		
	// Run dialogue commands
	if (array_contains(command_positions, i)) {
		run_dialogue_command(commands[_command_index]);
		_command_index = min(_command_index + 1, array_length(commands) - 1);	
	}
	
	// Normal line breaks (*)
	if (_char == "*") {
		// Reset position
		if (i != 1) {
			_draw_x = offset;
			_draw_y += text_line_sep;
		}
			
		if (asterisk) {
			draw_text(x, y + _draw_y, "*");
		}
	}
		
	// Draw without asterisk (\n)
	else if (_char == "\n") {
		// Reset position
		_draw_x = offset;
		_draw_y += text_line_sep;		
	}
		
	// Dynamic line breaks.
	else if (_char == " ") {
		
		_draw_x += string_width(_char); // Skip past the space.
			
		var _word_width = 0;
			
		for (var ii = i + 1; ii <= string_length(final_text); ii++) {
			var _word_char = string_char_at(final_text, ii);
				
			// If we've reached the end of the word, stop this loop.
			if (_word_char == "\n" or _word_char == " " or _word_char == "*") {
				break;	
			}
				
			_word_width += string_width(_word_char);
				
			if (_draw_x + _word_width > text_line_width - offset) {
				_draw_x = offset;
				_draw_y += text_line_sep;
				
				break;
			}
		}
	}
	
	else {	
		// Draw the character.
		draw_text(x + _draw_x, y + _draw_y, _char);
		_draw_x += string_width(_char);
	}
}