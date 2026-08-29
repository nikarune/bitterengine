/// @desc Sets the dialogue to run.
/// @arg {Array, String} dialogue The text array to set the dialogue to. Can be passed in as a single string for one-liners.
function dialogue_prep(_dialogue) {	
	if (!is_array(_dialogue)) {
		_dialogue = [_dialogue];	
	}
	
	global.dialogue_pages = _dialogue;
}

/// @desc Clears the dialogue pages.
function dialogue_clear() {
	global.dialogue_pages = [];
}

/// @desc Creates a textbox to run the dialogue.
function dialogue_run() {
	instance_create_depth(0, 0, -999, obj_textbox);
}

/// @desc Create a typer to draw out text. Returns the Instance ID of the typer.
/// @returns {Id.Instance}

function dialogue_create_typer(_str, _x, _y, _width, _sep, _poslock, _offset = 0) {
	var _id = instance_create_depth(_x, _y, -999, obj_typer, {
		text : _str,
		text_line_sep : _sep,
		text_line_width : _width,
		pos_lock : _poslock,
		offset : _offset,
	});
	
	return (_id);
}