/// @description Insert description here

if collision_line(x+8,y,x+8,y-detectionHeight,oPlayer,0,1){
	if (!shaking) && (!falling) && (y = ystart){
		shaking = 1;
		alarm[0] = shakeTime;
	}
}

if (shaking){
	if (shakeTimer <= 0){
		if (shakeOffsetX == 1) shakeOffsetX = -1;
		else shakeOffsetX = 1;
		x = xstart+shakeOffsetX;
		CreateDust(x+8,y,1,-1,1,-0.5,0);
		shakeTimer = shakeCooldown;
	}
	else shakeTimer --;
}

if (falling){
	x = xstart;
	if (y > ystart-16){
		y -= thrustSpeed;
	}
	else{
		alarm[1] = lowerDelay;
		falling = 0;
	}
	//else instance_destroy();
}

if (lowering){
	y += lowerSpeed;
	if (y >= ystart){
		y = ystart;
		falling = 0;
		shaking = 0;
		lowering = 0;
	}
}

if collision_rectangle(x+5,bbox_top,x+9,bbox_bottom,oPlayer,0,1) && (y != ystart) && (!lowering){
	with (oPlayer){
		DwarfDeath();
	}
}