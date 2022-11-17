/// @description Insert description here

if collision_line(bbox_left,bbox_top,bbox_right,bbox_top,oWater,0,1){
	y -= 0.2;
	x += choose(-1,1,0,0,0,0,0)
}
else instance_destroy();