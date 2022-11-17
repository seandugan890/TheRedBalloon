
with (oCamera){
	owner = oPlayer;
	locked = 1;
}

with (oPlayer){
	image_xscale = -1;
	layer = layer_get_id("Instances");
}

with (oFire){
	layer = layer_get_id("Instances");
}

with (oCampfireLog){
	layer = layer_get_id("Instances");
}

audio_stop_sound(music);
music = audio_play_sound(sndCaveMusic,20,1);
audio_sound_gain(music,0,0);
audio_sound_gain(music,1,5000);


with (oTextBubble) instance_destroy();
with (oBalloonRope) instance_destroy();
with (oBalloon_introCinematic) instance_destroy();
canPause = 1;