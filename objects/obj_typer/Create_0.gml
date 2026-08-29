depth = -1000;

// Based off of the youtube tutorial from Mimpy!!!!
// https://www.youtube.com/watch?v=P79MXZ4SsIg

// Dialogue commands
commands = [];
command_positions = [];

// Internal
progress = 0;
final_text = "if you're seeing this you either have undertale mod tool or something went really wrong";

var _command_pos_up_until_now = 1;
var _parsed_text = string_split_ext(text, ["{", "}"], false); // Parse the text for dialogue commands

final_text = "";

for (var i = 0; i < array_length(_parsed_text); i++) {
	if (i mod 2 == 0) {
		final_text += _parsed_text[i];
		array_push(command_positions, _command_pos_up_until_now + string_length(_parsed_text[i]));
	
		_command_pos_up_until_now += string_length(_parsed_text[i]);
	}
		
	else {
		array_push(commands, _parsed_text[i]);
	}
	
}
	
for (var i = 0; i < array_length(commands); i++) {
	commands[i] = string_split(commands[i], ",");
}

asterisk = (string_char_at(final_text, 1) == "*");

debugmsg(commands);