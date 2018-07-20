return Def.ActorFrame{
	Def.Quad{
    OnCommand=cmd(CenterX;y,SCREEN_BOTTOM-20;zoomto,616,8;vertalign,bottom;cropright,0.007;zwrite,1;blend,"BlendMode_NoEffect")
    };

    Def.SongMeterDisplay{
		OnCommand=cmd(Center;y,SCREEN_BOTTOM-15;vertalign,bottom;ztest,1);
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