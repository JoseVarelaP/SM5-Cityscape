return Def.ActorFrame{
	-- remove 0
	Def.Quad{ OnCommand=cmd(sleep,29;queuecommand,"ReturnToTitle");
	ReturnToTitleCommand=function(self)
	SCREENMAN:SetNewScreen("ScreenTitleMenu")
	end,
	};
	LoadActor("../_mtrain bg");

	Def.Quad{ OnCommand=cmd(zoomto,SCREEN_WIDTH,5;CenterX;y,130); };
	Def.Quad{ OnCommand=cmd(zoomto,SCREEN_WIDTH,5;CenterX;y,350); };

	Def.Quad{ OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,220;diffuse,0,0,0,0.75); };

	LoadActor("thanksto")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,0.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,1.0;accelerate,0.3;addy,-45;zoom,0.35;decelerate,0.3;addy,-45;zoom,0.2;sleep,2.5;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	LoadActor("others")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,2.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,2.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	LoadActor("music")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,8.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,1.0;accelerate,0.3;addy,-45;zoom,0.35;decelerate,0.3;addy,-45;zoom,0.2;sleep,6.5;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	LoadActor("as")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,10.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,2.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	LoadActor("artists")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,14.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,2.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	LoadActor("abouttheme")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,18.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,3.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	LoadActor("ddrmx")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,22.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,3.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0);
	};

	Def.Quad{ OnCommand=cmd(FullScreen;diffuse,0,0,0,0;sleep,27;linear,1;diffuse,Color.Black); };

	LoadActor("../border");
}
