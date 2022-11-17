/// @description Insert description here

//if the trigger action is reversed
if (reversed){
	if (trigger.pressed) active = 1;
	else active = 0;
}
//if the trigger action is not reversed
else{
	if (trigger.pressed) active = 0;
	else active = 1;
}