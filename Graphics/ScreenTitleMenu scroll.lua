local t = Def.ActorFrame {};
local gc = Var("GameCommand");

	t[#t+1] = Def.ActorFrame{
	GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;diffuseshift;effectcolor2,1,0,0,1),
	LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0),
	
		Def.BitmapText{ Font="_shared1", Text="a", },
	};


return t;