/// @desc Adds a member to the party.
/// @arg {String} name The name of the new party member.
/// @arg {Struct.Party_Member} struct The new party member's struct information.
function party_add(_name, _struct) {
	array_push(global.party_names, _name);
	struct_set(global.party, _name, _struct);
}

/// @desc Returns the name of the party's leader.
function party_get_leader() {
	return (global.party_names[0]);
}

/// @desc Returns the struct information of a party member.
/// @returns {Struct.Party_Member}
/// @arg {String} member The name of the party member.
function partym_get_struct(_member) {
	return (struct_get(global.party, _member));
}

/// @desc Returns the status of a party member.
/// @returns {Real} A PARTY enum constant.
/// @arg {String} member The name of the party member.
function partym_get_status(_member) {	
	var _status = -1;
	
	if (_member == party_get_leader()) {
		_status = PARTY.LEADER;	
	}
	
	else {
		_status = PARTY.FOLLOWER;
	}
	
	return (_status);
}

/// @arg {String} member The name of the party member.
/// @returns {Asset.GMSprite}
function partym_get_sprite(_member, _sprite) {
	return (struct_get(partym_get_struct(_member), "s_" + _sprite));
}

/// @desc Returns the asset id of this party member's specific object.
/// @returns {Asset.GMObject}
/// @arg {String} member The name of the party member.
function partym_get_object(_member) {
	return (struct_get(partym_get_struct(_member), "object"));
}

/// @desc Returns the current instance id of a party member.
/// @returns {Id.Instance}
/// @arg {String} member The name of the party member.
function partym_get_instance(_member) {
	return (struct_get(partym_get_struct(_member), "instance"));
}

/// @desc Creates instances of the party members in a room.
/// @arg {Real} sep The seperation between party members.
function party_create_instances(_sep) {
	for (var i = 0; i < array_length(global.party_names); i++) {
		var _partym_name = global.party_names[i];
		var _partym_object = partym_get_object(_partym_name);
		var _partym_inst = instance_create_layer(obj_party_manager.x, obj_party_manager.y, "Instances", _partym_object);
		
		with (_partym_inst) {
			name = _partym_name;
			record = i * _sep;	
		}
		
		struct_set(partym_get_struct(_partym_name), "instance", _partym_inst);
	}
}