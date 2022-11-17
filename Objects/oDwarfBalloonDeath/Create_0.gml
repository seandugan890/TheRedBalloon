/// @desc 

event_inherited();

screenFade = 0;
screenFadeStart = 0;
screenFadeSpeed = 0.05;
alarmSet = 0;
screenFadeDuration = 180;
crying = 0;

CreateDialogue_DwarfDeath();

audio_play_sound(sndPlayerDie, 10, false);
audio_stop_sound(sndHammerReturn);