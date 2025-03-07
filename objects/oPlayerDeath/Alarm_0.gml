oLives.reset_lives_counter();

if (oLives.numLives > 1) {
	with (oPlayerStart) {
		var player = new Player({
				name : "Player",
				maxHp : 100
			});

	instance_create_layer(x, y, layer, oPlayer, player);

	}
	
	oLives.numLives -= 1;
	oLives.lives_draw();
	
	instance_destroy(self);
	
} else {
	room_goto(rMenu);
}