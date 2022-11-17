/// @description Insert description here

if (hasBalloon){
	if (balloonCurrentX < balloonTargetX) balloonCurrentX += 1;
	if (balloonCurrentX > balloonTargetX) balloonCurrentX -= 1;
	if (balloonCurrentY < balloonTargetY) balloonCurrentY += 1;
	if (balloonCurrentY > balloonTargetY) balloonCurrentY -= 1;
}