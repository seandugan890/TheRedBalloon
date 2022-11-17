///@description Initial Setup

debugSwitch = 0;

CharacterVariableSetup();


#region // -- CHARACTER VARIABLES

floatJumpVelocity = 1;

regJumpVelocity = 2;

//Gravity applied to the character per step in pixels
//---grv = 0.1;

//terminal velocity of the character (pixels per step)
terminalVelocity = regJumpVelocity;

//terminal velocity when going up (pixels per step)
terminalLiftSpeed = 8;


floatJumpSpeed = 3;

regJumpSpeed = 2;

//the speed of the gust when we're holding the balloon
gustSpeed = 2;

//jumping speed of the character in pixels
jumpsp = regJumpSpeed;

jumping = 0;

//if the player can jump
canjump = 0;

//number of steps the player has to jump after falling off an edge
jumpbuffer = 10;

//the direction the characters weapon arm is currently aiming (0 right, 90 up, 180 left, 270 down)
aim_angle = 45;

//if the character is holding the balloon
hasBalloon = 1;

//whether or not we're floating
playerFloat = 0;

//if the character is holding the pickaxe
hasPickaxe = 1;

//the speed the player throws the axe
pickaxeThrowSpeed = 4;

throwcooldown = 10;

gustsoundPlayed = 0;

//how far the pickaxe can travel
pickaxeThrowRange = 256;

//the speed the axe returns to the player
pickaxeReturnSpeed = 4;

//the unique id of the axe instance
axe_id = noone;

//if the throw direction display is showing (boolean)
showThrowDirection = 0;

//if we are holding the left mouse button
mouse_left_held = 0;

//if we are floating on the water
balloonWaterFloat = 0;

balloonWaterFloatSpeed = 0.2;

MaxDistFromBalloon = 300;

#endregion


#region // -- CHARACTER ANIMATION

//sprite used for the characters body
sprite_body = sDwarf_body_idle;

//sprite used for the characters body
sprite_water = sDwarf_balloonSwim;

//sprite used for the characters head
sprite_head = sDwarf_head;

//the current frame of the head sprite
headFrame = 0;

//the time until the head will blink
headBlinkTimer = 0;

//the time between head blinks
headBlinkCooldown = 60;

//the length of the blink
headBlinkDuration = 10;

//sprite used for the characters Balloon Arm (left)
sprite_BA = sDwarf_BA_idle;

//sprite used for the characters Pickaxe Arm (right)
sprite_PA = sDwarf_PA_idle;

//the x offset from the origin of the character when drawing the pickaxe arm
drawPickaxeArm_xoffset = 4;

//the y offset from the origin of the character when drawing the pickaxe arm
drawPickaxeArm_yoffset = -1;

#endregion

#region // -- PICKAXE THROW/RETURN DISPLAY

//max distance (in pixels) away from the character to show pickaxe throw markers
drawPickaxeDisplay_minDistance = 8;

//how far the markers have traveled
drawPickaxeDisplay_markerMove = 0;

//max distance markers can travel
drawPickaxeDisplay_markerMoveMax = 16;

//rate (in pixels) at which markers move per step
drawPickaxeDisplay_markerMoveRate = 0.2;

#endregion

#region // -- HELD BALLOON 

//the current x position of the balloon
balloonCurrentX = x;

//the current y position of the balloon
balloonCurrentY = y-32;

//the max height ( in pixels) the balloon can float above the character
balloonMaxHeight = 32;

//the height the ballon is blocked at veritcally
balloonMaxCeiling = balloonMaxHeight;

//the offset point from the characters postion on the x axis where the ballon should float to
balloonTargetXOffset = -8;

balloonMaxDistance_h_ground = 4;

balloonMaxDistance_h_air = 4;

//the max distance horizontally the balloon can drift from the character
balloonMaxDistance_h = balloonMaxDistance_h_ground;

//the max distance vertically the balloon can drift from the character
balloonMaxDistance_v = 16;

//speed the balloon will go to drift back into place horizontally
balloonDriftSpeed_h = 0.2;

//speed the balloon will go to drift back into place veritically
balloonDriftSpeed_v = 0.4;

//speed the balloon will go to fall down to avoid an upcoming roof
balloonFallSpeed = 0.5;

//half of the width (in pixels) of the balloon sprite
balloonWidthHalf = sprite_get_width(sBalloon)/4;

//half of the height (in pixels) of the balloon sprite
balloonHeightHalf = sprite_get_height(sBalloon)/2;

balloonPickupCooldown = 60;

balloonPickupTimer = 0;

balloonH_diff = 0;

instance_create_layer(balloonCurrentX-2, balloonCurrentY+balloonHeightHalf-2, "Instances",oRopeAnchor_balloon);

#endregion

//LINES
currentText = noone;
CreateDialogue_HammerReturned();
CreateDialogue_BalloonGrab();

