if (instance_number(oEnemyMoloch) <= 1) and (global.score >= 40) {
	var enemy = instance_create_layer(x, y, layer, oSpawnerMoloch);
	
	with (enemy) {
		if place_meeting(x, y, oEnemyMoloch) or place_meeting(x, y, oSpawnerMoloch) {
			instance_destroy(self);
		}
	}
	
}

alarm[0] = random_range(500, 600);