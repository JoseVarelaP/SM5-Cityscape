return Def.ActorFrame{
	OnCommand=cmd(Center);
	LoadActor("1")..{ OnCommand=cmd(zoom,0.78;customtexturerect,0,0,2,1;zoomx,2;texcoordvelocity,0.02,0;); };
	LoadActor("2")..{ OnCommand=cmd(zoom,0.78;customtexturerect,0,0,2,1;zoomx,2;texcoordvelocity,-0.01,0;); };
	LoadActor("3")..{ OnCommand=cmd(zoom,0.78;customtexturerect,0,0,2,1;zoomx,2;texcoordvelocity,-0.02,0;); };
}