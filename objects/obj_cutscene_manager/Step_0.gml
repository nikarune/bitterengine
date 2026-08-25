var _current_scene = scene_info[scene];

if (array_length(_current_scene) > 1) {
	var _args = [];
	array_copy(_args, 0, _current_scene, 1, array_length(_current_scene) - 1);

	script_execute_ext(_current_scene[0], _args);
}

else {
	script_execute(_current_scene[0]);
}