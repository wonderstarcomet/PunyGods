// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Weapon(attrs) constructor {
	sp = attrs.sp;
	damage = attrs.damage;
	accuracy = attrs.accuracy;
	fire = attrs.fire;
	secondsPerShot = attrs.secondsPerShot;
}

function weapon_make_bullet(owner, weapon, bulSp = 5, damage = 5, accuracy = 100, bulDir = owner.direction, originX = owner.x, originY = owner.y) {
	
	// Create the bullet
	var bullet = instance_create_layer(originX, originY, owner.layer, oBullet, 
	{speed : bulSp, 
	damage : weapon.damage,
	owner : owner,
	direction : bulDir});
	
	// Calculate its deviation
	bullet.direction += weapon_bullet_deviation(accuracy);
	
}

function weapon_bullet_deviation(accuracy) {
	var deviation = (100 - accuracy) / 100; // Deviation factor
	var angle_offset = random_range(-deviation * 90, deviation * 90);
	
	return angle_offset;
}