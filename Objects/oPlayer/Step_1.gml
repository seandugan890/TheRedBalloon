/// @description Player Input / Movement / Collisions / Animations


// -- GET INPUT FROM KEY BINDINGS

//if the camera is following the playing and locked on, give the player control
if CameraCheckFocus(oPlayer) hascontrol = 1;
//otherwise disable control
else hascontrol = 0;

//if the player has control over the character
if (hascontrol) PlayerGetInput();
//if the player does NOT have control of the character	
else PlayerResetInput();
	

// -- PLAYER CHAR HORIZONTAL MOVEMENT

hsp = PlayerHorizontalMovement(walksp);

// -- PLAYER VERTICAL MOVEMENT

//decrease our available time to jump
PlayerDecreaseJumpTime()

//set the players terminal velocity depending on if they have the balloon or not
terminalVelocity = PlayerSetTerminalVelocity();

//if jump time hasnt run out and the jump key is pressed, start jumping
if (key_up){
	PlayerJump();
}

// -- PLAYER WITH BALLOON

//get the max height the balloon can go before hitting a tile
balloonMaxCeiling = PlayerBalloonGetMaxCeiling();

//if the character has the balloon
if (hasBalloon){

	//set the balloon to max height if too high
	balloonCurrentY = PlayerBalloonSetToMaxHeight(balloonCurrentY);

	//set the players floating state based on balloon height
	PlayerSetBalloonFloat(balloonCurrentY)
	
	//set the balloons current y position 
	balloonCurrentY = PlayerBalloonSetPositionY(balloonCurrentY);
	
	//set the balloons current x position 
	balloonCurrentX = PlayerBalloonSetPositionX(balloonCurrentX);
		
	//check if the balloon is in a gust and set the appropriate behaviour
	PlayerBalloonEnterGust(balloonCurrentX,balloonCurrentY);
	
	//check if the player is in water with the balloon and set the appropriate behaviour
	PlayerBalloonWaterCollision()
	
	//check if the held balloon is colliding with a world object and set the appropriate action
	PlayerBalloonCollideWithWorldObjects();
	
}
//if the character does not have the balloon
else{
	//Reset variables if the player does not have the balloon
	PlayerSetNoBalloon();	
	//check if the player has gone too far from the balloon and set appropriate action
	PlayerCheckAbandonBalloon();
}

//if the pllayer pressed the activate key
if (key_activatePressed){
	//check if there is a hook at the player position and put the ballon on the hook or take it off
	PlayerCheckBalloonOnHook();
}

//check if there is a balloon just above the player and if so grab it
PlayerPickupBalloon();

//decrease the time until the player can pickup the balloon
PlayerSetBalloonPickupTimer();


// -- PLAYEER WITH PICKAXE 

//if we have pressed the left mouse key (or controller button)
if (mouse_left_pressed) or (mouse_left_held){
	//if we have the pickaxe in hand
	if (hasPickaxe){
		//enable the throw direction display
		showThrowDirection = 1;
	}
	//if we do not have the pickaxe
	else{
		//set the players pickaxe to return to the player
		PlayerSetPickaxeReturn()
	}
}

//if we have released the left mouse key (or controller button)
if (mouse_left_released) && (throwcooldown <= 0){
	//declare that we are no longer holding the mouse button
	mouse_left_held = 0;
	//if we are holding the pickaxe
	if (hasPickaxe){
		//Creates a thrown pickaxe and takes the pickaxe from the player
		PlayerThrowPickaxe();
	}
}

//player picks up the pickaxe if standing on it
PlayerPickupPickaxe();

//decrease the time until we can pickup the pickaxe
PlayerDecreasePickaxeTimer()


// -- PLAYER COLLISIONS

//handle character tile collisions
SolidCollisions();

//check if the player is falling and set the appropriate action
PlayerCheckfalling()

//check if the player is colliding with a world object and set the appropriate action
PlayerCollideWithWorldObjects();

// -- ANIMATION

//sets the way a characters sprite is facing based on our x axis movement
SetImageDirection(x,xprevious);

//if character is falling
if (falling){
	//set the players sprite animation when falling
	PlayerSetSpriteFalling();
}
//if character is not falling
else{
	//if character is standing still stop and reset animation
	if hsp = 0 {
		//set the players sprite animation when idle
		PlayerSetSpriteIdle();
	}
	//if character is moving let the animation play
	else {
		//set the players sprite animation when moving
		PlayerSetSpriteMove()
	}
}

