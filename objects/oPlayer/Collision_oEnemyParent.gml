if (other.image_alpha == 1) {
	instance_create_layer(x, y, layer, oPlayerDeath);
	var par = part_system_create(parBulletImpact);
	part_system_position(par, self.x, self.y);
	audio_play_sound(die, 100, 0);
	instance_deactivate_object(self);
}