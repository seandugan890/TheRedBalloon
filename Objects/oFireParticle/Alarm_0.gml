/// @description Insert description here
var offset;

if (x > targetX) offset = choose(-1,-1,0,0,1);
if (x < targetX) offset = choose(1,1,0,0,-1);
if (x = targetX) offset = choose(-1,0,0,1);

x += offset;

alarm[0] = 4;