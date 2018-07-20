return Def.ActorFrame{
	LoadActor("../_mtrain bg"),
	LoadActor("../_progress bar"),

	LoadActor("../border.png")..{ OnCommand=cmd(Center); };
}
