/// @description Insert description here


if (y > targetY-16) y-=fireParticleSpeed;
if (y < targetY-16) y+=fireParticleSpeed;

if (distance_to_point(targetX,targetY-16) > irandom_range(2,10)){
	fade -= 0.02
}
else fade = 0;

if (distance_to_point(targetX,targetY) < 14) && (image_index == 0) image_index = irandom(image_number-1);

if (fade == 0) instance_destroy();

rotation += rotationSpeed;