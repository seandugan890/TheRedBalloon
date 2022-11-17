/// @description Insert description here


//ROPE

offset_y = (sprite_height/2-2);
host = self;

next_rope = instance_create_layer(x-1,y+offset_y,"WorldObjects",oBalloonRope);

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
	next_rope = instance_create_layer(x,y+offset_y,"WorldObjects",oBalloonRope);
	
	link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, true);
	physics_joint_set_value(link, phy_joint_damping_ratio, 2);
	physics_joint_set_value(link, phy_joint_frequency, 10);
	physics_joint_set_value(link, phy_joint_max_length, 1);
	
	with(next_rope){
		parent = other.last_rope;
	}
}