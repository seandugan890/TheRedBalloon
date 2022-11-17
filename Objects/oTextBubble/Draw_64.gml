/// @description Insert description here
draw_set_font(fTextBubble);
draw_set_halign(orientation);

xx = (x-(camera_get_view_x(cam)))*4;
yy = (y-(camera_get_view_y(cam)))*4;

textWidth = string_width(text);
textHeight = string_height(text);
backFade = fade;
if (color == c_black) backColor = c_white;
else backColor = c_black;

if (backFade > 0.6) backFade = 0.6;

if (orientation == fa_center){
	draw_set_alpha(backFade);
	draw_rectangle_color(xx-(textWidth/2)-2,yy-1,xx+(textWidth/2)+2,yy+textHeight-1,backColor,backColor,backColor,backColor,0);
	draw_set_alpha(1);
}

if (orientation == fa_left){
	draw_set_alpha(backFade);
	draw_rectangle_color(xx-2,yy-1,xx+textWidth+2,yy+textHeight-1,backColor,backColor,backColor,backColor,0);
	draw_set_alpha(1);
}

if (orientation == fa_right){
	draw_set_alpha(backFade);
	draw_rectangle_color(xx-textWidth-2,yy-1,xx+2,yy+textHeight-1,backColor,backColor,backColor,backColor,0);
	draw_set_alpha(1);
}

draw_text_color(xx,yy,text,color,color,color,color,fade);

draw_set_halign(fa_left);
