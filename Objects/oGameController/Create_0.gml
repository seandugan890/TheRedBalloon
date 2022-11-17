/// @description Initiate variables

//set a macro for referencing the size in pixels of a tile
#macro TILE_SIZE 16
#macro WATERDIVISION 8

//declare global variables we can reference from any object
globalvar controller, hascontrol, keyBinding_left1, keyBinding_left2, keyBinding_right1, keyBinding_right2,
keyBinding_up1, keyBinding_up2, keyBinding_down1, keyBinding_down2, keyBinding_activate1, keyBinding_activate2, keyBinding_pause,
controller_deadzone, controllerangle,tilemap,tilemap_pipes,cam,checkpointX,checkpointY,room_reset,c_ltred,introPlayed,
pickaxeIntroPlayed,balloonIntroPlayed,exitDoorIntroPlayed,music,canPause,paused;

//if player is using a controller (boolean)
controller = 0;

//if player has control over character 'oPlayer' (boolean)
hascontrol = 1;

//if the player can pause the game (boolean)
canPause = 1;

//if the game is currently paused (boolean)
paused = 0; 

pauseSurface = noone;

menuOptionSelected = 0;

//if the room has been reset
room_reset = 1;

//if the opening intro has played yet
introPlayed = 0;

//if the pickaxe intro has played yet
pickaxeIntroPlayed = 0;

//if the balloon intro has played yet
balloonIntroPlayed = 0;

//if the exit door intro has played yet
exitDoorIntroPlayed = 0;

//the red text color
c_ltred = make_color_rgb(245,60,60);

if instance_exists(oPlayer){
	checkpointX = oPlayer.x;
	checkpointY = oPlayer.y;
}

cam = view_camera[0];

#region // -- KEY BINDINGS

keyBinding_left1 = ord("A");
keyBinding_left2 = vk_left;
keyBinding_right1 = ord("D");
keyBinding_right2 = vk_right;
keyBinding_up1 = ord("W");
keyBinding_up2 = vk_up;
keyBinding_down1 = ord("S");
keyBinding_down2 = vk_down;
keyBinding_activate1 = ord("E");
keyBinding_activate2 = vk_enter;
keyBinding_pause = vk_escape;
//controller deadzone
controller_deadzone = 0.5;
//angle of the controller right-stick 
 controllerangle = 0;
 

#endregion

//water variables
global.u_pixelH_Wave = shader_get_uniform(shWave,"pixelH");
global.u_pixelW_Wave = shader_get_uniform(shWave,"pixelW");
global.u_SpringCount = shader_get_uniform(shWave,"springCount");
global.u_springs = shader_get_uniform(shWave,"springs");
global.u_time = shader_get_uniform(shWave,"time");

alarm[0] = 1;

music = audio_play_sound(sndCaveMusic,9,1);
audio_stop_sound(music);

