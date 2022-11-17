/// @description Insert description here

//ROPE

offset_y = 0;
host = self;

next_rope = instance_create_layer(x,y+offset_y,"Instances",oRope);

attachBalloon = physics_joint_distance_create(host, next_rope, host.x, host.y, next_rope.x, next_rope.y, false);
physics_joint_set_value(attachBalloon, phy_joint_damping_ratio, 0.01);
physics_joint_set_value(attachBalloon, phy_joint_frequency, 10);

with (next_rope){
	parent = other.id;
}

repeat (6){
	//
	offset_y+=1;
	last_rope = next_rope;
	next_rope = instance_create_layer(x,y+offset_y,"Instances",oRope);
	
	link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, true);
	physics_joint_set_value(link, phy_joint_damping_ratio, 1);
	physics_joint_set_value(link, phy_joint_frequency, 10);
	
	with(next_rope){
		parent = other.last_rope;
	}
}

//offset_y+=1;
playerAnchor = instance_create_layer(x,y+offset_y,"Instances",oRopeAnchor_player);

attachPlayer = physics_joint_distance_create(playerAnchor, next_rope,  playerAnchor.x, playerAnchor.y, next_rope.x, next_rope.y, false);	
//attachPlayer = physics_joint_distance_create(next_rope, playerAnchor, next_rope.x, next_rope.y, playerAnchor.x, playerAnchor.y, false);
physics_joint_set_value(attachPlayer, phy_joint_damping_ratio, 0.01);
physics_joint_set_value(attachPlayer, phy_joint_frequency, 10);