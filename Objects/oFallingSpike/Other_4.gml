/// @description Insert description here
var i,xx,yy;
for (i=0; i<96; i+=1){
	xx = tilemap_get_cell_x_at_pixel(tilemap, x+8, bbox_bottom+i);
	yy = tilemap_get_cell_y_at_pixel(tilemap, x+8, bbox_bottom+i);

	tile = tilemap_get(tilemap,xx,yy);
	
	if (tile = 1) break;
}

detectionHeight = i;

shaking = 0;
shakeTime = 30;
falling = 0;
grv = 0.1;
vsp = 0;
shakeOffsetX = 0;
shakeCooldown = 2;
shakeTimer = 0;