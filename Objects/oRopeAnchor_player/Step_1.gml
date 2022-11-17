/// @description Insert description here

if (!instance_exists(oPlayer)){
	instance_destroy();
}
else{
	phy_position_x = oPlayer.x+oPlayer.balloonTargetXOffset+oPlayer.hsp
	phy_position_y = oPlayer.y-6+oPlayer.vsp
}
