/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPickaxe,0,1)
or collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1)
or collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oBalloon,0,1){
	if (pressed == 0) SoundPlayPitchRandom(sndButtonPress,10,0,0.5,1.5);
	pressed = 1;
}
else{
	if (pressed == 1) SoundPlayPitchRandom(sndButtonPress,10,0,0.5,1.5);
	pressed = 0;
}

image_index = pressed;