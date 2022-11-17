//this stores functions used across several objects

///CameraCheckFocus(objectToCheck)
function CameraCheckFocus(obj){
	i = 0;
	if (oCamera.owner = obj) && (oCamera.locked){
		i = 1;
	}
	return i;
}

//sets the way a characters sprite is facing based on our x axis movement
function SetImageDirection(xcur,xprev){
	//flip the character image based on horizontal direction (-1 left, 1 right)
	//if the character has moved right flip the image to the right
	if (x > xprevious){
		image_xscale = 1;
	}
	//if the character has moved left flip the imager to the left
	else if (x < xprevious) {
		image_xscale = -1;
	}
}

function SoundPlayPitchRandom(sound,priority,loop,pitchMin,pitchMax){
	var snd = audio_play_sound(sound,priority,loop);
	audio_sound_pitch(snd,random_range(pitchMin,pitchMax));
}

//setup the variables that are used across multiple characters
function CharacterVariableSetup(){
	
	//Gravity applied to the character per step in pixels
	grv = 0.1;
	//horizontal speed of the character (<0 left, 0 none, >0 right)
	hsp = 0;
	//vertical speed of the character (<0 up, 0 none, >0 down)
	vsp = 0;
	//if the character has just landed
	landed = 0;
	//The walking speed of the character in pixels (multiplied by hsp to get total pixel movement)
	walksp = 1;
	//terminal velocity of the character (pixels per step)
	terminalVelocity = 2;
	//speed of the character's animation (1 default)
	animation_speed = 1;
}

//end the animation at set frame to the last
function EndAnimation(){
	image_speed = 0;
	image_index = image_number-1;
}

//