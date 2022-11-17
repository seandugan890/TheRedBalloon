/// @description Insert description here

if (introPlayed){
	instance_destroy();
}
else{

	timeline_index = tmCinematic_intro;
	timeline_position = 0;
	timeline_running = true;
	alpha = 1;
	alphaChange = 0;
}
