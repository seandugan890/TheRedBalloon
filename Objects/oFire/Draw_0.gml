/// @description Insert description here

if (flicker){
	draw_set_alpha(0.1);
}
else draw_set_alpha(0.2);
draw_ellipse_color(bbox_left-expand,bbox_top-(expand)-8,bbox_right+expand,bbox_bottom,c_white,c_white,0);
draw_ellipse_color(bbox_left,bbox_top-8,bbox_right,bbox_bottom,c_white,c_white,0);
draw_set_alpha(1);