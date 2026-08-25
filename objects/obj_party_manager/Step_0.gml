// Handle record ref
if (global.record_ref == noone) {
	global.record_ref = id;
}

if (global.record_ref.xprevious != global.record_ref.x or global.record_ref.yprevious != global.record_ref.y) {
	var _rec = 0;
	
	// Update pos.
	for (var i = party_size * party_record_dist - 1; i > 0; i--) {
		pos[i] = pos[i - 1];
	}
	
	// Set the party leader's pos to the new one.
	pos[0] = {
		x : global.record_ref.x,
		y : global.record_ref.y,
		direction : global.record_ref.direction,
	}
}

x = global.record_ref.x;
y = global.record_ref.y;

sprite_index = global.record_ref.sprite_index;

if (!party_created) {
	party_create_instances(party_record_dist);
	party_created = true;
}