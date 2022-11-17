oPlayer.visible = 0;
oFire.visible = 0;


with (oCamera){
	owner = other;
	locked = 1;
	moveSpeedX = 1;
}

canPause = 0;