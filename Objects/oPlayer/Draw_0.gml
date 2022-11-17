/// @desc Draw Character & Weapon Arm

// -- DRAW HELD BALLOON

//if the character is holding the balloon
if (hasBalloon) && (!balloonWaterFloat){
	if (balloonCurrentY <= y-balloonMaxHeight+balloonH_diff+5)
	draw_line_width_color(x+balloonTargetXOffset,y-6,balloonCurrentX-1,balloonCurrentY+balloonHeightHalf-2,1,c_dkgray,c_dkgray);
	//draw the balloon in its current position
	draw_sprite(sBalloon,0,balloonCurrentX,balloonCurrentY);
}


//draw player dwarf body
if (balloonWaterFloat) draw_sprite(sprite_water,-1,x,y);
else draw_sprite(sprite_body,-1,x,y);

//draw player dwarf head
draw_sprite_ext(sprite_head,headFrame,x,y,image_xscale,image_yscale,0,c_white,1);

//draw player dwarf balloon arm
if (!balloonWaterFloat)
	draw_sprite(sprite_BA,-1,x,y);

#region // -- DRAW PICKAXE ARM & THROW/RETURN DISPLAY

//if the player dwarf has the pickaxe
if (hasPickaxe){
	
	#region // -- DRAW PICKAXE ARM
	
	//create variable to control which way the image is flipped
	var yscale;
	
	//if aim angle is to the left, flip the yscale of the arm
	if (aim_angle > 110) and (aim_angle < 290) yscale = -1;
	//if angle is to the right, reset the yscale of the arm
	else yscale = 1;
	
	//draw the pickaxe arm aiming where the players aim angle is, at the correct position and flipped the correct way
	draw_sprite_ext(sprite_PA,0,x+drawPickaxeArm_xoffset,y+drawPickaxeArm_yoffset,1,yscale,aim_angle,c_white,1);
	
	#endregion
	
	#region // -- DRAW THROW DISPLAY
	
	//if throw direction display is enabled
	if (showThrowDirection){
		
		//if the marker move distance is less than the max, increase marker move distance
		if (drawPickaxeDisplay_markerMove < drawPickaxeDisplay_markerMoveMax) drawPickaxeDisplay_markerMove += drawPickaxeDisplay_markerMoveRate;
		//if the marker move distance is more than the max, reset the move distance
		else drawPickaxeDisplay_markerMove = 0;
		
		//create a variable for tracking the marker move distance from the max, used to set transparency of the marker
		var markerAlpha = (1 - (drawPickaxeDisplay_markerMove / drawPickaxeDisplay_markerMoveMax));
		
		//create a variable for tracking max distance to a collision with a tile
		var collisionDist = 0;
	
		//loop through each pixel along the aim angle, stopping at our max throw range
		for (var i = 0; i < pickaxeThrowRange; i += 1){
			//check the pixel for a tile, if pixel is empy, set collision distance to this range, otherwise break the loop
			if (tilemap_get_at_pixel(tilemap, x+lengthdir_x(i,aim_angle),y+lengthdir_y(i,aim_angle)) == 0 ) collisionDist = i;
			else break;
			}
		
		if (collisionDist >= pickaxeThrowRange-1)
			//draw the farthest pickaxe throw marker at our throw range with an empty marker
			draw_sprite_ext(sPickaxeMarker,2,x+lengthdir_x(collisionDist,aim_angle),y+lengthdir_y(collisionDist,aim_angle),1,1,aim_angle,c_white, 1);
		else
			//draw the farthest pickaxe throw marker at our collision range with a target marker
			draw_sprite_ext(sPickaxeMarker,1,x+lengthdir_x(collisionDist,aim_angle),y+lengthdir_y(collisionDist,aim_angle),1,1,aim_angle,c_white, 1);
		
		//if 3/4ths of the collsion range is more than the min draw distance, draw 2nd farthest throw marker
		if ((ceil(collisionDist*0.75)+round(drawPickaxeDisplay_markerMove)) > drawPickaxeDisplay_minDistance)
			draw_sprite_ext(sPickaxeMarker,0,x+lengthdir_x((ceil(collisionDist*0.75)+round(drawPickaxeDisplay_markerMove)),aim_angle),y+lengthdir_y((ceil(collisionDist*0.75)+round(drawPickaxeDisplay_markerMove)),aim_angle),1,1,aim_angle,c_white, markerAlpha);
		
		//if 1/2 of the collsion range is more than the min draw distance, draw 3rd farthest throw marker
		if ((ceil(collisionDist*0.5)+round(drawPickaxeDisplay_markerMove)) > drawPickaxeDisplay_minDistance)
			draw_sprite_ext(sPickaxeMarker,0,x+lengthdir_x((ceil(collisionDist*0.5)+round(drawPickaxeDisplay_markerMove)),aim_angle),y+lengthdir_y(ceil((collisionDist*0.5)+round(drawPickaxeDisplay_markerMove)),aim_angle),1,1,aim_angle,c_white, markerAlpha);
		
		//if 1/4th of the collsion range is more than the min draw distance, draw closest throw marker
		if ((ceil(collisionDist*0.25)+round(drawPickaxeDisplay_markerMove))> drawPickaxeDisplay_minDistance)
			draw_sprite_ext(sPickaxeMarker,0,x+lengthdir_x((ceil(collisionDist*0.25)+round(drawPickaxeDisplay_markerMove)),aim_angle),y+lengthdir_y(ceil((collisionDist*0.25)+round(drawPickaxeDisplay_markerMove)),aim_angle),1,1,aim_angle,c_white, markerAlpha);
	}
	
	#endregion
	
}

//if the dwarf does not have the pickaxe
else{
	
	var axeReturning = PlayerCheckPickaxeReturning();
	//if there is a thrown axe instance returning to the player
	if (axeReturning){
				
				//get the angle the pickaxe is returning from
				var returnAngle = point_direction(x,y,axe_id.x,axe_id.y);
				
				//get the reverse angle the pickaxe is returning from
				var reverseReturnAngle = (returnAngle - 180);
				
				//create variable to control which way the image is flipped
				var yscale;
				//if aim angle is to the left, flip the yscale of the arm
				if (returnAngle > 110) and (returnAngle < 290) yscale = -1;
				//if angle is to the right, reset the yscale of the arm
				else yscale = 1;
	
				//draw the pickaxe arm aiming where the players aim angle is, at the correct position and flipped the correct way
				draw_sprite_ext(sDwarf_PA_return,0,x+drawPickaxeArm_xoffset,y+drawPickaxeArm_yoffset,1,yscale,returnAngle,c_white,1);
				
				//DRAW RETURN DISPLAY
				
				//create a variable to track the player dwarfs distance to the axe
				var returnDistance = distance_to_point(axe_id.x,axe_id.y);
				
				//if the marker move distance is less than the max, increase marker move distance
				if (drawPickaxeDisplay_markerMove < drawPickaxeDisplay_markerMoveMax) drawPickaxeDisplay_markerMove += drawPickaxeDisplay_markerMoveRate;
				//if the marker move distance is more than the max, reset the move distance
				else drawPickaxeDisplay_markerMove = 0;
		
				//create a variable for tracking the marker move distance from the max, used to set transparency of the marker
				var markerAlpha = (1 - (drawPickaxeDisplay_markerMove / drawPickaxeDisplay_markerMoveMax));
		
				//if 3/4ths of the axe distance is more than the min draw distance, draw 2nd farthest throw marker
				if ((ceil(returnDistance*0.75)-round(drawPickaxeDisplay_markerMove)) > drawPickaxeDisplay_minDistance)
					draw_sprite_ext(sPickaxeMarker,0,x+lengthdir_x((ceil(returnDistance*0.75)-round(drawPickaxeDisplay_markerMove)),returnAngle),y+lengthdir_y((ceil(returnDistance*0.75)-round(drawPickaxeDisplay_markerMove)),returnAngle),1,1,reverseReturnAngle,c_white, markerAlpha);
		
				//if 1/2 of the axe distance is more than the min draw distance, draw 3rd farthest throw marker
				if ((ceil(returnDistance*0.5)-round(drawPickaxeDisplay_markerMove)) > drawPickaxeDisplay_minDistance)
					draw_sprite_ext(sPickaxeMarker,0,x+lengthdir_x((ceil(returnDistance*0.5)-round(drawPickaxeDisplay_markerMove)),returnAngle),y+lengthdir_y(ceil((returnDistance*0.5)-round(drawPickaxeDisplay_markerMove)),returnAngle),1,1,reverseReturnAngle,c_white, markerAlpha);
		
				//if 1/4th of the axe distance is more than the min draw distance, draw closest throw marker
				if ((ceil(returnDistance*0.25)-round(drawPickaxeDisplay_markerMove)) > drawPickaxeDisplay_minDistance)
					draw_sprite_ext(sPickaxeMarker,0,x+lengthdir_x((ceil(returnDistance*0.25)-round(drawPickaxeDisplay_markerMove)),returnAngle),y+lengthdir_y(ceil((returnDistance*0.25)-round(drawPickaxeDisplay_markerMove)),returnAngle),1,1,reverseReturnAngle,c_white, markerAlpha);
					
			}
	//if there is not an axe returning, draw the empty pickaxe arm
	else draw_sprite(sprite_PA,-1,x,y);
}

#endregion


//DEBUG COLLISONS
//draw_rectangle_color(bbox_left,bbox_bottom+8,bbox_right,bbox_top,c_blue,c_blue,c_blue,c_blue,1)

//draw_rectangle_color(balloonCurrentX-balloonWidthHalf,balloonCurrentY-balloonHeightHalf,balloonCurrentX+balloonWidthHalf,balloonCurrentY+(balloonHeightHalf/2),c_blue,c_blue,c_blue,c_blue,1)
