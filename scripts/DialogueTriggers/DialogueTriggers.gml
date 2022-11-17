// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialogueTriggers(){

}

//check for a collision with the dialogue trigger
function TriggerDialogue(text,color,alignment){
	//check the trigger for a collision with the player
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,1){

		//if the cinematic (dialogue sccene) hasnt already started
		if (!StartedCinematic){
			//create a text bubble with the triggered dialogue line
			CreateTextBubble(oPlayer,0,-20,text,color,200,alignment);
			//declare the cinematic has started
			StartedCinematic = 1;
		}
	}

}