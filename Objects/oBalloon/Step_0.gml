/// @desc Ballloon Movement / Collision


//Check for wind gusts and set the balloons vertical speed 
BalloonSetFloat();

//handle tile collisions
SolidCollisionsNoPipes();

//set the balloons position, balloons string is physics-based so x/y position must be updated in this way
BalloonSetPhysicalPosition(hsp,vsp);

//check for balloon object collisions with world objects
BalloonCollisionWithWorldObjects();
