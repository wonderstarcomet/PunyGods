state();
doMovement();

vsp = vsp + grav;

onGround = place_meeting(x, y + 5, oGround);

// No idea what I did here, but seems to fix an issue where the player moves to the right
// for one pixel when hitting the floor
if (vsp > 0 && place_meeting(x, y + vsp + 1, oGround) and (!keyboard_check(ord("Z")))) {
    vsp = 0;
    while (!place_meeting(x, y + 1, oGround)) {
        y += 1; 
    }
}

move_wrap(true, false, 50);

if (place_meeting(x, y - 5, oGround)) {
	vsp = 1;
}

move_and_collide(hsp, 0, oGround);
move_and_collide(0, vsp, oGround);

if (onGround) {
	vsp = 0;
	jumps = 1;
	
	
}

if (dir != 0) {
	hsp = lerp(hsp, maxHsp * dir, accel);
	} else {
		hsp = lerp(hsp, 0, decel);
}

switch (onGround) {
    case true:
        accel = 0.25;
		decel = 0.1;
        break;
    case false:
        accel = 0.11;
		decel = 0.1;
        break;
}


if (keyboard_check(ord("X"))) and (canFire) {
	canFire = false;
	weapon.fire(self);
	audio_play_sound(fireWep, 100, 0);
	ts = time_source_create(time_source_game, weapon.secondsPerShot, time_source_units_seconds, weapon_toggle_fire);
	time_source_start(ts);
}

if (dir == 1) {
	direction = 0;
	image_xscale = -1;
} else if (dir == -1) { 
	direction = 180;
	image_xscale = 1;
}