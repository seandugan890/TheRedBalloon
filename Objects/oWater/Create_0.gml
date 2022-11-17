/// @description Insert description here

event_inherited();

image_alpha = 1;
transparencyBufferHeight = 4 //4
springCount = ceil(sprite_width/WATERDIVISION);
springs[springCount] = 0;
springsVelocity[springCount] = 0;
springDeltaL[springCount] = 0;
springDeltaR[springCount] = 0;
k = 0.035;
d = 0.025;
spread = 0.25;

alarm[0] = 60;