function DwarfDeath() {
	//create dwarf death object and set it to face the same way as the player dwarf
	with instance_create_layer(x,y,"DwarfDeath",oDwarfDeath){
		image_xscale = other.image_xscale;
	}
	//destroy player dwarf object
	instance_destroy();
}


function DwarfAbandonDeath() {
	//create dwarf abandon death object and set it to face the same way as the player dwarf
	with instance_create_layer(x,y,"DwarfDeath",oDwarfAbandonDeath){
		image_xscale = other.image_xscale;
	}
	//destroy player dwarf object
	instance_destroy();
}

function DwarfBalloonDeath() {
	//create dwarf balloon death object and set it to face the same way as the player dwarf
	with instance_create_layer(x,y,"DwarfDeath",oDwarfBalloonDeath){
		image_xscale = other.image_xscale;
	}
	//if a a balloon exits, destroy it
	if (hasBalloon)
	CreateBalloonPieces(balloonCurrentX,balloonCurrentY,40,-4,4,-4,4);
	//destroy player dwarf object
	instance_destroy();
}
