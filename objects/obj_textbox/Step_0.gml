// Update all variables
page_number = array_length(global.dialogue_pages);
text_string_length = string_length(global.dialogue_pages[page]);


if (KEY_ACCEPT and typer.progress >= text_string_length) {
	page++;
	
	instance_destroy(typer);
	
	if (page >= page_number) {
		instance_destroy(typer);
		instance_destroy();	
	}
	
	// Create a new typer if there's more text
	else {
		typer = dialogue_create_typer(
			global.dialogue_pages[page],
			text_x,
			text_y,
			text_line_width,
			text_line_sep,
			true
		);
	}
}

if (KEY_CANCEL) {
	typer.progress = text_string_length;
}