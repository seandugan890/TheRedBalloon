/// @description Insert description here

if instance_exists(owner){

	//if we are locked on to our subject
	if locked{
		x = owner.x;
		y = owner.y;
	}
	//if we are still moving to our subject
	else{
		if (distance_to_point(owner.x,owner.y) > lockDistance){
			if ( x < owner.x) x += moveSpeedX;
			if ( x > owner.x) x -= moveSpeedX;
			if ( y < owner.y) y += moveSpeedY;
			if ( y > owner.y) y -= moveSpeedY;
		}
		else locked = 1;
	}

}