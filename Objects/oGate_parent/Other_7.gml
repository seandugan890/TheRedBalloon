/// @description Insert description here

//if opening
if (image_speed = 1) image_index = 4;
else{
	
	if (image_speed != 0){
		for (i=0; i<sprite_width; i+=2;)
			CreateDust(x+i,bbox_bottom,1,-1,1,-0.1,0.1);
	}
	image_index = 0;
}

image_speed = 0;