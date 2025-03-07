if (instance_exists(oPlayer)) {
	move_towards_point(oPlayer.x, oPlayer.y, 7);
} else {
	instance_destroy(self);
}
	