local c;
local player = Var "Player";

local JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "MarvelousCommand" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "PerfectCommand" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "GreatCommand" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "GoodCommand" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "BooCommand" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "MissCommand" );
};

local TNSFrames = {
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 1;
	TapNoteScore_W3 = 2;
	TapNoteScore_W4 = 3;
	TapNoteScore_W5 = 4;
	TapNoteScore_Miss = 5;
};

local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	LoadActor("Judgment") .. {
		Name="Judgment";
		InitCommand=cmd(pause;visible,false);
		OnCommand=THEME:GetMetric("Judgment","JudgmentOnCommand");
		ResetCommand=cmd(finishtweening;stopeffect;visible,false);
	};
	
	InitCommand = function(self)
		c = self:GetChildren();
	end;

	JudgmentMessageCommand=function(self, param)
		if param.Player ~= player then return end;
		if param.HoldNoteScore then return end;

		local iNumStates = c.Judgment:GetNumStates();
		local iFrame = TNSFrames[param.TapNoteScore];
		
		local iTapNoteOffset = param.TapNoteOffset;
		
		if not iFrame then return end
		if iNumStates == 12 then
			iFrame = iFrame * 2;
			if not param.Early then
				iFrame = iFrame + 1;
			end
		end
		
		self:playcommand("Reset");

		c.Judgment:visible( true );
		c.Judgment:setstate( iFrame );
		JudgeCmds[param.TapNoteScore](c.Judgment);
		
	end;
};


return t;
