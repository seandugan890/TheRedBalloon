/// @description Insert description here

//if the trigger action is reversed
if (reversed){
	if (trigger.pressed) image_speed = 0;
	else image_speed = 1;
}
//if the trigger action is not reversed
else{
	if (trigger.pressed) image_speed = 1;
	else image_speed = 0;
}
