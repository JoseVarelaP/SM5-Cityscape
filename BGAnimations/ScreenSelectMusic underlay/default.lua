return Def.ActorFrame{
	LoadActor("MainFrame")..{
	OnCommand=cmd(Center;zoom,1.44);
	};
}