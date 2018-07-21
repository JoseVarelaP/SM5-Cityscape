return Def.ActorFrame{
	LoadActor("../_mtrain bg blur"),
	LoadActor("../_aurora"),

	Def.Quad{ OnCommand=cmd(FullScreen;diffuse,0,0,0,1;sleep,10.2;accelerate,3;diffusealpha,0.5;decelerate,3;diffusealpha,0.5); };

	LoadActor("sm4")..{ OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,0.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,3.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0); };
	LoadActor("squeaky")..{ OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,5.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,3.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0); };
	LoadActor("cityscapecolor")..{ OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;sleep,9.7;accelerate,1.5;diffusealpha,0.5;decelerate,1.5;diffusealpha,1;sleep,6.3;accelerate,1;diffusealpha,0.0;); };

	LoadActor("../border");
}

-- [BGAnimation]
-- LengthSeconds=28

-- [Layer1]
-- Import=../_mtrain bg blur

-- [Layer2]
-- Import=../_aurora

-- [Layer7]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../_black.png
-- Command=x,320;y,240;diffusealpha,1;zoomtowidth,640;zoomtoheight,480;diffusealpha,1;sleep,10.2;accelerate,3;diffusealpha,0.5;decelerate,3;diffusealpha,0.5

-- [Layer8]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=sm4.png
-- Command=x,320;y,240;zoom,0.5;diffusealpha,0;sleep,0.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,3.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0

-- [Layer9]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=squeaky.png
-- Command=x,320;y,240;zoom,0.5;diffusealpha,0;sleep,5.7;accelerate,0.4;diffusealpha,0.6;decelerate,0.4;diffusealpha,1;sleep,3.0;accelerate,0.3;diffusealpha,0.5;decelerate,0.3;diffusealpha,0

-- [Layer11]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=cityscapecolor.png
-- Command=x,320;y,230;zoom,0.5;diffusealpha,0;sleep,9.7;accelerate,1.5;diffusealpha,0.5;decelerate,1.5;diffusealpha,1;sleep,6.3;accelerate,1;diffusealpha,0.0;

-- [Layer12]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../border.png
-- Command=


