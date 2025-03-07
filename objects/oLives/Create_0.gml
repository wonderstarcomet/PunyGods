numLives = 3;

function lives_draw() {
	for (var i = 0; i < numLives; i++) {
		instance_create_layer((x + 144 * i), y, layer, oLife);
	
	} 
}

function reset_lives_counter() {
	for (var i = 0; i < numLives; i++) {
		instance_destroy(oLife);
	
	} 
}

lives_draw();