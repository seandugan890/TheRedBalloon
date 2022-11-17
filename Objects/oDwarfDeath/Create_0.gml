/// @desc 

event_inherited();

screenFade = 0;
screenFadeStart = 0;
screenFadeSpeed = 0.05;
alarmSet = 0;
screenFadeDuration = 180;

CreateDialogue_DwarfBalloonDeath();

audio_play_sound(sndPlayerDie, 10, false);
audio_stop_sound(sndHammerReturn);