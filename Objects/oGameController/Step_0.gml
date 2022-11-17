/// @description Insert description here

//if the player is able to pause
if (canPause){
	//if we are already paused
	if (paused){
		//selections
				if (mouse_y < (camera_get_view_y(cam)+camera_get_view_height(cam)/2)+40){
					menuOptionSelected = 2;
				}
				if (mouse_y < (camera_get_view_y(cam)+camera_get_view_height(cam)/2)+20){
					menuOptionSelected = 1;
				}
				if (mouse_y < (camera_get_view_y(cam)+camera_get_view_height(cam)/2)){
					menuOptionSelected = 0;
				}
			if mouse_check_button_released(mb_left){
				switch(menuOptionSelected){
					case 0:
						paused = 0;
						instance_activate_all();
						audio_resume_all();
						break;
					case 1:
						var wfull = window_get_fullscreen();
						if (!wfull) window_set_fullscreen(1);
						else window_set_fullscreen(0);
						break;
					case 2:
						paused = 0;
						if surface_exists(pauseSurface){
								surface_free(pauseSurface);
						}
						application_surface_draw_enable(true);
						game_restart();
						break;
				}
			}
				
		//if he hit the pause key
		if keyboard_check_pressed(keyBinding_pause){
			paused = 0;
			instance_activate_all();
			audio_resume_all();
		}
	}
	//if we are not paused
	else{
		//if he hit the pause key
		if keyboard_check_pressed(keyBinding_pause){
			paused = 1;
			menuOptionSelected = 0;
			if !surface_exists(pauseSurface){
				//create a new surface and draw the game screen to it
				pauseSurface = surface_create(view_get_wport(cam),view_get_hport(cam));
				surface_copy(pauseSurface,0,0,application_surface);	

			}
			instance_deactivate_all(true);	
			audio_pause_all();

		}
	}
}