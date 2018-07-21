local args = ...
local player = args.player

local FrameYOffset = 55

local function RadarValue(pn,n)
	-- 'RadarCategory_Stream'			0
	-- 'RadarCategory_Voltage'			1
	-- 'RadarCategory_Air'				2
	-- 'RadarCategory_Freeze'			3
	-- 'RadarCategory_Chaos'			4
	-- 'RadarCategory_Notes'			5
	-- 'RadarCategory_TapsAndHolds'		6
	-- 'RadarCategory_Jumps'			7
	-- 'RadarCategory_Holds'			8
	-- 'RadarCategory_Mines'			9
	-- 'RadarCategory_Hands'			10
	-- 'RadarCategory_Rolls'			11
	-- 'RadarCategory_Lifts'			12
	-- 'RadarCategory_Fakes'			13
	if GAMESTATE:IsPlayerEnabled(pn) and GAMESTATE:IsHumanPlayer(pn) then
		return (GAMESTATE:GetCurrentSteps(pn) and GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSteps(pn):GetRadarValues(pn):GetValue(n)) or ""
	end
end

local function GenerateStepShow(pn,n)
	local t = Def.ActorFrame{
		LoadFont("Common Normal")..{
		OnCommand=cmd(horizalign,left);
		UpdateCommand=function(self)
		self:settext( RadarValue(pn,n) )
		end,
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Update");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Update");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Update");
		};
	};

	return t;
end

local DiffList = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:y( (player == PLAYER_1 and -FrameYOffset) or FrameYOffset )
	end,
	
	LoadActor(player)..{
	};

	LoadFont("_numbers5")..{
		OnCommand=function(self) self:x( -115 ):y(-5) end,
		UpdateCommand=function(self)
		self:settext( (GAMESTATE:GetCurrentSteps(player) and GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSteps(player):GetMeter()) or "" )
		end,
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Update");
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Update");
		CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Update");
	};

	Def.ActorProxy{
	BeginCommand=function(self)
	self:SetTarget( SCREENMAN:GetTopScreen():GetChild("ScoreP"..string.sub(player, 15)) )
	self:y(35):x(80)
	end,
	};

	GenerateStepShow(player, 5)..{ OnCommand=cmd(zoom,0.65;x,5;y,-32;); };
	GenerateStepShow(player, 7)..{ OnCommand=cmd(zoom,0.65;x,5;y,-12;); };
	GenerateStepShow(player, 8)..{ OnCommand=cmd(zoom,0.65;x,5;y,8;); };

	GenerateStepShow(player, 9)..{ OnCommand=cmd(zoom,0.65;x,125;y,-30;); };
	GenerateStepShow(player, 10)..{ OnCommand=cmd(zoom,0.65;x,125;y,-10;); };

	LoadActor("difficulty icons")..{
	OnCommand=cmd(x,-110;y,-33;zoom,0.7;pause);
	UpdateCommand=function(self)
	self:setstate( (GAMESTATE:GetCurrentSteps(player) and GAMESTATE:GetCurrentSong() and DiffList[GAMESTATE:GetCurrentSteps(player):GetDifficulty()]) or 5 )
	end,
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Update");
	CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Update");
	CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Update");
	};
};

return t;