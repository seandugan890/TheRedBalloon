/// @description Insert description here

if (active){
	repeat(sprite_height/16){
		with instance_create_layer(bbox_right,y+irandom(sprite_height), "Particles",oGustParticle){
			sideways = 1;
			targetX = other.bbox_left;
			targetY = y;
			gustParticleSpeed = random_range(2,4);
			fade = random_range(0.2,1);
		}
	}
}

alarm[0] = gustParticleAlarm;