/// @desc collision with pickaxe

//if the pickaxe is returning to the player or the pickup timer has ended
if (other.returning) or (other.pickupTimer == 0){
	
	//if the pickaxe is not flying through the air
	hasPickaxe = 1;
	
	//destroy the instance of the thrown axe
	instance_destroy(other);
}