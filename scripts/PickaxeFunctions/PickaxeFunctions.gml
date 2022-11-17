// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//set pickaxe behaviour after hitting an enemy
function PickaxeHitEnemy(){
	flying = 0;
	spd = 0;
	adjusting = 1;
	audio_play_sound(sndHammerHitEnemy, 10, false);
	CreateDust(x,y,5,-1,1,-1,1);
	if instance_exists(currentText) with(currentText){instance_destroy()};
	var chnc = irandom(1)
	if (!chnc) currentText = CreateTextBubble(self,0,-16,text_hitEnemy[irandom(textCount_hitEnemy)],c_black,45,fa_center);
}

//set pickaxe behaviour after hitting an enemy shield
function PickaxeHitShield(){
	x = xprevious;
	flying = 0;
	spd = 0;
	adjusting = 1;
	hitShield = 1;
	audio_play_sound(sndHammerHitWall, 10, false);
	CreateDust(x,y,5,-1,1,-1,1);
}