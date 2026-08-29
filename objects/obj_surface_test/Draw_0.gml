var _surface = surface_create(64, 64, surface_rgba8unorm);

surface_set_target(_surface);

draw_rectangle_color(0, 0, 64, 64, c_white, c_white, c_white, c_white, false);

draw_set_color(c_black);
draw_set_font(fn_main_1);

draw_text_ext(1, 1, "hold alt to move around the sprite", TEXTBOX_TEXT_LINE_SEP, 64);

draw_set_color(c_white);

draw_sprite(spr_battle_nametag_kris, 0, xx, yy);

surface_reset_target();

draw_surface(_surface, x, y);

surface_free(_surface);

