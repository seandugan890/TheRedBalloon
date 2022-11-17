/// @description Insert description here

if instance_exists(oPlayer){
		if (oPlayer.hasBalloon){
		if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
			pressed = 1;
		}
	}
}