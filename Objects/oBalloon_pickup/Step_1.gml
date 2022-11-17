/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom+16,oPlayer,0,1){
	with (oBalloonRope){
		instance_destroy();
	}
	oPlayer.balloonCurrentX = x;
	oPlayer.balloonCurrentY = y;
	oPlayer.hasBalloon = 1;
	oPlayer.timeline_index = tmDialogue_balloonPickup;
	oPlayer.timeline_position = 0;
	oPlayer.timeline_running = true;
	instance_destroy();
}

