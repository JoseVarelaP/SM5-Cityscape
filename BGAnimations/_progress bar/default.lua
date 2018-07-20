return Def.ActorFrame{
	LoadActor("back")..{ OnCommand=cmd(zoom,0.5;Center;y,20); };
	LoadActor("../stripes")..{ OnCommand=cmd(Center;zoom,0.5;y,14;customtexturerect,0,0,1,1;texcoordvelocity,-0.06,0;diffusealpha,0.2); };
}

-- [BGAnimation]
-- LengthSeconds=25

-- [Layer1]
-- Type=1		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=back.png
-- Command=zoom,0.5;x,320;y,20;diffusealpha,1

-- [Layer2]
-- Type=3		// 0=sprite, 1=stretch, 2=particles, 3=tiles
-- File=../stripes.png
-- TilesStartY=14
-- TileVelocityX=-60
-- TileVelocityY=0
-- TilesSpacingY=10000
-- TilesSpacingX=613
-- Command=diffusealpha,0.2;zoom,0.5
