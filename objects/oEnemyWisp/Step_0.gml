if (instance_exists(oPlayer)) {
	move_towards_point(oPlayer.x, oPlayer.y, moveSp);
	
	var ex = instance_nearest(x, y, oPlayer).x;
	var ey = instance_nearest(x, y, oPlayer).y;
	
	direction = point_direction(x, y, ex, ey);
} else {
	instance_destroy(self);
}