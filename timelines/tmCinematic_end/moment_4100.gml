oPlayer.hasBalloon = 0;
instance_create_layer(oPlayer.x-4,oPlayer.y-20,"Instances",oBalloon_endCinematic);
oCamera.owner = oBalloon_endCinematic;
audio_sound_gain(music, 1, 8000);
