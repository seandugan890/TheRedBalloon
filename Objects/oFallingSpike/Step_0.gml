/// @description Insert description here

if collision_line(x+8,bbox_bottom,x+8,bbox_bottom+detectionHeight,oPlayer,0,1){
	if (!shaking){
		shaking = 1;
		alarm[0] = shakeTime;
	}
}

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPickaxe,0,1){
	if (!shaking){
		shaking = 1;
		alarm[0] = shakeTime;
	}
}

if (shaking){
	if (shakeTimer <= 0){
		if (shakeOffsetX == 1) shakeOffsetX = -1;
		else shakeOffsetX = 1;
		x = xstart+shakeOffsetX;
		CreateDust(x+8,y,1,-1,1,0,0.5);
		shakeTimer = shakeCooldown;
	}
	else shakeTimer --;
}

if (falling){
	x = xstart;
	if (y < ystart+detectionHeight){
		vsp = vsp+grv;
		y+=vsp;
	}
	else instance_destroy();
}