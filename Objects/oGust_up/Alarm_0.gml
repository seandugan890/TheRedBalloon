/// @description Insert description here

if (active){
	repeat(sprite_width/16){
		with instance_create_layer(x+irandom(sprite_width),bbox_bottom, "Particles",oGustParticle){
			sideways = 0;
			targetX = x;
			targetY = other.bbox_top;
			gustParticleSpeed = random_range(2,4);
			fade = random_range(0.2,1);
		}
	}
}

alarm[0] = gustParticleAlarm;