/// @description Insert description here

/// @desc Move the waves



for (var i = 0; i <= springCount; i++)
	{
		var _a = -k * springs[i] - d * springsVelocity[i];
		springsVelocity[i] += _a;
		springs[i] += springsVelocity[i];
	}
	
for (var i = 0; i <= springCount; i++)
	{
		if (i > 0)
			{
				springDeltaL[i] = spread * (springs[i] - springs[i-1]);
				springsVelocity[i-1] += springDeltaL[i];
			}
		if (i < springCount)
			{
				springDeltaR[i] = spread * (springs[i] - springs[i+1]);
				springsVelocity[i+1] += springDeltaR[i];
			}
	}