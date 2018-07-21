return Def.ActorFrame{
LoadActor("Main")..{ OnCommand=cmd(Center;zoomtowidth,SCREEN_WIDTH-54); };
	LoadActor("SideLeft")..{ OnCommand=cmd(CenterY;x,SCREEN_LEFT;horizalign,left); };
	LoadActor("SideRight")..{ OnCommand=cmd(CenterY;x,SCREEN_RIGHT;horizalign,right); };
}