local t = Def.ActorFrame{ };

local Players = GAMESTATE:GetHumanPlayers()

local function NoteScore(pn,n)
	return STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetTapNoteScores(n)
end

local ValuesToFind = {
	'TapNoteScore_W1',
	'TapNoteScore_W2',
	'TapNoteScore_W3',
	'TapNoteScore_W4',
	'TapNoteScore_W5',
	'TapNoteScore_Miss',
	'TapNoteScore_CheckpointHit',
}

local spacing = {1,2,3,4,5,6,7}

for player in ivalues(Players) do
	t[#t+1] = LoadActor("Frame")..{
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-160) or SCREEN_CENTER_X+160 ):CenterY()
		end,
	};

	t[#t+1] = LoadActor( THEME:GetPathG("","Tiers/"..STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetGrade()) )..{
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-90) or SCREEN_CENTER_X+230 ):y(SCREEN_CENTER_Y-80)
		end,
	};

	t[#t+1] = Def.BitmapText{
		Text=string.format("% 4d", STATSMAN:GetCurStageStats():GetPlayerStageStats(player):MaxCombo() ),
		Font="_numbers5",
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-160) or SCREEN_CENTER_X+160 ):y( SCREEN_CENTER_Y+105 )
		:diffuse(Color.Black):zoom(0.6)
		end,
	};

	t[#t+1] = Def.BitmapText{
		Text=string.format("% 9d", STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetScore() ),
		Font="_numbers5",
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-160) or SCREEN_CENTER_X+160 ):y( SCREEN_CENTER_Y+136 )
		:diffuse(0.5,0.5,0.5,1):zoom(0.4)
		end,
	};

	for NVal in ivalues(spacing) do
		t[#t+1] = Def.BitmapText{
		Text=string.format("% 4d", NoteScore(player,ValuesToFind[NVal]) ),
		Font="_numbers5",
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-190) or SCREEN_CENTER_X+130 ):y( SCREEN_CENTER_Y-142+(15*NVal) )
		:diffuse(0,0.7,1,1):horizalign(left):zoom(0.3)
		end,
		};
	end
end

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(CenterX;y,SCREEN_BOTTOM-50);

	Def.Quad{ OnCommand=cmd(zoomto,SCREEN_WIDTH,35;vertalign,top;y,-10;diffuse,1,1,0,0.3) };
	Def.Quad{ OnCommand=cmd(zoomto,SCREEN_WIDTH,2;vertalign,top;y,-10;diffuse,1,1,0,0.6) };
	Def.Quad{ OnCommand=cmd(zoomto,SCREEN_WIDTH,2;vertalign,bottom;y,25;diffuse,1,1,0,0.6) };

	LoadFont("Common Normal")..{ Text=GAMESTATE:GetCurrentSong():GetDisplayMainTitle(); OnCommand=cmd(zoom,0.5); };
	LoadFont("Common Normal")..{ Text=GAMESTATE:GetCurrentSong():GetDisplayArtist(); OnCommand=cmd(zoom,0.5;y,15); };
};

t[#t+1] = LoadActor("../border");

return t;