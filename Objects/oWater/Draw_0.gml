/// @description Insert description here


//draw_self();

var _left = bbox_left;
var _top = bbox_top;
var _appScale = surface_get_height(application_surface) / 270;
var _camX = camera_get_view_x(cam);
var _camY = camera_get_view_y(cam);

waterSurface = surface_create(sprite_width,sprite_height+transparencyBufferHeight);
surface_set_target(waterSurface);

	draw_clear_alpha(c_white,0);
	draw_surface_part_ext(application_surface,(_left-_camX)*_appScale,(_top-_camY)*_appScale,sprite_width*_appScale,(sprite_height+transparencyBufferHeight)*_appScale,0,transparencyBufferHeight,(1/_appScale),(1/_appScale),c_white,1);
	gpu_set_colorwriteenable(true,true,true,false);
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,transparencyBufferHeight,sprite_width,sprite_height+transparencyBufferHeight,false);
	draw_set_color(c_black);
	//draw_line(0,transparencyBufferHeight+1,sprite_width,transparencyBufferHeight+1);
	
	draw_set_color(c_black); //white
	draw_set_alpha(1);
	draw_line(0,transparencyBufferHeight,sprite_width,transparencyBufferHeight);
	draw_set_alpha(1);
	gpu_set_colorwriteenable(true,true,true,true);

surface_reset_target()

pW = texture_get_texel_width(surface_get_texture(waterSurface));
pH = texture_get_texel_height(surface_get_texture(waterSurface));

resizeSurface = surface_create(sprite_width,sprite_height+transparencyBufferHeight);
surface_set_target(resizeSurface);
	draw_clear_alpha(c_white,0);
	shader_set(shWave);	
		shader_set_uniform_f(global.u_pixelH_Wave,pH);
		shader_set_uniform_f(global.u_pixelW_Wave,pW);
		shader_set_uniform_f(global.u_SpringCount,springCount);
		shader_set_uniform_f_array(global.u_springs,springs);
		shader_set_uniform_f(global.u_time,get_timer()*0.0000025);
		draw_surface(waterSurface,0,0);
	shader_reset();
surface_reset_target();

draw_surface(resizeSurface,_left,_top-transparencyBufferHeight);

surface_free(resizeSurface);
surface_free(waterSurface);

//draw_rectangle_color(bbox_left,bbox_bottom,bbox_right,bbox_top,c_red,c_red,c_red,c_red,1)