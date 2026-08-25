// Init
depth = -999;

// Textbox
textbox_x = TEXTBOX_BOTTOM_X;
textbox_y = TEXTBOX_BOTTOM_Y;

textbox_width = TEXTBOX_WIDTH;
textbox_height = TEXTBOX_HEIGHT;

textbox_sprite = spr_box;

// Text
text_top_margin = TEXTBOX_TEXT_TOP_MARGIN;
text_side_margin = TEXTBOX_TEXT_SIDE_MARGIN;

text_line_sep = TEXTBOX_TEXT_LINE_SEP;
text_line_width = textbox_width - (text_side_margin * 2);

text_x = textbox_x + text_side_margin;
text_y = textbox_y + text_top_margin;

text_font = fn_main;

// InternalS
page = 0;
page_number = array_length(global.dialogue_pages);

typing_progress = 0;
text_string_length = 0;

typer = dialogue_create_typer(global.dialogue_pages[page], text_x, text_y, text_line_width, text_line_sep, true);

//global.dialogue_pages[0] = "This is test dialogue that{c,c_red} is red{c,c_white} but now its not{c,c_blue} blue{c,c_white} it's{c,c_aqua} AQUA{c,c_white}. but now its not now its{c,c_lime} sooo green{c,c_white}.";
//global.dialogue_pages[1] = "oooooooooooooooooooooohhhh"
//global.dialogue_pages[2] = "story of{c,c_red} UNDERTALE{c,c_white}";
//global.dialogue_pages[3] = "i am{f,fn_main_1} tiny now!{clear} but now im not";
//global.dialogue_pages[4] = "i am now{f,fn_papyrus} PAPYRUS FROM HIT GAME {c,c_red} UNDERTALE{c,c_white}."
