if (other != owner) {
	thing_damage(other, damage);
	if (!audio_is_playing(die)) {
		audio_play_sound(die, 100, 0);
	}
}

instance_destroy(self);