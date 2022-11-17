/// @description Insert description here

if instance_exists(oPlayer){
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
		with instance_create_layer(oPlayer.x+(oPlayer.image_xscale*6)+oPlayer.hsp,oPlayer.y+oPlayer.vsp,"Bubbles",oBubble)
			image_xscale = oPlayer.image_xscale;
	}
}

var fish = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oFish,0,1)
if (fish != noone){
	instance_create_layer(fish.x,fish.y,"Bubbles",oBubble)
	}

alarm[0] = 120;