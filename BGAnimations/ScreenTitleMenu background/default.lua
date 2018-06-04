return Def.ActorFrame{
	LoadActor("../_mtrain bg"),
	LoadActor("hex1.png")..{ OnCommand=cmd(Center;linear,0.3;glowshift;effectperiod,2;effectmagnitude,0.5,0.5,0.5;); },
	LoadActor("hex2.png")..{ OnCommand=cmd(Center;y,SCREEN_CENTER_Y+(206-240);linear,0.3;glowshift;effectperiod,2;effectmagnitude,0.5,0.5,0.5;); },

	LoadActor("optionsb.png")..{ OnCommand=cmd(Center;zoom,0.5); },
	LoadActor("cityscape.png")..{ OnCommand=cmd(xy,SCREEN_CENTER_X+(178-320),SCREEN_CENTER_Y+(235-240);zoom,.4); },
}
-- [BGAnimation]
-- LengthSeconds=25

-- [Layer1]
-- Import=../_mtrain bg

-- [Layer6]
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../_black.png
-- Command=x,320;y,10;diffusealpha,0.5;zoomtowidth,640;zoomtoheight,20

-- [Layer9]
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=cityscape.png
-- Command=x,178;y,235;zoom,.4;diffusealpha,1.0

-- [Layer10]
-- Type=0		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../border.png
-- Command=

