/// @description Insert description here

draw_set_alpha(alpha);
draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,0);
draw_set_alpha(1);

if instance_exists(oBalloon_endCinematic){
	draw_set_alpha(alpha);
	draw_set_color(c_dkgray);
	draw_line_width(oBalloon_endCinematic.x-1,oBalloon_endCinematic.bbox_bottom,oBalloon_endCinematic.x-1,oBalloon_endCinematic.bbox_bottom+20,1);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_sprite_ext(sBalloon,oBalloon_endCinematic.image_index,oBalloon_endCinematic.x,oBalloon_endCinematic.y,1,1,0,c_white,alpha);
	}