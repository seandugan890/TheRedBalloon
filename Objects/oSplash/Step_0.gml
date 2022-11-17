/// @desc Move

x +=hsp;
y +=vsp+grav;

hsp*=0.9;
vsp*=0.9;

if position_meeting(x,y,oWater) instance_destroy();