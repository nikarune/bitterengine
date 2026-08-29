party_size = 3;
party_record_dist = 20;
party_created = false

pos = [];

for (var i = 0; i < party_size * party_record_dist; i++) {
	pos[i] = {
		x : global.record_ref.x,
		y : global.record_ref.y,
		direction : global.record_ref.direction,
	};
}

party_add("kris", new Party_Member());
party_add("susie", new PM_Susie());

party_add("seusie", new PM_Susie());
//party_add("sueesie", new PM_Susie());