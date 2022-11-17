/// @description Insert description here
var i = 0;

if (active){
	repeat(sprite_width){
		var lyr;
		if (introPlayed) lyr = layer_get_id("Particles");
		else lyr = layer_get_id("TextBubble");
		with instance_create_layer(x+i,bbox_bottom,lyr,oFireParticle){
			targetY = other.bbox_top;
			targetX = other.x+other.sprite_width/2;
			fireParticleSpeed = random_range(0.2,0.5);
			fade = random_range(1,0.7);
			rotation = 0;
			rotationSpeed = 20;
			image_speed = 0
			image_index = irandom(image_number-1);
			alarm[0] = 8;
		}
		i ++;
	}
}

alarm[0] = fireParticleAlarm;