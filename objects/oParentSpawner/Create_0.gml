// fucky hack for fucky inheritance
maxHp = -100;

enemies = ds_map_create();

ds_map_add(enemies, oEnemyWisp, {
    object: oEnemyWisp, 
    data: new Enemy({
        maxHp: 20,
        movementType: noone,
        moveSp: 2,
		name : "Wisp"
    })
});

ds_map_add(enemies, oEnemyMoloch, {
    object: oEnemyMoloch, 
    data: new Enemy({
        maxHp: 50,
        movementType: noone,
        moveSp: 0,
		name : "Moloch"
    })
});

function spawner_make_enemy(enemy) {
	var e = ds_map_find_value(enemies, enemy);
	show_debug_message(e);
	
	var en = instance_create_layer(x, y, layer, e.object, e.data);
	enemy.creator = id;
	
}