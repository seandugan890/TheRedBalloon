/// @description Insert description here

if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){

		if (!StartedCinematic){
			if instance_exists(oPlayer){
				if (oPlayer.hasBalloon){
					CreateTextBubble(oPlayer,0,-20,"Surfs up!",c_ltred,150,fa_left);
					audio_play_sound(sndBalloonTalk,10,0);
				}
			}
			StartedCinematic = 1;
		}
}
