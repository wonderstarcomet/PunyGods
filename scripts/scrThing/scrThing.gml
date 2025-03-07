// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Thing(attrs) constructor {
	
	if (!is_struct(attrs)) {
		show_error("Invalid attributes passed to Thing: " + string(attrs), true);
	}

	// Thing Attributes
	name = variable_struct_exists(attrs, "name") ? attrs.name : "John Noname";
	maxHp = variable_struct_exists(attrs, "maxHp") ? attrs.maxHp : -100;
	hp = maxHp;
	grav = variable_struct_exists(attrs, "grav") ? attrs.grav : 0.6;
	
	vsp = 0;
	hsp = 0;
}

function thing_damage(thing, damage) {
	if (thing.maxHp != -100) {
		thing.hp -= damage;
		
		if (thing.hp <= 0) {
		thing_kill(thing);
	}
	}
}

function thing_kill(thing) {
	
	var name = struct_get(thing, "name");
	
	switch (name) {
	    case "Wisp":
	        score_add(15);
	        break;
		case "Moloch":
	        score_add(100);
	        break;
	}
	
	instance_destroy(thing);
}