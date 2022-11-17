/// @desc open/close gate

//if the gate is closed
if (closed){
	tile1 = 1;
	if (image_index == 4){
		
		audio_stop_sound(sndGate);
		if (distance_to_object(oPlayer) < 128){
			SoundPlayPitchRandom(sndGate,10,0,0.5,1.5);
		}
	}
	if (image_index != 0)
		image_speed = -1;
}
//if the gate is open
else{
	if (image_index == 0){
		audio_stop_sound(sndGate);
		if (distance_to_object(oPlayer) < 128){
			SoundPlayPitchRandom(sndGate,10,0,0.5,1.5);
		}
	}
	if (image_index != 4)
	image_speed = 1;
	tile1 = 0;
}

tilemap_set(tilemap, tile1, xx, yy);