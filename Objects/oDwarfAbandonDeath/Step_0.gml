/// @description Insert description here

if (screenFadeStart){
	//if the screen has faded to black
	if (screenFade = 1){
		//if we havent started moving down yet
		if (!alarmSet){
			alarm[0] = screenFadeDuration;
			CreateTextBubble(self,0,16,text[irandom(textCount)],c_white,180,fa_center);
			alarmSet = 1;
		}
	}

	//if the screen has not fades to black
	else{
		screenFade += screenFadeSpeed;
		if (screenFade > 1) screenFade = 1;
	}
}

if (crying){
	var ox = choose(-2,2,0,0,0)
	if (ox != 0) CreateTears(x+ox,y-1,1,ox,ox,-2,0);
}
