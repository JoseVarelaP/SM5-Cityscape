return Def.ActorFrame{
	LoadActor("../_mtrain bg blur"),
	LoadActor("../_aurora"),
	--LoadActor("../_hexagon"),
	LoadActor("../_progress bar"),

	LoadActor("../1")..{
	OnCommand=cmd(zoom,0.5;Center;y,20;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1;glowshift;);
	};

	LoadActor("popup_glow")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1);
	};

	LoadActor("popup_back")..{
	OnCommand=cmd(Center;zoom,0.5;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1);
	};

	LoadActor("cityscape")..{
	OnCommand=cmd(x,480;y,350;zoom,0.5;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1);
	};

	LoadActor("../border");
}

-- [BGAnimation]
-- LengthSeconds=10	// doesn't matter

-- [Layer1]
-- Import=../_mtrain bg blur

-- [Layer2]
-- Import=../_aurora

-- [Layer3]
-- Import=../_hexagon

-- [Layer8]
-- Import=../_progress bar1

-- [Layer9]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../1.png
-- Command=zoom,0.5;x,320;y,20;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1;glowshift;


-- [Layer10]
-- File=popup_back2.png
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- Command=x,320;y,240;zoom,0.5;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1

-- [Layer11]
-- File=popup_back.png
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- Command=x,320;y,240;zoom,0.5;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1

-- [Layer12]
-- File=cityscape.png
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- Command=x,480;y,350;zoom,0.5;diffusealpha,0;accelerate,0.4;diffusealpha,0.5;decelerate,0.4;diffusealpha,1

-- [Layer13]
-- File=../border.png
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- Command=x,320;y,240;

