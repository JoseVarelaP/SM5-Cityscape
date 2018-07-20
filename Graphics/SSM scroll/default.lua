local t = Def.ActorFrame {};
local gc = Var("GameCommand");

	t[#t+1] = Def.ActorFrame{
	GainFocusCommand=cmd(stoptweening;linear,0.2;diffusealpha,1),
	LoseFocusCommand=cmd(stoptweening;linear,0.2;diffusealpha,0),
	
		LoadActor( gc:GetName().." icon" );
	};


return t;

-- return Def.ActorFrame{
-- 	MadeChoiceP1MessageCommand=cmd(playcommand,"GoOff");
-- 	MadeChoiceP2MessageCommand=cmd(playcommand,"GoOff");
-- 	GoOffCommand=function(self) self:linear(0.5); local bHasFocus=math.abs(self:GetZoomZ()-1.1)<0.01 if bHasFocus then self:x(0); self:y(0); self:glowblink(); self:sleep(0.5); self:linear(0.5); self:zoom(0); else self:x(0); self:y(0); self:z(0); self:zoom(0); end self:sleep(5) end,

-- 	LoadActor( gc:GetName() ),
-- }
