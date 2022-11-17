/// @desc open/close gate

//if the gate is closed
if (closed){
	//set tiles to collision
	tile1 = 1;
	tile2 = 1;
	tile3 = 1;
	tile4 = 1;
	//start animation if not already done
	if (image_index == 4){
		audio_stop_sound(sndBridge);
		if (distance_to_object(oPlayer) < 128){
			SoundPlayPitchRandom(sndBridge,10,0,0.5,1.5);
		}
	}
	if (image_index != 0)
		image_speed = -1;
}
//if the gate is open
else{
	//set tiles to no collision
	tile1 = 0;
	tile2 = 0;
	tile3 = 0;
	tile4 = 0;
	//start animation if not already done
	if (image_index == 0){
		audio_stop_sound(sndBridge);
		if (distance_to_object(oPlayer) < 128){
			SoundPlayPitchRandom(sndBridge,10,0,0.5,1.5);
		}
	}
	if (image_index != 4)
		image_speed = 1;
}

//change the tiles on the collsion tilemap
tilemap_set(tilemap, tile1, xx, yy);
tilemap_set(tilemap, tile2, xx2, yy2);
tilemap_set(tilemap, tile3, xx3, yy3);
tilemap_set(tilemap, tile4, xx4, yy4);