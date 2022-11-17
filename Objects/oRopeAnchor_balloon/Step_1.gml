/// @description Insert description here

if (!instance_exists(oPlayer)){
	instance_destroy();
}
else{

	phy_position_x = oPlayer.balloonCurrentX-2;
	phy_position_y = oPlayer.balloonCurrentY+oPlayer.balloonHeightHalf-3
}
