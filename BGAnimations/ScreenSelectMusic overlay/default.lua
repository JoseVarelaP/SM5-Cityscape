local song = GAMESTATE:GetCurrentSong()

return Def.ActorFrame{
	LoadActor("MainFrame")..{
	OnCommand=cmd(Center;zoom,1.44);
	};

	-- Timer
	LoadFont("ScreenSelectMusic total", "time")..{
	Text="00:00.00",
	OnCommand=cmd(x,SCREEN_CENTER_X+(590-320);y,SCREEN_CENTER_Y+15;horizalign,right;zoom,0.7);
	CurrentSongChangedMessageCommand=function(self)
	if GAMESTATE:GetCurrentSong() then
		self:settext( SecondsToMMSSMsMs( GAMESTATE:GetCurrentSong():MusicLengthSeconds() ) )
	end
	end,
	};

	Def.ActorProxy{
	OnCommand=function(self) self:SetTarget( SCREENMAN:GetTopScreen():GetChild("Banner") ) end,
	BeginCommand=cmd(xy,SCREEN_CENTER_X+(387-320),SCREEN_CENTER_Y+(121-240));
	};

	Def.BPMDisplay {
		File=THEME:GetPathF("", "_numbers5");
		Name="BPMDisplay";
		InitCommand=cmd(x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y+15;zoom,0.5;shadowlength,0);
		OffCommand=cmd(diffusealpha,0);
		SetCommand=function(self) self:SetFromGameState() end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
}