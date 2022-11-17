function CreateTextBubble(textOwner,ownerOffsetX,ownerOffsetY,bubbleText,textColor,duration,TextOrientation){
	
	var obj;
		//create text bubble
		obj = instance_create_layer(textOwner.x+ownerOffsetX,textOwner.y+ownerOffsetY,"TextBubble",oTextBubble);
		with (obj){
			orientation = TextOrientation;
			owner = textOwner;
			offsetX = ownerOffsetX;
			offsetY = ownerOffsetY;
			text = bubbleText;
			color = textColor;
			readTime = duration;
		}
	return obj;
}
