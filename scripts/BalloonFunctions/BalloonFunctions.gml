
//Check for wind gusts and set the balloons vertical speed 
function BalloonSetFloat(){
	gust_id = instance_position(x,y,oGust_parent)

	if (gust_id != noone){
	
		if (gust_id.active){
			switch(gust_id.object_index){
				case oGust_up:
				case oGust_up_triggered:
					vsp = -2;
					break;
				case oGust_down:
				case oGust_down_triggered:
				if (y >= gust_id.bbox_bottom-1){
					if !instance_position(x,y+1,oGust_parent) vsp = 0;
				else vsp = 2;
				}
				else{
					vsp = 2;
				}
					break;
				case oGust_left:
				case oGust_left_triggered:
					hsp = -2;
					break;
				case oGust_right:
				case oGust_right_triggered:
					hsp = 2;
					break;
			}
			var chnc = irandom(300);
			if (!chnc){ 
				if instance_exists(oPlayer){
					with (oPlayer.currentText) {instance_destroy()};
				}
				audio_play_sound(sndBalloonTalk,10,0);
				if instance_exists(currentText) with(currentText){instance_destroy()};
				currentText = CreateTextBubble(self,0,10,text_gust[irandom(textCount_gust)],c_red,45,fa_center);
				}
		}
		else{
			vsp =- 1;
			hsp = 0;
		}
	}
	else{
		vsp =- 1;
		hsp = 0;
	}
}

//set the balloons position, balloons string is physics-based so x/y position must be updated in this way
function BalloonSetPhysicalPosition(hsped,vsped){
	phy_position_x += hsped;
	phy_position_y += vsped;
}

//check for balloon object collisions with world objects
function BalloonCollisionWithWorldObjects(){
	//check for collision with world objects 
	if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oSpikes,0,1))
	or (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oFallingSpike,0,1)){
		//destroy the balloon, start balloon death screen, and create balloon debris
		CreateBalloonPieces(x,y,40,-4,4,-4,4);
		instance_destroy();
		with (oBalloonRope){
			instance_destroy();
		}
		with (oPlayer){
			DwarfBalloonDeath()
		}
	}
}


//