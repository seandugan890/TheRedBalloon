//BEGIN STEP EVENT

/// @description Enemy Behavior

var move;
//set movement direction to follow the player
move = EnemyFollowPlayer();

//set speed based on movement direction
EnemySetMovement(move)

SolidCollisions();

//check for collision with a direction changer and if so set patrol direction
EnemyCheckPatrolDirection()

//check if enemy is hit with the pickaxe and if so set alarm for enemy death
EnemyCheckHit()

//set the animation for the enemy
EnemyAnimation(move);