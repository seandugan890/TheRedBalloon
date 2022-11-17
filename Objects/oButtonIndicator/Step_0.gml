/// @description Insert description here

//if the trigger action is reversed
if (reversed){
	if (trigger.pressed) image_index = 1;
	else image_index = 0;
}
//if the trigger action is not reversed
else{
	if (trigger.pressed) image_index = 0;
	else image_index = 1;
}
