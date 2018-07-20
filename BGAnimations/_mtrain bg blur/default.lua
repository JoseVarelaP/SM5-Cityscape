return Def.ActorFrame{
	OnCommand=cmd(Center;zoom,WideScale(1,1.2));
	LoadActor("bg.png")..{ OnCommand=cmd(zoom,1.2;vibrate;effectmagnitude,2,2,2) },
	LoadActor("bg.png")..{ OnCommand=cmd(zoom,1.2;sleep,0.1;diffusealpha,0.5;vibrate;effectmagnitude,3,3,3) },
	LoadActor("bg.png")..{ OnCommand=cmd(zoom,1.2;fadeleft,0.2;faderight,0.2;diffusealpha,0.7) },
	LoadActor("bgtop.png")..{ OnCommand=cmd(zoom,1.2) },

	LoadActor("bgtr.png")..{ OnCommand=cmd(zoom,0.55;queuecommand, "Loop");
	LoopCommand=cmd(xy,0,0;linear,0.1;xy,2,1;linear,0.1;xy,0,0;sleep,0.001;queuecommand, "Loop");
	},
}