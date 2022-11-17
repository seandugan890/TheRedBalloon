draw_sprite(sExitDoor,open,x,y);

if (!open){
	draw_sprite_ext(sExitDoorEye,0,x+halfWidth-8,y+halfHeight-2,1,1,eyeAngle,c_white,1);
	draw_sprite_ext(sExitDoorEye,0,x+halfWidth+8,y+halfHeight-2,1,1,eyeAngle,c_white,1);
	draw_sprite_ext(sExitDoorEyeLid,0,x+halfWidth-8,y+halfHeight-3,1,1,0,c_white,1);
	draw_sprite_ext(sExitDoorEyeLid,0,x+halfWidth+8,y+halfHeight-3,-1,1,0,c_white,1);
}
