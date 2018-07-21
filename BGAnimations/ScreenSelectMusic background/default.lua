return Def.ActorFrame{
	LoadActor("../_mtrain bg blur"),
	LoadActor("../_aurora"),
	--LoadActor("../_hexagon"),
	LoadActor("../_progress bar"),

	LoadActor("../3.png")..{
	OnCommand=cmd(xy,SCREEN_CENTER_X,20;zoom,0.5;diffusealpha,0;accelerate,0.2;diffusealpha,0.5;decelerate,0.2;diffusealpha,1);
	};

	LoadActor("../border");
}

-- [BGAnimation]
-- LengthSeconds=.5

-- [Layer1]
-- Import=../_mtrain bg blur

-- [Layer2]
-- Import=../_aurora

-- [Layer3]
-- Import=../_hexagon

-- [Layer8]
-- Import=../_progress bar

-- [Layer11]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../3.png
-- Command=x,320;y,20;zoom,0.5;diffusealpha,0;accelerate,0.2;diffusealpha,0.5;decelerate,0.2;diffusealpha,1

-- [Layer12]
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../border.png
-- Command=