///This is where all functions to create particles are stored


///CreateDust(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax)
function CreateDust(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax){
	//repeat for the amount specificed 
	repeat(amount){
		//create dust on the particle layer and give it random speed within our parameters
		with instance_create_layer(xx,yy,"Particles",oDust){
			hsp = random_range(horSpeedMin,horSpeedMax);
			vsp = random_range(verSpeedMin,verSpeedMax);
		}
	}
}

///CreateSplash(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax)
function CreateSplash(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax){
	//repeat for the amount specificed 
	repeat(amount){
		//create splash on the particle layer and give it random speed within our parameters
		with instance_create_layer(xx,yy,"Particles",oSplash){
			hsp = random_range(horSpeedMin,horSpeedMax);
			vsp = random_range(verSpeedMin,verSpeedMax);
		}
	}
}

///CreateTears(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax)
function CreateTears(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax){
	//repeat for the amount specificed 
	repeat(amount){
		//create tears on the particle layer and give it random speed within our parameters
		with instance_create_layer(xx,yy,"TextBubble",oTears){
			hsp = random_range(horSpeedMin,horSpeedMax);
			vsp = random_range(verSpeedMin,verSpeedMax);
		}
	}
}

///CreateBalloonPieces(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax)
function CreateBalloonPieces(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax){
	//repeat for the amount specificed 
	repeat(amount){
		//create balloon pieces on the particle layer and give it random speed within our parameters
		with instance_create_layer(xx,yy,"Particles",oBalloonPieces){
			hsp = random_range(horSpeedMin,horSpeedMax);
			vsp = random_range(verSpeedMin,verSpeedMax);
		}
	}
}

///CreateChunk(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax)
function CreateChunk(xx,yy,amount,horSpeedMin,horSpeedMax,verSpeedMin,verSpeedMax){
	//repeat for the amount specificed 
	repeat(amount){
		//create chunk piece on the particle layer and give it random speed within our parameters
		with instance_create_layer(xx,yy,"Particles",oChunk){
			hsp = random_range(horSpeedMin,horSpeedMax);
			vsp = random_range(verSpeedMin,verSpeedMax);
		}
	}
}