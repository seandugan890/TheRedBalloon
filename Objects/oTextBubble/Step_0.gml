/// @description Insert description here
if instance_exists(owner){

	x = owner.x+offsetX;
	y = owner.y+offsetY;

	xx = x-camera_get_view_x(cam);
	yy = y-camera_get_view_y(cam);

	//if we have faded in already
	if (fadeIn){
		if (readTime > 0) readTime --;
		else{
			if (fade < 0) instance_destroy();
			else fade -= 0.1;
		}
	}
	else{
		if (fade >= 1){
			fade = 1;
			fadeIn = 1;
		}
		else fade += 0.025;
	}
}
else{
	instance_destroy();
}