#region Meta

/// @desc Ends the current scene. Should be called inside of all scene functions.
function end_scene() {
	validate_scene();
	
	scene++;
	
	if (scene >= array_length(scene_info)) {
		instance_destroy();
	}
}

/// @desc Checks whether the scene function is running inside of the cutscene manager.
function validate_scene() {
	if (object_index != obj_cutscene_manager) {
		show_error("Scene was called in an object that is not obj_cutscene_manager.", true);
	}
}

#endregion

/// @desc Waits for a certain amount of frames, then ends the scene.
/// @arg {Real} frames The amount of frames to wait for.
function scene_wait(_frames) {
	validate_scene();
	
	timer++;
	
	if (timer >= _frames) {
		timer = 0;
		end_scene();	
	}	
}

/// @desc Sets dialogue and creates a textbox, usually called before scene_dialogue() scenes.
/// @arg {Array, String} dialogue The text array to set the dialogue to. Can be passed in as a single string for one-liners.
function scene_prep_dialogue(_dialogue) {	
	validate_scene();
	
	dialogue_prep(_dialogue);
	dialogue_run();
	
	end_scene();	
}

/// @desc Waits for the dialogue to end before moving on to the next scene.
function scene_dialogue() {
	validate_scene();
	
	if (!instance_exists(obj_textbox)) {
		end_scene();
	}
}