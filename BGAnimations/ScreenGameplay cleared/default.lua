return Def.ActorFrame{
	LoadActor("../_mtrain bg blur");
	LoadActor("../_aurora");
	LoadActor("../_hexagon");
	LoadActor("../_progress bar");
	
	Def.Quad{ OnCommand=cmd(Center;diffusealpha,1;linear,2.5;diffusealpha,0;sleep,1.5); };

	LoadSongBackground()..{ OnCommand=cmd(diffusealpha,1;linear,1.4;diffusealpha,0); };

	LoadActor("../ScreenGameplay overlay/MainFrame")..{
	OnCommand=cmd(Center;diffusealpha,1;linear,1.4;diffusealpha,0);
	};

	LoadActor("cleared")..{
	OnCommand=cmd(Center;zoom,0.8;diffusealpha,0;linear,0.8;diffusealpha,1;sleep,1.5;linear,1;diffusealpha,0);
	};

	LoadActor("../border")..{ OnCommand=cmd(Center); };
};