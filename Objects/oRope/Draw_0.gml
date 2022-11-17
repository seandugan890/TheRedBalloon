/// @description Insert description here
if instance_exists(oPlayer){
	if (parent != -1) && (oPlayer.hasBalloon) && (!oPlayer.balloonWaterFloat) && (oPlayer.balloonCurrentY > oPlayer.y-oPlayer.balloonMaxHeight+oPlayer.balloonH_diff+5){
		draw_line_width_color(x,y,parent.x,parent.y,1,c_dkgray,c_dkgray);
	}
}
else instance_destroy();
//physics_draw_debug();