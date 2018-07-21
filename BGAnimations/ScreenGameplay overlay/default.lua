local Players = GAMESTATE:GetHumanPlayers();

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{

    Def.Quad{
    OnCommand=cmd(CenterX;y,SCREEN_TOP+20;zoomto,SCREEN_WIDTH-10,13;diffuse,0,0,0,1)
    };
    
	Def.Quad{
    OnCommand=cmd(CenterX;y,SCREEN_BOTTOM-20;zoomto,SCREEN_WIDTH-20,8;vertalign,bottom;cropright,0.007;zwrite,1;blend,"BlendMode_NoEffect")
    };

    Def.Quad{
    OnCommand=cmd(CenterX;y,SCREEN_BOTTOM-10;zoomto,SCREEN_WIDTH,15;diffuse,0.5,0.5,0.5,1;vertalign,bottom;cropright,0.007;ztest,1)
    };

    Def.SongMeterDisplay{
		OnCommand=cmd(Center;y,SCREEN_BOTTOM-15;vertalign,bottom;ztest,1);
        InitCommand=cmd(SetStreamWidth,SCREEN_WIDTH-5;);
        Stream=LoadActor("meter")..{InitCommand=cmd(diffusealpha,1)};
        Tip=LoadActor("tip")..{
            OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,0.6;effectcolor2,1,1,1,1.0);
        };
    };

}

local function MidFrameDistance()
    local function WideScreenAmmount()
        return (PREFSMAN:GetPreference("DisplayAspectRatio") > 1.77 and 226) or 140
    end
    return (IsUsingWideScreen() and WideScreenAmmount()) or 12
end

local DiffList = {
    Difficulty_Beginner = 0,
    Difficulty_Easy = 1,
    Difficulty_Medium = 2,
    Difficulty_Hard = 3,
    Difficulty_Challenge = 4,
    Difficulty_Edit = 5,
}

for player in ivalues(Players) do
    t[#t+1] = Def.ActorProxy{
    BeginCommand=function(self)
    self:SetTarget( SCREENMAN:GetTopScreen():GetChild("LifeP"..string.sub(player, 15)) )
    end,
    };
end

t[#t+1] = LoadActor("FrameMiddle")..{ OnCommand=cmd(Center;zoomtowidth,MidFrameDistance()); };
t[#t+1] = LoadActor("FrameLeft")..{ OnCommand=cmd(x,SCREEN_LEFT;CenterY;horizalign,left); };
t[#t+1] = LoadActor("FrameRight")..{ OnCommand=cmd(x,SCREEN_RIGHT;CenterY;horizalign,right); };

for player in ivalues(Players) do
    t[#t+1] = LoadActor("DiffIcons")..{
    OnCommand=cmd(x,(player == PLAYER_1 and SCREEN_LEFT+60) or SCREEN_RIGHT-60;y,40;pause);
    UpdateCommand=function(self)
    self:setstate( (GAMESTATE:GetCurrentSteps(player) and GAMESTATE:GetCurrentSong() and DiffList[GAMESTATE:GetCurrentSteps(player):GetDifficulty()]) or 5 )
    end,
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Update");
    CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Update");
    CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Update");
    };
end

return t;