/// @desc Pickaxe Movement/States

#region // -- IF RETURNING

//if the pickaxe is returning to the player dwarf
if (returning){
	
	//if the player dwarf is in the game
	if instance_exists(oPlayer){
		
		//set direction toward the player
		dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		
		//set speed to axe return speed
		spd = oPlayer.pickaxeReturnSpeed;
		
		layer = layer_get_id("DwarfDeath");
		
		//set the axeRotation to the oppisite of axe direction (so the handle comes back first)
		axeRotation = dir-180;
	}
	//if the player dwarf is not in the game
	else{
		//stop returning and stop flying, set speed to 0
		returning = 0;
		spd = 0;
		flying = 0;
	}
}

#endregion

//if the pickaxe is not yet returning
else{
	//decrease time until we can return axe
	returnTimer --;
	
	#region // -- IF FLYING
	//if we are currently flying through the air 
	if flying{
		
		//if the axe is at max distance, enter return stage
		if (distance_to_point(xOrigin,yOrigin) > throwRange){
			spd = 0;
			flying = 0;
			returning = 1;
			audio_play_sound(sndHammerReturn,10,1);
		}
		
		//set the correct rotation direction based on Xorient
		if (xOrient = 0) axeRotation -= axeRotationSpeed;
		else axeRotation += axeRotationSpeed;
		
		//if we come into contact with a solid tile
		if (tilemap_get_at_pixel(tilemap, bbox_right+lengthdir_x(round(spd),dir),bbox_top+lengthdir_y(round(spd),dir)) == 1 )
		or (tilemap_get_at_pixel(tilemap, bbox_right+lengthdir_x(round(spd),dir),bbox_bottom+lengthdir_y(round(spd),dir)) == 1 )
		or (tilemap_get_at_pixel(tilemap, bbox_left+lengthdir_x(round(spd),dir),bbox_top+lengthdir_y(round(spd),dir)) == 1 )
		or (tilemap_get_at_pixel(tilemap, bbox_left+lengthdir_x(round(spd),dir),bbox_bottom+lengthdir_y(round(spd),dir)) == 1 ){
			
			//stop flying and set speed to 0, enable collisions and gravity
			SoundPlayPitchRandom(sndHammerHitWall,10,0,0.5,1.5);
			flying = 0;
			spd = 0;
			adjusting = 1;
			CreateDust(x,y,5,-1,1,-0.5,0.5);
			var chnc = irandom(1);
			if (!chnc){
				audio_play_sound(sndHammerTalk,10,0);
				if instance_exists(currentText) with(currentText){instance_destroy()};
				currentText = CreateTextBubble(self,0,-16,text_hitBlock[irandom(textCount_hitBlock)],c_black,45,fa_center);
			}
		}
	}
	
	#endregion

	#region // -- IF LANDING

	//if we are not flying through the air
	else{
		
		//if we are adjusting our landing
		if (adjusting){
			
			//if we are colliding with a tile
			if (tilemap_get_at_pixel(tilemap,bbox_right,bbox_top) == 1 )
			or (tilemap_get_at_pixel(tilemap,bbox_right,bbox_bottom) == 1 )
			or (tilemap_get_at_pixel(tilemap,bbox_left,bbox_top) == 1 )
			or (tilemap_get_at_pixel(tilemap,bbox_left,bbox_bottom) == 1 ){
				
				//move the axe back the way it came
				x -= lengthdir_x(1,dir);
				y -= lengthdir_y(1,dir);
			}
			
			//if not colliding, end adjusting phase
			else adjusting = 0;
		}
		//if we have finished adjusting
		else{
			
			//enable collisions and gravity
			SolidCollisions()
			
			//decrease time until player can pickup the pickaxe
			if (pickupTimer > 0) pickupTimer --;
		}
	}
	#endregion
}

if (spd > 0){
	x += lengthdir_x(spd,dir);
	y += lengthdir_y(spd,dir);
}

//move_towards_point(lengthdir_x(1,dir),lengthdir_y(1,dir),spd);

var breakBlock = collision_rectangle(bbox_left-4,bbox_top-4,bbox_right+4,bbox_bottom+4,oBreakableBlock,0,1);

if (breakBlock != noone) && (flying){
	instance_destroy(breakBlock);
	flying = 0;
	spd = 0;
	adjusting = 1;
	CreateDust(x,y,5,-1,1,-0.5,0.5);
	CreateChunk(breakBlock.x,breakBlock.y,20,-4,4,-4,-1);
	SoundPlayPitchRandom(sndBlockBreak,10,0,0.5,1.5);
	var chnc = irandom(1)
	if (!chnc){
		audio_play_sound(sndHammerTalk,10,0);
		if instance_exists(currentText) with(currentText){instance_destroy()};
		currentText = CreateTextBubble(self,0,-16,text_hitBreakable[irandom(textCount_hitBreakable)],c_black,45,fa_center);
	}
}

if (landed) hitShield = 0;