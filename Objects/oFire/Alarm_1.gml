/// @description Insert description here

if (flicker) flicker = 0;
else flicker = 1;

expand = irandom_range(4,6);

alarm[1] = irandom_range(flickerTimeMin,flickerTime);

if (distance_to_object(oPlayer) < 64){
	var snd = audio_play_sound(sndFire,1,0);
    audio_sound_gain(snd, 0, 0); 
    audio_sound_gain(snd, 1, 2000);
	audio_sound_pitch(snd, irandom_range(-1,1.5));
}
