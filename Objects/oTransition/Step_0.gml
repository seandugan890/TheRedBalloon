/// @description Insert description here

/// @description Progress the transition

#region // -- ROOM TRANSITION

//if there is a transition happening
if (mode != TRANS_MODE.OFF)
	{
		#region // -- SET TRANSITION STAGE
		
		//handle transition
		if (mode == TRANS_MODE.INTRO)
			{
				percent = max(0,percent - max((percent/10),0.005));
			}
		else
			{
				percent = min((1+overlap),percent + max((((1+overlap) - percent)/10),0.005));
			}
			
		#endregion
		
		//if transition complete
		if (percent == (1+overlap)) || (percent == 0)
			{
				#region // -- TRANSITION OUTCOMES
				
				switch (mode)
					{
						//if done with intro tranition, switch mode off
						case TRANS_MODE.INTRO:
							{
								mode = TRANS_MODE.OFF;
								break;
							}
						//if done with next tranition, reset to intro tranition and move to next room
						case TRANS_MODE.NEXT:
							{
								mode = TRANS_MODE.INTRO;
								room_goto_next();
								break;
							}
						//if done with goto tranition, reset to intro tranition and move to target room
						case TRANS_MODE.GOTO:
							{
								mode = TRANS_MODE.INTRO;
								room_goto(target);
								break;
							}
						//if done with restart tranition, restart the game
						case TRANS_MODE.RESTART:
							{
								room_restart();
								break;
							}
					}
					#endregion
			}
	}
	
#endregion
	