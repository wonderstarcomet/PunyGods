if (image_alpha < 1) {
	image_alpha += 0.01;
}

if (image_alpha == 1) and (alarm[0] == -1) {
	alarm[0] = 200;
}

if place_meeting(x, y, oEnemyMoloch) or place_meeting(x, y, oSpawnerMoloch) {
			instance_destroy(self);
		}