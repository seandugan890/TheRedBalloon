//BEGIN STEP EVENT

/// @description Enemy Behaviour

//check if its time to move the goo block to the next state and change states
EnemyGooBlockStateCheck();

//decrease time until the next goo block state change
EnemyGooBlockStateTimeDecrease();

//Shake the Good Block if in the shake state
EnemyGooBlockShake();