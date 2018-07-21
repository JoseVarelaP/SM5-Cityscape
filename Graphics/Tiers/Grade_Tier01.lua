return Def.ActorFrame{
	LoadActor("Grades")..{
	OnCommand=cmd(pause;setstate,0);
	};
}