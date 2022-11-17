/// @description Insert description here

#region // -- MODIFIABLE VARIABLES

//the amount of overlap on black bars
overlap = 0.5;

#endregion

#region // -- GET DISPLAY SIZE

//get display size
w = display_get_gui_width();
h = display_get_gui_height();
//get half the display width
w_half = (w/2);
//get half the display height
h_half = (h/2);

#endregion

#region // -- DECLARE MODES

//declare mode states
enum TRANS_MODE
	{
		OFF,
		NEXT,
		GOTO,
		RESTART,
		INTRO
	}
	
#endregion

#region // -- NON-MODIFIABLE VARIABLES

//set the initial mode
mode = TRANS_MODE.INTRO;
//how full the screen is with black
percent = 1;
//the target room to goto
target = room;

#endregion