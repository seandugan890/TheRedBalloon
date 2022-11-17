/// @description Insert description here

//if there is a collision with the pickaxe
if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPickaxe,0,1) && (oPickaxe.flying){
	//set the switch to active
	if (pressed) pressed = 0;
	else pressed = 1;
	SoundPlayPitchRandom(sndButtonPress,10,0,0.8,1.2);
	with (oPickaxe){
		flying = 0;
		spd = 0;
		adjusting = 1;
		CreateDust(x,y,5,-1,1,-0.5,0.5);
	}
}


image_index = pressed;