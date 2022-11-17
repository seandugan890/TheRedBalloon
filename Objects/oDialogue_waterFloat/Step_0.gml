/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){

		if (!StartedCinematic){
			CreateTextBubble(oPlayer,0,-20,"(You float on water when holding the Balloon)",c_white,200,fa_center);
			StartedCinematic = 1;
		}
}
