return Def.ActorFrame{
	
	LoadSongBackground()..{
	OnCommand=cmd(diffusealpha,0;linear,0.7;diffusealpha,1);
	};

	LoadActor("../border");

	Def.ActorFrame{
	OnCommand=cmd(sleep,4.5;linear,0.5;diffusealpha,0);
		Def.Quad{ OnCommand=cmd(sleep,5); };
		Def.Quad{ OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,490;diffuse,0,0,0,1); };
		Def.Quad{ OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,200;diffuse,0,0,0,1;x,SCREEN_CENTER_X;y,464); };
		LoadActor("../static1")..{
		OnCommand=cmd(Center;diffusealpha,0;sleep,0.6;linear,0.4;diffusealpha,0.5;vibrate;effectmagnitude,1,1,0);
		};
	
		LoadActor("../_orange")..{
		OnCommand=cmd(Center;diffusealpha,0.0;zoomtowidth,SCREEN_WIDTH;zoomtoheight,75;accelerate,0.3;diffusealpha,0.1;decelerate,0.3;diffusealpha,0.2);
		};
	
		LoadActor("../_orange")..{
		OnCommand=cmd(Center;y,202.5;diffusealpha,0.5;zoomtowidth,SCREEN_WIDTH;zoomtoheight,2;cropright,1;linear,0.6;cropright,0);
		};
	
		LoadActor("../_orange")..{
		OnCommand=cmd(Center;y,277.5;diffusealpha,0.5;zoomtowidth,SCREEN_WIDTH;zoomtoheight,2;cropleft,1;linear,0.6;cropleft,0);
		};
	
		LoadActor("../border");
	
		LoadFont("Common Normal")..{
		Text=GAMESTATE:GetCurrentSong():GetDisplayMainTitle(),
		OnCommand=cmd(x,SCREEN_RIGHT-30;y,SCREEN_CENTER_Y+(225-240);horizalign,right;diffusealpha,0;zoom,0.9;linear,0.3;diffusealpha,1;shadowlength,0;)
		};
	
		LoadFont("Common Normal")..{
		Text=GAMESTATE:GetCurrentSong():GetDisplayArtist(),
		OnCommand=cmd(x,SCREEN_RIGHT-30;y,SCREEN_CENTER_Y+(255-240);horizalign,right;diffusealpha,0;zoom,0.75;linear,0.3;diffusealpha,1)
		};
	};
}