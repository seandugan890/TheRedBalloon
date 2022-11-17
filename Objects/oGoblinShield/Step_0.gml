//BEGIN STEP EVENT

/// @description Enemy Behaviour

var move;
//set movement direction to follow the player
move = EnemyPatrol();

//set speed based on movement direction
EnemySetMovement(move)

SolidCollisions();

//check for collision with a direction changer and if so set patrol direction
EnemyCheckPatrolDirection()

EnemyCheckShieldedBlock(move)

//check if enemy is hit with the pickaxe and if so set alarm for enemy death
EnemyCheckHit()

//set the animation for the enemy
EnemyAnimation(move);