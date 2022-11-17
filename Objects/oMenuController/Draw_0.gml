/// @description Insert description here

draw_set_font(fMenu);
draw_set_halign(fa_center)

if (selection = 0){
	draw_text_color(room_width/2,(room_height/2)+20,"> Start",c_black,c_black,c_black,c_black,1);
}
else{
	draw_text_color(room_width/2,(room_height/2)+20,"Start",c_black,c_black,c_black,c_black,1);
}

if (selection = 1){
	draw_text_color(room_width/2,(room_height/2)+50,"> Toggle Fullscreen",c_black,c_black,c_black,c_black,1);
}
else{
	draw_text_color(room_width/2,(room_height/2)+50,"Toggle Fullscreen",c_black,c_black,c_black,c_black,1);
}

if (selection = 2){
	draw_text_color(room_width/2,(room_height/2)+80,"> Quit",c_black,c_black,c_black,c_black,1);
}
else{
	draw_text_color(room_width/2,(room_height/2)+80,"Quit",c_black,c_black,c_black,c_black,1);
}