/// @description Insert description here

if (hasBalloon){
	draw_sprite(sprite_index,1,x,y);
	draw_line_width_color(x+(sprite_width/2),y+8,balloonCurrentX-1,balloonCurrentY+6,1,c_dkgray,c_dkgray);
	draw_sprite(sBalloon,0,balloonCurrentX,balloonCurrentY);
}
else{
	draw_sprite(sprite_index,0,x,y);
	with(oPlayer){
		if position_meeting(x+balloonTargetXOffset,y,other)
			draw_sprite(sHookMarker,0,other.x+(other.sprite_width/2),other.y);
	}
}
