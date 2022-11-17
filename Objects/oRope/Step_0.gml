/// @description Insert description here

if (!instance_exists(oPlayer)){
	instance_destroy();
}
else if (distance_to_object(oPlayer) > 32){
	phy_position_x = oPlayer.x
	phy_position_y = oPlayer.y
}
