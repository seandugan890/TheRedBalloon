/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
	with (oPlayer){
		hasPickaxe = 1;
		timeline_index = tmDialogue_pickaxePickup;
		timeline_position = 0;
		timeline_running = true;
	}
	
	instance_destroy();
}