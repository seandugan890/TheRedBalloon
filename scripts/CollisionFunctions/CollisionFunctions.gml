//tile collision handling 
function SolidCollisions() {

	#region // -- INITIALIZE VARIABLES

	//initialize variables used only in this script
	var bbox_side;
	var p1;
	var p2;
	var p3;
	var p4;
	var xsp;
	var ysp;

	#endregion

	#region // -- HORIZONTAL COLLISION

	//turn our floating speed value into an integer	
	xsp = round(hsp);


	#region // -- TILE COLLISION

	//decide what side of our collision box we check based on our horizontal speed
	if (xsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	//get the tile data from each pixel on the side we are potentially colliding on
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+xsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+xsp,bbox_bottom);
	p3 = tilemap_get_at_pixel(tilemap_pipes,bbox_side+xsp,bbox_top);
	p4 = tilemap_get_at_pixel(tilemap_pipes,bbox_side+xsp,bbox_bottom);
	
	//if there is a tile to the side of us
	if (p1 != 0) || (p2 != 0) || (p3 != 0) || (p4 != 0) 
		{
			//if the width of the characters sprite is the same as the tileseize
			if (sprite_get_width(mask_index) == TILE_SIZE)
				{
					//snap to the edge of the tile
					if (xsp > 0 ) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
					else x = x - (x mod TILE_SIZE) - (bbox_left - x);
				}
			//if the width of the characters sprite is NOT the same as the tileseize
			else
				{
					//snap to the edge of the tile
					if (xsp > 0 ) x = x - (bbox_right mod TILE_SIZE) + (TILE_SIZE-1);
					else x = x - (x mod TILE_SIZE) 
				}
			//set horizontal speed to 0
			xsp = 0;
			hsp = 0;
		}

	#endregion

		//Move the PlayerChar at current horizontal speed
		x = x + xsp;

	#endregion

	#region // -- VERTICAL COLLISION

	#region // -- ADD GRAVITY

	//if veritcal speed is less than characters terminal velocity, add gravity to veritcal speed
	if (vsp < terminalVelocity) 
		vsp = vsp + grv;
	else vsp = terminalVelocity;

	#endregion

	//turn our floating vertical speed value into an integer	
	ysp = round(vsp);

	#region // -- TILE COLLISION

	//if character is going down, set the collision checking side to bottom, otherwise set it to top
	if (ysp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	
	//get the tile (if any) on the left corner of the collision checking side
	p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+ysp);	
	//get the tile (if any) on the left corner of the collision checking side
	p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+ysp);
	//get the pipe tile (if any) on the left corner of the collision checking side
	p3 = tilemap_get_at_pixel(tilemap_pipes,bbox_left,bbox_side+ysp);	
	//get the pipe tile (if any) on the left corner of the collision checking side
	p4 = tilemap_get_at_pixel(tilemap_pipes,bbox_right,bbox_side+ysp);
	
	//if there is a tile on either corner above or below us
	if (p1!= 0) || (p2 != 0) || (p3!= 0) || (p4 != 0)
		{
			
			//if the height of the character is the same as a tile
			if (sprite_get_height(mask_index) = TILE_SIZE)
				{
					
					//if character is going down, move character onto the tile
					if (ysp > 0 ) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
					
					//if the character is not moving vertically, snap them to the tile
					else y = y - (y mod TILE_SIZE) - (bbox_top - y);
				}
				
			//if the height of the character is not the same as the tile
			else
				{
					//if character is going down, move character onto the tile
					if (ysp > 0 ) y = y - (bbox_bottom mod TILE_SIZE) + (TILE_SIZE-1);
					
					//if the character is not moving vertically, snap them to the tile
					else y = y - (y mod TILE_SIZE) 
				}
			
			//stop all vertical movement
			vsp = 0;
			ysp = 0;
			
			//if we are just now landing, create dust particles
			if (!landed){
				CreateDust(x,bbox_bottom,5,-2,2,-0.4,0);
				landed = 1;
				if (hascontrol)
					audio_play_sound(choose(sndFootstep0,sndFootstep1,sndFootstep2), 10, false);
			}
		}
		else{
			//if there is no tile above or below us
			if (p1 == 0) && (p2 == 0) && (ysp != 0){
				landed = 0;
			}
		}
	
	
	#endregion

	//Move character along the y axis by vertical speed
	y = y + ysp;

	#endregion

}

//tile collision handling not including wind pipe tiles (used by balloon)
function SolidCollisionsNoPipes() {

#region // -- INITIALIZE VARIABLES

//initialize variables used only in this script
var bbox_side;
var p1;
var p2;
var xsp;
var ysp;

#endregion

#region // -- HORIZONTAL COLLISION

	//turn our floating speed value into an integer	
	xsp = round(hsp);


#region // -- TILE COLLISION

	if (xsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	p1 = tilemap_get_at_pixel(tilemap,bbox_side+xsp,bbox_top);
	p2 = tilemap_get_at_pixel(tilemap,bbox_side+xsp,bbox_bottom);
	//if there is a tile to the side of us
	if (p1 != 0) || (p2 != 0)
		{
			//snap to the edge of the tile
			if (sprite_get_width(mask_index) = TILE_SIZE)
				{
					if (xsp > 0 ) x = x - (x mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_right - x);
					else x = x - (x mod TILE_SIZE) - (bbox_left - x);
				}
			else
				{
					if (xsp > 0 ) x = x - (bbox_right mod TILE_SIZE) + (TILE_SIZE-1);
					else x = x - (x mod TILE_SIZE) 
				}
			//set horizontal speed to 0
			xsp = 0;
			hsp = 0;
		}

#endregion

	//Move the PlayerChar at current horizontal speed
	x = x + xsp;

#endregion

#region // -- VERTICAL COLLISION

#region // -- ADD GRAVITY

//if veritcal speed is less than characters terminal velocity, add gravity to veritcal speed
if (vsp < terminalVelocity) 
	vsp = vsp + grv;
else vsp = terminalVelocity;

#endregion

//turn our floating vertical speed value into an integer	
ysp = round(vsp);

#region // -- TILE COLLISION

	//if character is going down, set the collision checking side to bottom, otherwise set it to top
	if (ysp >= 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	
	//get the tile (if any) on the left corner of the collision checking side
	p1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+ysp);	
	//get the tile (if any) on the left corner of the collision checking side
	p2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+ysp);
	
	//if there is a tile on either corner above or below us
	if (p1!= 0) || (p2 != 0)
		{
			
			//if the height of the character is the same as a tile
			if (sprite_get_height(mask_index) = TILE_SIZE)
				{
					
					//if character is going down, move character onto the tile
					if (ysp > 0 ) y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
					
					//if the character is not moving vertically, snap them to the tile
					else y = y - (y mod TILE_SIZE) - (bbox_top - y);
				}
				
			//if the height of the character is not the same as the tile
			else
				{
					//if character is going down, move character onto the tile
					if (ysp > 0 ) y = y - (bbox_bottom mod TILE_SIZE) + (TILE_SIZE-1);
					
					//if the character is not moving vertically, snap them to the tile
					else y = y - (y mod TILE_SIZE) 
				}
			
			//stop all vertical movement
			vsp = 0;
			ysp = 0;
			
			//if we are just now landing, create dust particles
			if (!landed){
				CreateDust(x,bbox_bottom,5,-2,2,-0.4,0);
				landed = 1;
			}
		}
		else{
			//if there is no tile above or below us
			if (p1 == 0) && (p2 == 0) && (ysp != 0){
				landed = 0;
			}
		}
	
	
#endregion

//Move character along the y axis by vertical speed
y = y + ysp;

#endregion

}
