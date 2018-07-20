return Def.ActorFrame{
	LoadActor("_mtrain bg blur"),
	LoadActor("_aurora"),
	LoadActor("_progress bar"),

	LoadActor("2")..{
	OnCommand=cmd(zoom,0.5;Center;y,20;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1;glowshift;);
	};

	LoadActor("border.png")..{ OnCommand=cmd(Center); };

};