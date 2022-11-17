/// @description Insert description here

openDistance = 64;
talkDistance = 180;
currentText = noone;
talkCooldown = 320;
talkTimer = talkCooldown;
open = 0;
halfWidth = sprite_width/4;
halfHeight = sprite_height/2;
eyeAngle = 0;

cinematicPlaying = 0;

level[0] = RoomTEST;
level[1] = rLevel1;
level[2] = rLevel2;
level[3] = rLevel3;
level[4] = rLevel4;
level[5] = rLevel5;
level[6] = rLevel6;
level[7] = rEnd;
levelCount = 8;

for (i=0; i<levelCount; i++;){
	if room = level[i]{
		if (i = levelCount-1) roomNext = level[1];
		else roomNext = level[i+1];
	}
}


CreateDialogue_ExitDoorMissingBoth();
CreateDialogue_ExitDoorMissingPickaxe();
CreateDialogue_ExitDoorMissingBalloon();
CreateDialogue_ExitDoorMissingNone();