//stores all player specific functions

function PlayerVariableSetup(){
	//
}

//starts player jumping
function PlayerJump() {
	var gustCheck = 0;
	
	if (hasBalloon){
			var gust = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oGust_down,0,1);
			if (gust != noone){
				if (gust.active) gustCheck = 1;
			}
	}
	if (canjump > 0) && (!gustCheck){
		jumping = 1;
		//set characters upward vertical speed to jump speed 
		vsp = -jumpsp;
		//set canjump to false
		canjump = 0;
		if (sprite_body != sDwarf_balloonSwim){
			SoundPlayPitchRandom(sndPlayerJump,10,0,0.8,1.2);
		}
	}
}

//checks if the player's pickaxe is returning or not
function PlayerCheckPickaxeReturning(){
	
	//if there is a thrown axe instance
	if instance_exists(axe_id){
			//check the unique id of the axe instance
			with (axe_id){
				//if the axe is returning
				if (returning = 1){
					return 1;
				}
				else return 0
			}
	}
	return 0;
}

//get all the keyoboard/controller input for the player
function PlayerGetInput(){
	
	//set character key input based on input from bound keyboard keys
	key_left = keyboard_check(keyBinding_left1) || keyboard_check(keyBinding_left2);
	key_right = keyboard_check(keyBinding_right1) || keyboard_check(keyBinding_right2);
	key_up = keyboard_check(keyBinding_up1) || keyboard_check(keyBinding_up2) ;
	key_down = keyboard_check(keyBinding_down1) || keyboard_check(keyBinding_down2);
	mouse_left_pressed = mouse_check_button_pressed(mb_left);
	mouse_left_released = mouse_check_button_released(mb_left);
	key_activatePressed = keyboard_check_pressed(keyBinding_activate1) || keyboard_check_pressed(keyBinding_activate1);

	//turn off controller input if player presses keyboard keys
	if (key_left) || (key_right) || (key_up) || (mouse_left_pressed) controller = 0;

		//if input on the horizontal axis is greater than the deadzone of 0.2 on the controller
		if (abs(gamepad_axis_value(0,gp_axislh)) > controller_deadzone) 
			{
				//get horizontal input from controller
				key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
				key_right = max(gamepad_axis_value(0,gp_axislh),0);
				key_up = (gamepad_button_check(0, gp_face1));
				mouse_left_pressed = gamepad_button_check_pressed(0,gp_shoulderrb);
				mouse_left_released = gamepad_button_check_released(0,gp_shoulderrb);
				key_activatePressed = gamepad_button_check_pressed(0,gp_face2);
				controller = 1;
			}
			

		//if the player is using keyboard/mouse
		if (controller == 0)
			{
				//set the angle of the characters weapon arm of the character based on mouse direction
				aim_angle = point_direction(x,y,mouse_x,mouse_y);
			}
		//get controller input from right stick
		var controllerh = gamepad_axis_value(0,gp_axisrh);
		var controllerv = gamepad_axis_value(0,gp_axisrv);
		//if input from right stick is greater than deadzone of 0.2
		if (abs(controllerh) > 0.5) || (abs(controllerv) > 0.5)
			{
				//set the controller input angle based on input from the right stick
				controllerangle = point_direction(0,0,controllerh,controllerv);	
				controller = 1;
				//set angle of characters weapon arm to the controller input angle
				aim_angle = controllerangle;
			}
}

//reset all player input
function PlayerResetInput(){
	//set all input to 0
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	aim_angle = 0;
	key_activatePressed = 0;
	mouse_left_pressed = 0;
	mouse_left_released = 0;
}

//find the highest point the balloon can float by checking for collisions
function PlayerBalloonGetMaxCeiling(){
	var p1;
	var p2;
	var p3;
	var p4;
	var bmc;

	//reset balloon ceiling
	bmc = 0;

	//set var i to our max height while i is less than the 
	for (var i = 1; i < balloonMaxHeight; i += 1){
	
		//get the tile (if any) on the left corner just above the balloon
		p1 = tilemap_get_at_pixel(tilemap,(x-balloonWidthHalf),(y-i-balloonHeightHalf));	
		//get the tile (if any) on the right corner just above the balloon
		p2 = tilemap_get_at_pixel(tilemap,(x+balloonWidthHalf),(y-i-balloonHeightHalf));
		//get the tile (if any) on the left corner just above the balloon
		p3 = tilemap_get_at_pixel(tilemap_pipes,(x-balloonWidthHalf),(y-i-balloonHeightHalf));	
		//get the tile (if any) on the right corner just above the balloon
		p4 = tilemap_get_at_pixel(tilemap_pipes,(x+balloonWidthHalf),(y-i-balloonHeightHalf));

		//if there is a tile on either corner above the balloon, set the ceiling to just below that tile
		if (p1!= 0) || (p2 != 0) || (p3!= 0) || (p4 != 0) break;
		//if there is not a tile on either corner above the balloon, end the loop
		else bmc = i;

	}
	
	return bmc;
}

//set the players terminal velocity based on balloon floating state
function PlayerSetTerminalVelocity(){
	var tv;

	//if we're floating on the balloon
	if (playerFloat){
		//set terminal velocity to our floating terminal velocity
		tv = floatJumpVelocity;
	}
	//otherwise set terminal velocity to our regular terminal velocity
	else{
		tv = regJumpVelocity;
	}
	
	return tv;
}

//set players movement based on input
function PlayerHorizontalMovement(wsp){
	var move;
	var hs;
	//set character movement direction based on player input
	move = key_right - key_left;

	//set characters horizontal speed to walk speed by character movement
	hs = move * wsp;
	
	return hs;
}

//set the balloon to max height if too high
function PlayerBalloonSetToMaxHeight(balloonY){
	var bcy;
	//if the balloon is above max ceiling plus the hdiff
	if (balloonY < y-balloonMaxHeight+balloonH_diff){
		//set balloon to max ceiling 
		bcy = (y-balloonMaxHeight+balloonH_diff);
	}
	else bcy = balloonY;
	return bcy;
}

//set the players floating state based on balloon height
function PlayerSetBalloonFloat(balloonY){
	//if the balloon is at or just below max ceiling plus the hdiff
	if (balloonY <= y-balloonMaxHeight+balloonH_diff+1){
		//set the jump speed to our balloon floating jump
		jumpsp = floatJumpSpeed;
		//declare that the balloon is making us float
		playerFloat = 1;
	} 
	else{
		//set the jump speed to our regular jump
		jumpsp = regJumpSpeed;
		//declare that we are not floating
		playerFloat = 0;
	}
}

//set the correct position for tyhe balloon on the y axis
function PlayerBalloonSetPositionY(balloonY){
	var bcy;
	bcy = balloonY;
	//if the balloon is not at max ceiling
	if (balloonY != y-balloonMaxCeiling){
		
		//if the balloon is above max height, set it back to max height
		if (balloonY < y-balloonMaxCeiling) bcy+=balloonFallSpeed;
		
		//if the balloon is less than max height
		else{
			
			//if the balloon is less than the max vertical distance
			if (balloonY > y+balloonMaxDistance_v) bcy = y+balloonMaxDistance_v;
			
			//if the balloon is not less than the max vertical distance, move the balloon up by the drift speed
			else bcy -= balloonDriftSpeed_v;
		}
	}
	
	return bcy;
}

//set the correct position for tyhe balloon on the x axis
function PlayerBalloonSetPositionX(BalloonXPosition){
	var bcx;
	bcx = BalloonXPosition;
	//if the balloon is not in the target spot on the x axis
	if (BalloonXPosition != x+balloonTargetXOffset){
		
		//if the balloon is past the max horizontal distance to the right, set ballon to max distance
		if (BalloonXPosition > x+balloonTargetXOffset+balloonMaxDistance_h) bcx = x+balloonTargetXOffset+balloonMaxDistance_h;
		
		//if the balloon is past the max horizontal distance to the left, set ballon to max distance
		 else if (BalloonXPosition < x+balloonTargetXOffset-balloonMaxDistance_h) bcx = x+balloonTargetXOffset-balloonMaxDistance_h;
		
		//if the balloon is between the max horizontal distances
		else {
			
			//if balloon is to the right of the target spot, drift left
			if (BalloonXPosition > x+balloonTargetXOffset){
				balloonH_diff = abs(balloonCurrentX-(x+balloonTargetXOffset))/2
				bcx -= balloonDriftSpeed_h;
			}
			
			//if balloon is to the left of the target spot, drift right
			if (BalloonXPosition < x+balloonTargetXOffset){
				balloonH_diff = abs(balloonCurrentX-(x+balloonTargetXOffset))/2
				bcx += balloonDriftSpeed_h;
			}
		}
			
	}
	
	return bcx;
}

//check for a balloon collision wih a gust and set the appropriate behaviour
function PlayerBalloonEnterGust(BallX,BallY){
	var gust_id = instance_position(BallX,BallY,oGust_parent);
	//if we hit an upward gust
	if (gust_id != noone)
	{
		switch(gust_id.object_index){
			case oGust_up:
			case oGust_up_triggered:
				if (gust_id.active){
					//if our upward speed is less than the gust speed, set it to that
					if (vsp > -gustSpeed){
						if (playerFloat){
							vsp = -gustSpeed;
							if (!gustsoundPlayed){
								SoundPlayPitchRandom(sndPlayerUseGust,10,0,0.6,1.4);
								gustsoundPlayed = 1;
							}
						}
						else vsp = 0;

					}
				}
				break;
			case oGust_down:
			case oGust_down_triggered:
				if (gust_id.active){
					//if our downward speed is less than the gust speed, set it to that
					vsp = gustSpeed;
					terminalVelocity = regJumpVelocity;
					if (balloonCurrentY < y-balloonHeightHalf+balloonMaxDistance_v) balloonCurrentY += (balloonFallSpeed);
					
				}
				break;
			case oGust_right:
			case oGust_right_triggered:
				if (gust_id.active){
					//if our horizontal speed to the right is less than the gust speed, set it to that
					if (hsp < gustSpeed){ 
						hsp = gustSpeed;
						balloonCurrentX = (x + balloonTargetXOffset + balloonMaxDistance_h);
					}
				}
				break;
			case oGust_left:
			case oGust_left_triggered:
				if (gust_id.active){
						//if our horizontal speed to the left is less than the gust speed, set it to that
						if (hsp > -gustSpeed){
							hsp = -gustSpeed;
							balloonCurrentX = (x + balloonTargetXOffset - balloonMaxDistance_h);
						}
					}
				break;
		}
	}
	else gustsoundPlayed = 0;
}

//check for collision with water and set the appropriate behaviour with a balloon
function PlayerBalloonWaterCollision(){
	//check for collision with water
	var water = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom+8,oWater,0,1)
	//if there is water
	if (water != noone){
		//if we are not already floating on the water
		if (!balloonWaterFloat){
			//create a splash effect with sound
			CreateSplash(x,bbox_bottom+8,20,-2,2,-3,-1);
			audio_play_sound(sndWaterSplash, 10, false);
		}
		//declare that we are floating on the water with the balloon and reset jump
		balloonWaterFloat = 1;
		balloonCurrentX = x;
		balloonCurrentY = y;
		canjump = 10;
		//if we are below the top of the water, move upward at float speed
		if (bbox_bottom+8 > water.bbox_top){
			if (vsp > -1) vsp-=balloonWaterFloatSpeed;
		}
		//if we are at the top of the water, stop all vertical movement
		else if (vsp > 0) vsp = 0;
	}
	else balloonWaterFloat = 0;
}

//Reset variables if the player does not have the balloon
function PlayerSetNoBalloon(){
	playerFloat = 0;
	jumpsp = regJumpSpeed;
	balloonCurrentX = x;
	balloonCurrentY = y;
	balloonWaterFloat = 0;
}

//check if the player has gone too far from the balloon and set appropriate action
function PlayerCheckAbandonBalloon(){
	//if balloon object exists
	if instance_exists(oBalloon){
		//if the balloon is too far above the player and not moving
		if (oBalloon.y < (oPlayer.y-132)) && (oBalloon.hsp = 0) && (oBalloon.vsp = 0){
			//start the abandon balloon death screen
			DwarfAbandonDeath()
		}
	}
}

//check if the player is falling and set the appropriate action
function PlayerCheckfalling(){
	//if the character is NOT standing on ground (if there are no collision tiles directly beneath the character)
	if ((tilemap_get_at_pixel(tilemap,bbox_left,bbox_bottom+1) = 0) && (tilemap_get_at_pixel(tilemap,bbox_right,bbox_bottom+1) = 0))
	&& ((tilemap_get_at_pixel(tilemap_pipes,bbox_left,bbox_bottom+1) = 0) && (tilemap_get_at_pixel(tilemap_pipes,bbox_right,bbox_bottom+1) = 0)){
			//declare that we are falling (boolean)
			falling = 1;
			balloonMaxDistance_h = balloonMaxDistance_h_air;
			balloonCurrentY = y-balloonMaxCeiling;
		}
	//if the PlayerChar is standing on solid ground (if there is a collision tile directly beneath the character)
	else{
		//reset falling declaration (boolean)
		falling = 0;
		balloonMaxDistance_h = balloonMaxDistance_h_ground;
		//reset jump time to the jump buffer
		canjump = jumpbuffer;
		}
}

//set the players pickaxe to return to the player
function PlayerSetPickaxeReturn(){
	//if the thrown pickaxe exists
		if instance_exists(axe_id)
			//set the unique id of the axe instance
			with (axe_id){
				//if the return time is 0 and we are not already returning
				if ((returning = 0) && (returnTimer <= 0)){
					returning = 1;
					audio_play_sound(sndHammerReturn,10,1);
					var chnc = irandom(3);
					if (!chnc){
						//audio_play_sound(sndHammerTalk,10,0);
						//if instance_exists(currentText) with(currentText){instance_destroy()};
						//currentText = CreateTextBubble(self,0,-16,text_return[irandom(textCount_return)],c_black,20,fa_center);
					}
					
				}
			}
		//declare that we are holding the mouse button
		mouse_left_held = 1;
}

//Creates a thrown pickaxe and takes the pickaxe from the player
function PlayerThrowPickaxe(){
	//disable throw direction display
		showThrowDirection = 0;
		//play sound
		SoundPlayPitchRandom(sndHammerThrow,10,0,0.5,1.5);
		//create instance of the pickaxe and assign it values
		axe_id = instance_create_layer(x+4,y,"Instances",oPickaxe)
		if instance_exists(currentText) instance_destroy(currentText);
		with (axe_id){
				//set pickaxe speed to throw speed
				spd = oPlayer.pickaxeThrowSpeed;
				//set pickaxe direction the player dwarfs aim angle
				dir = oPlayer.aim_angle;
				//create hammer text
				var chnc = irandom(2)
				if (!chnc){
					if instance_exists(currentText) with(currentText){instance_destroy()};
					currentText = CreateTextBubble(self,0,-16,text_throw[irandom(textCount_throw)],c_black,45,fa_center);
				}
				//set pickaxe to flying state
				flying = 1;
				//set the max distance we can throw the pickaxe before it returns
				throwRange = oPlayer.pickaxeThrowRange;
				//if we are adjusting the axe landing (boolean)
				adjusting = 0;
				//if aim angle is to the left, flip the yscale of the arm
				if (oPlayer.aim_angle > 110) and (oPlayer.aim_angle < 290) xOrient = 180;
				//if angle is to the right, reset the yscale of the arm
				else xOrient = 0;
				axeRotation = xOrient;
		}
		//set player to no longer carrying the axe
		hasPickaxe = 0;
}

//player picks up the pickaxe if standing on it
function PlayerPickupPickaxe(){
	
	if(instance_exists(axe_id)){
		if (distance_to_object(axe_id) < 2){
			//if the pickaxe is returning to the player or the pickup timer has ended
			if (axe_id.returning) or (axe_id.pickupTimer == 0){
	
				//if the pickaxe is not flying through the air
				hasPickaxe = 1;
				audio_stop_sound(sndHammerReturn);
				with (axe_id){instance_destroy(currentText)};
				throwcooldown = 10;
				mouse_left_held = 0;  //possible fix
				var chnc = irandom(2)
				if (!chnc){
					audio_play_sound(sndHammerTalk,10,0);
					currentText = CreateTextBubble(self,12,-4,text_hammerReturned[irandom(textCount_hammerReturned)],c_black,30,fa_left);
				}
				//destroy the instance of the thrown axe
				instance_destroy(axe_id);
			}
		}
	}
}

//check if there is a hook at the player position and put the ballon on the hook or take it off
function PlayerCheckBalloonOnHook(){
	var hook = instance_position(x+balloonTargetXOffset,y,oHook);
	
	//if we are already holding the balloon
	if (hasBalloon){
		if (hook != noone){
			if (!hook.hasBalloon){
				hasBalloon = 0;
				hook.hasBalloon = 1;
				hook.balloonCurrentX = balloonCurrentX;
				hook.balloonCurrentY = balloonCurrentY;
			}
		}
		else{
			hasBalloon = 0;
			balloonPickupTimer = balloonPickupCooldown;
			SoundPlayPitchRandom(sndBalloonLetGo,10,0,0.5,1.5);
			instance_create_layer(balloonCurrentX,balloonCurrentY,"Instances",oBalloon)
		}
	}
	//if we are not holding the balloon
	else{
		if (hook != noone){
			if (hook.hasBalloon){
				hasBalloon = 1;
				hook.hasBalloon = 0;
				balloonCurrentX = hook.balloonCurrentX;
				balloonCurrentY = hook.balloonCurrentY;
			}
		}
			
	}
}

//check if there is a balloon just above the player and if so grab it
function PlayerPickupBalloon(){
	//if we are not holding a balloon
	if (!hasBalloon){
		//check for a balloon item above the player
		var balloonItem = collision_rectangle(x+balloonTargetXOffset-2,y-20,x+balloonTargetXOffset+2,y+10,oBalloon,0,1);
		
		//if there is a balloon item
		if (balloonItem != noone) && (balloonPickupTimer = 0){
			hasBalloon = 1;
			balloonCurrentX = balloonItem.x;
			balloonCurrentY = balloonItem.y;
			SoundPlayPitchRandom(sndBalloonPickup,10,0,0.5,1.5);
			var chnc = irandom(4);
			if (!chnc){ 
				audio_play_sound(sndBalloonTalk,10,0);
				with (oBalloon) {if instance_exists(currentText) with(currentText){instance_destroy()}};
				currentText = CreateTextBubble(self,balloonCurrentX-x+balloonH_diff+14,balloonCurrentY-y,text_balloonGrab[irandom(textCount_balloonGrab)],c_ltred,45,fa_left);
			}
			with (oBalloon) instance_destroy();
			with (oBalloonRope) instance_destroy();
		
		}
	}
}

//decrease the time until the player can pickup the balloon
function PlayerSetBalloonPickupTimer(){
	if (balloonPickupTimer > 0) balloonPickupTimer --;
}

//check if the player is colliding with a world object and set the appropriate action
function PlayerCollideWithWorldObjects(){
	//if we are colliding with spikes
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oSpikes,0,1){
		DwarfDeath();
	}

	//if we are colliding with spikes
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oGoblin,0,1)
	or collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oGoo,0,1)
	or collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oGoblinShield,0,1)
	or collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oFish,0,1){
		DwarfDeath();
	}

	//if we are colliding with spikes
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oFallingSpike,0,1){
		DwarfDeath();
	}
}

//check if the held balloon is colliding with a world object and set the appropriate action
function PlayerBalloonCollideWithWorldObjects(){
	//if the held balloon is colliding with spikes
	if collision_rectangle(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),oSpikes,0,1){
		DwarfBalloonDeath();
	}
	
	if collision_rectangle(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),oGoblin,0,1)
	or collision_rectangle(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),oGoo,0,1)
	or collision_rectangle(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),oGoblinShield,0,1)
	or collision_rectangle(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),oFish,0,1){
	DwarfBalloonDeath();
	}
	if collision_rectangle(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),oFallingSpike,0,1){
	DwarfBalloonDeath();
	}
}

//set the players sprite animation when falling
function PlayerSetSpriteFalling(){
	//set the body sprite to jump
	sprite_body = sDwarf_body_jump;
	
	//set head sprite frame to 0 (eys open)
	headFrame = 0;
	
	//if character is not holding the balloon or floating on it, set balloon arm sprite to jump
	if (hasBalloon = 0) sprite_BA = sDwarf_BA_jump;
	//if character is holding balloon, set balloon arm sprite to hold
	else sprite_BA = sDwarf_BA_hold;
	
	//if character is not holding the pickaxe, set pickaxe arm sprite to jump
	if (hasPickaxe == 0){
		if (balloonWaterFloat) sprite_PA = sDwarf_PA_idle;
		else  sprite_PA = sDwarf_PA_jump;
	}
	//if character is holding pickaxe, set pickaxe arm sprite to hold
	else sprite_PA = sDwarf_PA_hold;
	
	//stop animating
	image_speed = 0;
	//if the character is moving up, set sprite frame to 0
	if (y < yprevious) image_index = 0;
	//if the character is not moving up, set spriute frame to 1
	else image_index = 1;
}

//set the players sprite animation when idle
function PlayerSetSpriteIdle(){
	//set the body sprite to idle
		sprite_body = sDwarf_body_idle;
	
		//if character is not holding the balloon, set balloon arm sprite to idle
		if (hasBalloon = 0) sprite_BA = sDwarf_BA_idle;
		//if character is holding balloon, set balloon arm sprite to hold
		else sprite_BA = sDwarf_BA_hold;
	
		//if character is not holding the pickaxe, set pickaxe arm sprite to idle
		if (hasPickaxe == 0) sprite_PA = sDwarf_PA_idle;
		//if character is holding pickaxe, set pickaxe arm sprite to hold
		else sprite_PA = sDwarf_PA_hold;
		
		//start sprite animation
		image_speed = 0.5;
		
		//BLINKING
		
		//if the time to blink is now
		if headBlinkTimer = 0{
			//if we're in the second stage, set the eyes to open and reset blink timer
				switch(headFrame){
				case 2:
					headFrame = 0;
					headBlinkTimer = headBlinkCooldown;
					break;
	
				//if we're in the first stage, set the blink to the second stage and set blink duration
				case 1:
					headFrame = 2;
					headBlinkTimer = headBlinkDuration;
					break;
				
				//if we havent started the blink set the blink to the first stage and set blink duration
				case 0:
					headFrame = 1;
					headBlinkTimer = headBlinkDuration;
					break;
				}
				
		}
		//if there is time till the next wink
		else{
			//decrease time until next blink 
			headBlinkTimer --;
		}
}

//set the players sprite animation when moving
function PlayerSetSpriteMove(){
	//set the body sprite to run
			sprite_body = sDwarf_body_run;
			
			//set head sprite frame to 0 (eys open)
			headFrame = 0;
	
			//if character is not holding the balloon, set balloon arm sprite to run
			if (hasBalloon = 0) sprite_BA = sDwarf_BA_run;
			//if character is holding balloon, set balloon arm sprite to hold
			else sprite_BA = sDwarf_BA_hold;
	
			//if character is not holding the pickaxe, set pickaxe arm sprite to run
			if (hasPickaxe == 0) sprite_PA = sDwarf_PA_run;
			//if character is holding pickaxe, set pickaxe arm sprite to hold
			else sprite_PA = sDwarf_PA_hold;
			
			//start sprite animation
			image_speed = 2;
			if (!audio_is_playing(sndFootstep0)) && (!audio_is_playing(sndFootstep1)) && (!audio_is_playing(sndFootstep2)){
				SoundPlayPitchRandom(choose(sndFootstep0,sndFootstep1,sndFootstep2), 10, false,1,1);
			}
}

//decrease the time until we can pickup the pickaxe
function PlayerDecreasePickaxeTimer(){
	throwcooldown --;
}

//decrease our available time to jump
function PlayerDecreaseJumpTime(){
	canjump --;
}
//