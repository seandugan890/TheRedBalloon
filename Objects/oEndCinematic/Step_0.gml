/// @description Insert description here

if instance_exists(oPlayer){
	if (oPlayer.hasBalloon) && (oPlayer.hasPickaxe){
		if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
				if (!StartedCinematic){
					timeline_index = tmCinematic_end;
					timeline_position = 0;
					timeline_running = true;
					StartedCinematic = 1;
				}
		}
	}
}


if (alpha < 1){
	if (alphaChange){
		alpha += 0.005;
	}
}
