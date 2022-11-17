/// @description Insert description here
if instance_exists(oBalloon){
	if (distance_to_object(oBalloon) > 50){
		phy_position_x = oBalloon.x;
		phy_position_y = oBalloon.y;
	}
}