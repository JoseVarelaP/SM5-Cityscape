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
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-160) or SCREEN_CENTER_X+160 )
		self:y(SCREEN_CENTER_Y)
		end,
	};

	t[#t+1] = LoadActor( THEME:GetPathG("","Tiers/"..STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetGrade()) )..{
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-90) or SCREEN_CENTER_X+230 )
		self:y(SCREEN_CENTER_Y-80)
		end,
	};

	for NVal in ivalues(spacing) do
		t[#t+1] = Def.BitmapText{
		Text=string.format("% 4d", NoteScore(player,ValuesToFind[NVal]) ),
		Font="_numbers5",
		OnCommand=function(self)
		self:x( (player == PLAYER_1 and SCREEN_CENTER_X-190) or SCREEN_CENTER_X+130 )
		self:y( SCREEN_CENTER_Y-142+(15*NVal) )
		self:diffuse(0,0.7,1,1)
		self:horizalign(left)
		self:zoom(0.3)
		end,
		};
	end
end

return t;