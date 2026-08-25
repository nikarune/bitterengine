if (keyboard_check_pressed(vk_f3)) {
	global.debug = !global.debug;
}


show_debug_log(global.debug);