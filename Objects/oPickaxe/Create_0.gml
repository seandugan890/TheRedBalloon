/// @description Insert description here

event_inherited();

//Gravity applied to the character per step in pixels
grv = 0.1;

//terminal velocity of the character (pixels per step)
terminalVelocity = 2;

//horizontal speed of the character (<0 left, 0 none, >0 right)
hsp = 0;
//vertical speed of the character (<0 up, 0 none, >0 down)
vsp = 0;

hitShield = 0;

//if we have just landed (boolean)
landed = 0;

//speed the axe image will roate
axeRotationSpeed = 8;

//if the axe is returning to the player
returning = 0;

//cooldown for returning the axe to the player
returnCooldown = 30;

//time until axe can be returned
returnTimer = returnCooldown;

//cooldown for picking up the axe
pickupCooldown = 60;

//time until axe can be picked up
pickupTimer = pickupCooldown;

//set the origin point of the pickaxe
xOrigin = x;
yOrigin = y;

currentText = noone;

CreateDialogue_HammerHitBLock();

CreateDialogue_HammerHitBreakable();

CreateDialogue_HammerThrow();

CreateDialogue_HammerReturn();

CreateDialogue_HammerHitEnemy();
