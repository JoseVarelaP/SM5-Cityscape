return Def.ActorFrame{
	Def.SongMeterDisplay{
		OnCommand=cmd(Center;y,SCREEN_BOTTOM-13;vertalign,bottom);
        InitCommand=cmd(SetStreamWidth,630;);
        Stream=LoadActor("meter")..{InitCommand=cmd(diffusealpha,1)};
        Tip=LoadActor("tip")..{
            OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,0.6;effectcolor2,1,1,1,1.0);
        };
    };

	LoadActor("MainFrame")..{
	OnCommand=cmd(Center);
	};
}