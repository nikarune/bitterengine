scene = 0;
scene_info = [];

// Cutscene variables
timer = 0;

scene_info = [
	[
	scene_prep_dialogue, 
		[
			"*test 123",
			"*{c,c_red}red {c,c_green}green {c,c_blue}blue",
			"{f,fn_papyrus}*papyrus font",
		]
	],
	
	[scene_dialogue],
	[scene_wait, 60],
	[scene_prep_dialogue, "*this cutscene is now {c,c_red}over.{c,c_white}"],
	[scene_dialogue]
	
];