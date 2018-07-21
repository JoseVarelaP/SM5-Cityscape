local t = Def.ActorFrame{};

local song = GAMESTATE:GetCurrentSong()

local function Radar()
	local function set(self,player)
		local Selection = GAMESTATE:GetCurrentSteps(player) or GAMESTATE:GetCurrentTrail(player)
		local Song = GAMESTATE:GetCurrentSong();
		if not Selection or not Song then
			self:SetEmpty( player );
			return
		end
		self:SetFromRadarValues( player, Selection:GetRadarValues(player) );
	end

	local t = Def.GrooveRadar {
		OnCommand=cmd();
		OffCommand=cmd();
		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
	};

	return t;
end

local Players = GAMESTATE:GetHumanPlayers();

for player in ivalues(Players) do
	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectMusic","BannerFrame"), {player=player} )..{
	OnCommand=cmd(x,SCREEN_CENTER_X+170;y,SCREEN_CENTER_Y+130;zoom,0.7);
	};
end

t[#t+1] = Def.ActorFrame{
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

	Radar() .. {
		BeginCommand=function(self)
	    	self:x( SCREEN_CENTER_X-45 ):y( SCREEN_CENTER_Y+135 ):zoom(1)
	    	:spin():effectmagnitude(0,0,1.5)
		end,
	};

	LoadActor( THEME:GetPathG("ScreenSelectMusic","StageDisplay") )..{
		OnCommand=function(self)
	    	self:x( SCREEN_CENTER_X-56 ):y( SCREEN_CENTER_Y-30 ):zoom(0.8)
		end,
	};

	Def.Quad{
	InitCommand=cmd(FullScreen;diffuse,0,0,0,0);
	ShowPressStartForOptionsCommand=cmd(linear,0.3;diffusealpha,1);
	};

	LoadActor("../border");

	LoadActor( "Options","Message")..{
		InitCommand=cmd(Center;pause;zoomy,0);
		ShowPressStartForOptionsCommand=cmd(linear,0.3;zoomy,1);
		ShowEnteringOptionsCommand=cmd(stoptweening;setstate,1;sleep,0.6;linear,0.3;zoomy,0);
		HidePressStartForOptionsCommand=cmd(linear,0.3;zoomy,0);
	},
}

return t;