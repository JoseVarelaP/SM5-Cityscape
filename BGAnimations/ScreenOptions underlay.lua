return Def.ActorFrame{
	LoadActor( THEME:GetPathG("ScreenOptionsSubmenu","page") )..{
	OnCommand=cmd(Center;zoom,1.1;diffusealpha,0;decelerate,0.5;zoom,1;diffusealpha,1);
	};
}