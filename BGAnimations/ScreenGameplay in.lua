return Def.ActorFrame{
	OnCommand=cmd(linear,0.5;diffusealpha,0);

	Def.ActorFrame{

	LoadSongBackground()..{
	OnCommand=cmd(diffusealpha,0.7;linear,0.7;diffusealpha,0);
	};

	LoadActor("border");

	};
}