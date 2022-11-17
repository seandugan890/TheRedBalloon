/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
	if (!balloonIntroPlayed){
		if (!StartedCinematic){
			timeline_index = tmCinematic_balloon;
			timeline_position = 0;
			timeline_running = true;
			StartedCinematic = 1;
		}
	}
}