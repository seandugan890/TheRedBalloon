/// @description Insert description here


if (paused){
	//if we do not yet have a pause surface
	if surface_exists(pauseSurface){
		draw_set_alpha(1);
		draw_set_color(c_white);
		application_surface_draw_enable(false);
		draw_surface(pauseSurface,0,0);
	}
	var centerw = (view_get_wport(cam)/2);
	var centerh = (view_get_hport(cam)/2);
	draw_rectangle_color(centerw-(centerw/2),centerh-(centerh/2),centerw+(centerw/2),centerh+(centerh/2),c_white,c_white,c_white,c_white,0);
	draw_set_color(c_black)
	draw_set_font(fTextBubble);
	draw_set_halign(fa_center);
	draw_text(centerw,centerh-(centerh/2)+20,"** Paused **");
	draw_text(centerw,centerh+(centerh/2)-70,"Controls:");
	draw_text(centerw,centerh+(centerh/2)-50,"<Move>[A]/[D],   <Jump>[W],   <Throw/Return Hammer>[Left Mouse Button]");
	draw_text(centerw,centerh+(centerh/2)-30,"<Drop Balloon>[E],   <Pause Game>[Esc]");
	 
	if (menuOptionSelected == 0){
		draw_text(centerw,centerh-80,"> Resume");
	}
	else{
		draw_text(centerw,centerh-80,"Resume");
	}
	
	if (menuOptionSelected == 1){
		draw_text(centerw,centerh,"> Toggle Fullscreen");
	}
	else{
		draw_text(centerw,centerh,"Toggle Fullscreen");
	}
	
	if (menuOptionSelected == 2){
		draw_text(centerw,centerh+80,"> Back to Main Menu");
	}
	else{
		draw_text(centerw,centerh+80,"Back to Main Menu");
	}

}
else{
	//clear the puase surface
	if surface_exists(pauseSurface){
		surface_free(pauseSurface);
	}
	application_surface_draw_enable(true);
}
