///@description Initial Setup

#region // -- CHARACTER VARIABLES


//Gravity applied to the character per step in pixels
grv = 0;

//terminal velocity of the character (pixels per step)
terminalVelocity = 2;

//horizontal speed of the character (<0 left, 0 none, >0 right)
hsp = 0;
//vertical speed of the character (<0 up, 0 none, >0 down)
vsp = 0;

//if we have just landed
landed = 0;

//speed of the character's animation (1 default)
animation_speed = 1;

//The walking speed of the character in pixels (multiplied by hsp to get total pixel movement)
walksp = 0;

//cooldown for movement
moveCooldown = 0;

//time till next movement
moveTimer = 0;

//range at which character will move toward the player
aggroRange = 30;

CreateDialogue_BalloonLetGo();
CreateDialogue_BalloonGust();

#endregion




//ROPE

offset_y = (sprite_height/2-2);
host = self;

next_rope = instance_create_layer(x-1,y+offset_y,"Instances",oBalloonRope);

attachBalloon = physics_joint_distance_create(host, next_rope, host.x-1, host.y+offset_y, next_rope.x, next_rope.y, false);
physics_joint_set_value(attachBalloon, phy_joint_damping_ratio, 0.1);
physics_joint_set_value(attachBalloon, phy_joint_frequency, 10);

with (next_rope){
	parent = other.id;
}

repeat (8){
	//
	offset_y+=1;
	last_rope = next_rope;
	next_rope = instance_create_layer(x,y+offset_y,"Instances",oBalloonRope);
	
	link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, true);
	physics_joint_set_value(link, phy_joint_damping_ratio, 2);
	physics_joint_set_value(link, phy_joint_frequency, 10);
	physics_joint_set_value(link, phy_joint_max_length, 1);
	
	with(next_rope){
		parent = other.last_rope;
	}
}

var chnc = 0;
if (!chnc){
	currentText = CreateTextBubble(self,0,10,text_letGo[irandom(textCount_letGo)],c_ltred,45,fa_center);
}