/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
	if (!pickaxeIntroPlayed){
		if (!StartedCinematic){
			timeline_index = tmCinematic_pickaxe;
			timeline_position = 0;
			timeline_running = true;
			pickaxeIntroPlayed = 1;
			StartedCinematic = 1;
		}
	}
}