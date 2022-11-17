/// @description Insert description here

if (mouse_y <= (room_height/2)+90) selection = 2;
if (mouse_y <= (room_height/2)+60) selection = 1;
if (mouse_y <= (room_height/2)+30) selection = 0;

if mouse_check_button_pressed(mb_left){
	switch (selection){
		case 0:
			audio_stop_all();
			room_goto(rStaging);
			break;
		case 1:
			var win = window_get_fullscreen();
			if (!win) window_set_fullscreen(1);
			else window_set_fullscreen(0);
			break;
		case 2:
			game_end();
			break;
	}
}