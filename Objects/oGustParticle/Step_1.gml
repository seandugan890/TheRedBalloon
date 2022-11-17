/// @description Insert description here

if (sideways){
	if (x > targetX) x-=gustParticleSpeed;
	if (x < targetX) x+=gustParticleSpeed;
}
else{
	if (y > targetY) y-=gustParticleSpeed;
	if (y < targetY) y+=gustParticleSpeed;
}

if (distance_to_point(targetX,targetY) < irandom(40)) && (fade > 0){
	fade -= 0.05
}

if (distance_to_point(targetX,targetY) < 4) or (fade == 0) instance_destroy();

