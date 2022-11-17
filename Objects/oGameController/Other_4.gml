/// @description Insert description here

//id of the tilemap used to calculate collisions
tilemap = layer_tilemap_get_id("Collision");
tilemap_pipes = layer_tilemap_get_id("CollisionPipes");

if instance_exists(oPlayer){
	if (room_reset){
		checkpointX = oPlayer.x;
		checkpointY = oPlayer.y;
		room_reset = 0;
	}
	else{
		oCamera.x = oPlayer.x;
		oCamera.y = oPlayer.y;
		oCamera.owner = oPlayer;
		oCamera.locked = 1;
	}
}

if instance_exists(oPlayer){
	oPlayer.x = checkpointX;
	oPlayer.y = checkpointY;
}

if (room != rLevel1) && (room != rStaging){
	if !audio_is_playing(music){
		music = audio_play_sound(sndCaveMusic,9,1);
	}
}

if (room == rLevel1){
	oPlayer.hasBalloon = 0;
	if (checkpointX > 2650){
		oPlayer.hasPickaxe = 1;
		with (oPickaxe_pickup){
				instance_destroy();
		}
	}
	else{
		oPlayer.hasPickaxe = 0;
	}
}
if (room == rLevel2){
	if (checkpointX > 2700){
		oPlayer.hasBalloon = 1;
	}
	else{
		oPlayer.hasBalloon = 0;
	}
}

layer = layer_get_id("TextBubble");