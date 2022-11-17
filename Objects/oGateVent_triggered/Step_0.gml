/// @description Insert description here

//if the trigger action is reversed
if (reversed){
	if (trigger.pressed) closed = 1;
	else closed = 0;
}
//if the trigger action is not reversed
else{
	if (trigger.pressed) closed = 0;
	else closed = 1;
}

