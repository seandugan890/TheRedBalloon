// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Setup the variables used by most enemies
function EnemyVariableSetup(SpriteDirection,AggroRange,MoveCooldown,SpriteIdle,SpriteMove){

//set the image direction of the enemy
image_xscale = -1;
//set patrol direction to image direction (used for patrolling enemies)
patrolDirection = image_xscale;
//if the enemy is currently falling
falling = 0;
//cooldown till next movement
moveCooldown = MoveCooldown;
//time till next movement
moveTimer = 0;
//set walk speed
walksp = 1;
//the last spot on the x axis where we stopped
xs = x;
//range at which character will move toward the player
aggroRange = AggroRange;

//the sprite the enemy uses while idle
sprite_idle = SpriteIdle;
//the sprite the enemy uses while moving
sprite_move = SpriteMove;
}

//set movement direction for a patrolling enemy
function EnemyPatrol(){
	var move = 0;
	//if move timer is at 0
	if (moveTimer = 0){
			move = patrolDirection;
			//reset moveTimer
			moveTimer = moveCooldown;
	}
	moveTimer --;
	return move;
}
	
//set movement direction for an enmy following the player
function EnemyFollowPlayer(){
	var move = 0;
	//if move timer is at 0
	if (moveTimer = 0){
			//if the player exists
			if instance_exists(oPlayer)
				{
					if (distance_to_object(oPlayer) < aggroRange){
						//if player is to the right set move to 1 (right)
						if (oPlayer.x > x) move = 1;
						//otherwise set move to -1 (left)
						else if (oPlayer.x < x) move = -1;
						else move = 0;
					}
					//stop moving
					else{
						move = 0;
						xs = x;
					}
				}
			//if player doesnt exist, stop moving
			else move = 0;
			//reset moveTimer
			moveTimer = moveCooldown;
		}
	
	moveTimer --;
	return move;
}

//set speed based on movement direction
function EnemySetMovement(move){
	//set characters horizontal speed to walk speed by character movement
	hsp = move * walksp;
}

//set patrol direction after collision with a direction changer
function EnemyCheckPatrolDirection(){
	//update patrol direction
	var dirChanger = instance_position(x,y,oEnemyDirectionChanger);
	if (dirChanger != noone){
	patrolDirection = dirChanger.patrolDirection;
	}
}

//Check for pickaxe collision with enemy shield and if so stop the axe
function EnemyCheckShieldedBlock(move){
	if (image_xscale = -1){
		if collision_rectangle(bbox_left-1,bbox_top,bbox_left+3,bbox_bottom,oPickaxe,0,1) && (!oPickaxe.landed){
			with (oPickaxe){
				if (!hitShield)
					PickaxeHitShield();
			}
		}
	}
	if (image_xscale = 1){
		if collision_rectangle(bbox_right+1,bbox_top,bbox_right-3,bbox_bottom,oPickaxe,0,1) && (!oPickaxe.landed){
			with (oPickaxe){
				if (!hitShield)
					PickaxeHitShield();
			}
		}
	}
}

//check if the enemy has been hit by the pickaxe
function EnemyCheckHit(){
	
		//create pickaxe variable
		var pickaxe;
	
		pickaxe = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPickaxe,0,1);

		//if we are colliding with the pickaxe and the pickaxe hasnt touched the ground yet
			if (pickaxe != noone){
				if (!pickaxe.landed) && (!pickaxe.hitShield){
				//trigger death event (alarm0)
					alarm[0] = 1;
					//stop the pickaxe and create a bit of dust
					with (oPickaxe){
						PickaxeHitEnemy();
					}
				}
			}

}

//set the enemy animation
function EnemyAnimation(move){
	if (falling){
	sprite_index = sprite_idle;
}
//if character is not falling
else{
	//if character is standing still stop and reset animation
	if (xs == x) {
		sprite_index = sprite_idle;
	}
	//if character is moving let the animation play
	else{
		if (tilemap_get_at_pixel(tilemap,bbox_left-1,bbox_bottom) = 0) && (tilemap_get_at_pixel(tilemap,bbox_left-1,bbox_top) = 0)
		&& (tilemap_get_at_pixel(tilemap,bbox_right+1,bbox_bottom) = 0) && (tilemap_get_at_pixel(tilemap,bbox_right+1,bbox_top) = 0){
		sprite_index = sprite_move;
		}
		else sprite_index = sprite_idle;
	}
	
}
if (move != 0) image_xscale = move;
}

//kill the enemy and create death object
function EnemyDeath(DeathObject){
	//create the death object for the enemy
	with instance_create_layer(x,y,"Enemies",DeathObject){
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		}
	//destroy the enemy instance
	instance_destroy();
}

//draw the eyeball on the goo enemy
function EnemyDrawGooEyeball(){
	
	//create variable for eye direction
	var eyeDir;
	
	//if the player object exists, set the eye direction toward the player
	if instance_exists(oPlayer) eyeDir = point_direction(x,y,oPlayer.x,oPlayer.y)
	//otherwise default the eye direction to looking up
	else eyeDir = 90;

	//draw the eyeball sprite rotated to the eye direction
	draw_sprite_ext(sGooEye,0,x+(image_xscale*2),y,1,1,eyeDir,c_white,1);
	//draw a static eyelid sprite above the eyeball
	draw_sprite(sGooEyeLid,0,x+(image_xscale*2),y-1);
}

//destory the enemy death object and create some dust
function EnemyDestroyDeathObject(){
	CreateDust(x,y,10,-2,2,-2,2);
	instance_destroy();
}

//Set the movement for the fish enemy
function EnemyFishMovement(){
	//if the move timer has run out
	if (moveTimer = 0){
		image_xscale = 1;
		//check the rotation of the sprite and move in that direction
		//adjust the image flip of the sprite 
		switch(image_angle){
			case 0:
				x += walksp; 
				image_yscale = 1;
				break;
			case 180:
				x -= walksp; 
				image_yscale = -1;
				break;
			case 90:
				y -= walksp; 
				image_yscale = 1;
				break;
		
			case 270:
				y += walksp; 
				image_yscale = 1;
				break;
		}
	//reset the move timer
	moveTimer = moveCooldown;
	}
	//decrease the move timer
	moveTimer --;
}

//Check for a direction changer and chamge image rotation to match it
function EnemyFishCheckDirectionChanger(){
	
	//check for a collision with a direction changer
	var dirChanger = collision_point(x,y,oEnemyDirectionChanger,0,1);

		//if there is a collision with a direction changer
		if (dirChanger != noone){
			//set the image rotation to match the rotation of the direction changer
			image_angle = dirChanger.image_angle;
		}
}

//Setup the variables used by the goo block
function EnemyGooBlockVariableSetup(){
	//get the tile cell position at our current xy position
	xx = tilemap_get_cell_x_at_pixel(tilemap, x, y);
	yy = tilemap_get_cell_y_at_pixel(tilemap, x, y);

	//set that cell to a solid tile
	tilemap_set(tilemap, 1, xx, yy);

	//snap the block to the exact position of the tile cell
	x = xx*TILE_SIZE;
	y = yy*TILE_SIZE;

	//begin playing the sprite animation
	image_speed = 1;
	//if we are currently shaking
	shaking = 0;
	//duration of the shaking
	shakeTime = 30;
	//how far to the side we have moved while shaking
	shakeOffsetX = 0;
	//time between shakes
	shakeCooldown = 2;
	//time until next shake
	shakeTimer = 0;
	//time the goo block will last
	blockTime = 480;
	//time until the goo block starts shaking
	shakeTime = 360;
}

//check if its time to move the goo block to the next state and change states
function EnemyGooBlockStateCheck(){
	//if there is still time until the block disappears 
	if (blockTime > 0){
		//if the time to shake has run out, start shaking
		if (shakeTime <= 0) shaking = 1;
	}
	//if the time the block lasts has run out
	else{
		//create a goo enemy in the same position
		instance_create_layer(x+8,y+8,"Enemies",oGoo);
		//destroy the goo block
		instance_destroy();
	}
}

//decrease time until the next goo block state change
function EnemyGooBlockStateTimeDecrease(){
	//decrease time till block disappears
	blockTime --;
	//decrease time till the shaking starts
	shakeTime --;
}

//Shake the Good Block if in the shake state
function EnemyGooBlockShake(){
	
	//if the block is shaking
	if (shaking){
			//if the shake timer runs out
			if (shakeTimer <= 0){
				//switch the x offset 
				if (shakeOffsetX == 1) shakeOffsetX = -1;
				else shakeOffsetX = 1;
				//set the x position to the offset
				x = x+shakeOffsetX;
				//Reset the shake timer
				shakeTimer = shakeCooldown;
			}
			//if the shake timer has not run out, decrease it
			else shakeTimer --;
		}
}

//Empty the cell tile when the goo block is destroyed
function EnemyGooBlockDestroy(){
	tilemap_set(tilemap, 0, xx, yy);
}

//