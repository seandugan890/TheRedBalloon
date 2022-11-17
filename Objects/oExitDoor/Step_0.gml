/// @description Insert description here

open = 0;
//if the player is not dead
if instance_exists(oPlayer){
	//if the player is close enough
	if (distance_to_object(oPlayer) < openDistance){
		//if the player has both items
		switch(room){	
		case rLevel1:	
		if (oPlayer.hasPickaxe) open = 1;
		break;
		default:	
		if (oPlayer.hasBalloon) && (oPlayer.hasPickaxe) open = 1;
		break;
		}
	}
	eyeAngle = point_direction(x+halfWidth,y+halfHeight,oPlayer.x,oPlayer.y);
}

if (open) && (oCamera.owner == oPlayer){
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){
		audio_play_sound(sndExitDoorEnter,10,0);
		oCamera.owner = oExitDoor;
		room_reset = 1;
		SlideTransition(TRANS_MODE.GOTO,roomNext);
	}
}

if (!cinematicPlaying){
	//if the player is within talking distance
	if (distance_to_object(oPlayer) < talkDistance){
		if (talkTimer < 0){
			//if the player is missing both pickaxe and balloon
			if (oPlayer.hasPickaxe == 0) && (oPlayer.hasBalloon == 0) && (room != rLevel1){
				if instance_exists(currentText) with(currentText){instance_destroy()};
				currentText = CreateTextBubble(self,16,-8,text_missingBoth[irandom(textCount_missingBoth)],c_black,120,fa_center);
				audio_play_sound(sndExitDoorTalk,10,0);
			}
			//if the player is missing just the pickaxe
			else if (oPlayer.hasPickaxe == 0){
				if instance_exists(currentText) with(currentText){instance_destroy()};
				currentText = CreateTextBubble(self,16,-8,text_missingPickaxe[irandom(textCount_missingPickaxe)],c_black,120,fa_center);
				audio_play_sound(sndExitDoorTalk,10,0);
			}
			//if the player is missing just the balloon
			else if (oPlayer.hasBalloon == 0) && (room != rLevel1) && (balloonIntroPlayed){
				if instance_exists(currentText) with(currentText){instance_destroy()};
				currentText = CreateTextBubble(self,16,-8,text_missingBalloon[irandom(textCount_missingBalloon)],c_black,120,fa_center);
				audio_play_sound(sndExitDoorTalk,10,0);
			}
			//if the player has both items
			else{
				if (room == rLevel2){
					if (balloonIntroPlayed){
						if instance_exists(currentText) with(currentText){instance_destroy()};
						currentText = CreateTextBubble(self,16,-8,text_missingNone[irandom(textCount_missingNone)],c_black,120,fa_center);
						audio_play_sound(sndExitDoorTalk,10,0);
					}
				}
				else{
					if instance_exists(currentText) with(currentText){instance_destroy()};
					currentText = CreateTextBubble(self,16,-8,text_missingNone[irandom(textCount_missingNone)],c_black,120,fa_center);
					audio_play_sound(sndExitDoorTalk,10,0);
				}
			}
		talkTimer = talkCooldown;
		}
		else talkTimer --;
	}
}