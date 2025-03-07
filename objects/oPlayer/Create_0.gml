dir = 0;
lastDir = -1;
accel = 0;
decel = 0;
maxHsp = 6;
jumpHeight = 16;
jumps = 2;
fsm = "";
canFire = true;

onGround = place_meeting(x, y + 5, oGround);

invulnTime = 2;
invulne = true;

direction = 180;

doMovement = function() {
	if (keyboard_check(vk_left)) {
		dir = -1;
		lastDir = dir;
	}
	
	else if (keyboard_check(vk_right)) {
		dir = 1;
		lastDir = dir;
	}
	
	else {
		
		if (dir == 1) {
			lastDir = 1;
		}
		else if (dir == -1) {
			lastDir = -1;
		}
		
		dir = 0;
	}
}

stateIdle = function() {
	if (vsp != 0) or (abs(hsp) > 2) {
		state = stateMove;
	}
	
	if (keyboard_check(ord("Z")) and (onGround)) {
		state = stateJump;
	}
	
	if (vsp > 0) {
		state = stateFall;
	}
	
	fsm = "idle"
	
	sprite_index = sPlayerIdle;
	
}

stateMove = function() {
	if (dir == 0 and abs(hsp) < 2) {
		state = stateIdle;
	}
	
	if (keyboard_check(ord("Z")) and (onGround)) {
		state = stateJump;
	}
	
	if (vsp > 0) {
		state = stateFall;
	}
	
	fsm = "move"
	
	sprite_index = sPlayerWalk;
}

stateJump = function() {
	if (onGround) {
		vsp = -jumpHeight;
	}
	
	if (jumps > 0) and keyboard_check_pressed(ord("Z")) {
		vsp += -jumpHeight;
		jumps -= 1;
	}
	
	if (vsp > 0) {
		state = stateFall;
	}
	
	fsm = "jump"
	
	sprite_index = sPlayerJump;
}

stateFall = function() {
	if (onGround) and (dir != 0) {
			state = stateMove;
		}
		
		if (jumps > 0) and keyboard_check_pressed(ord("Z")) {
			vsp = -jumpHeight;
			jumps -= 1;
			state = stateJump;
		}
		
		if (onGround) and (dir == 0) {
			state = stateIdle;
		}
		
	if (onGround) and (keyboard_check(ord("Z"))) {
			state = stateJump;
		}
		
	sprite_index = sPlayerFall;
	
}

state = stateIdle;

// Weapons
PlayerPunch = new Weapon({
	sp : 15,
    damage: 10,
	accuracy : 100,
    fire: weapon_fire_punch,
	secondsPerShot : 0.4
});

PlayerMultishot = new Weapon({
	sp : 25,
    damage: 5,
	accuracy : 100,
    fire: weapon_fire_multishot,
	secondsPerShot : 0.4
});

PlayerHarmonic = new Weapon({
	sp : 50,
    damage: 2,
	accuracy : 95,
    fire: weapon_fire_harmonic,
	secondsPerShot : 0.1
});

PlayerBigBang = new Weapon({
	sp : 5,
    damage: 50,
	accuracy : 95,
    fire: weapon_fire_bigbang,
	secondsPerShot : 0.8
});

weapon = PlayerMultishot;

function weapon_fire_punch(owner) {
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy);
}

function weapon_fire_harmonic(owner) {
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy);
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy);
}

function weapon_fire_bigbang(owner) {
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy);
}

function weapon_fire_multishot(owner) {
	// evil function
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy, (owner.lastDir == -1) ? 180 - 10 : 10, owner.x, owner.y + 20);
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy, (owner.lastDir == -1) ? 180 - -10 : -10, owner.x, owner.y + 20);
	weapon_make_bullet(owner, owner.weapon, owner.weapon.sp, owner.weapon.damage, owner.weapon.accuracy, owner.direction, owner.x, owner.y + 20);
}

function weapon_toggle_fire() {
	canFire = true;
	time_source_destroy(ts);
}

