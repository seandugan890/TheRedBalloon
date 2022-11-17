/// @description Insert description here

var h,v;

if instance_exists(oPlayer){
	if (oPlayer.hasBalloon){
		h = 8;
		v = -abs(oPlayer.hsp)*0.2;
	}
	else{
		h = 0;
		v = 0.6;
	}

	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top-h,oPlayer,0,1){
		if (oPlayer.hasBalloon){
			if (oPlayer.hsp != 0){
				CreateSplash(oPlayer.x+(oPlayer.hsp),bbox_top,10,-2,2,-2,-1)
			}
		}
		else{
			CreateSplash(oPlayer.x,bbox_top,10,-2,2,-2,-1)
			if (!audio_is_playing(sndWaterSplash)) audio_play_sound(sndWaterSplash, 10, false);
		}
		var thing = round((oPlayer.x-bbox_left)/WATERDIVISION);
		springsVelocity[thing] = -v;

	}

	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,oPickaxe,0,1){
		var thing = round((oPickaxe.x-bbox_left)/WATERDIVISION);
		springsVelocity[thing] = -1;
		if (!audio_is_playing(sndWaterSplash)) audio_play_sound(sndWaterSplash, 10, false);
		CreateSplash(oPickaxe.x,bbox_top,10,-2,2,-2,-1)
	}
	
}

var fish = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,oFish,0,1);
if (fish != noone){
	CreateSplash(fish.x,bbox_top,10,-2,2,-2,-1)
	}
