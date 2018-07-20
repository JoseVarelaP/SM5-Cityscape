local c;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local Pulse = THEME:GetMetric("Combo", "PulseCommand");
local PulseLabel = THEME:GetMetric("Combo", "PulseLabelCommand");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

local LabelMinZoom = 0.5;
local LabelMaxZoom = 0.9;

local t = Def.ActorFrame {
	InitCommand=cmd(vertalign,bottom);

	LoadFont( "", "Combo" ) .. {
		Name="Number";
		OnCommand = THEME:GetMetric("Combo", "NumberOnCommand");
	};
	LoadActor("Combo label") .. {
		Name="Label";
		OnCommand = THEME:GetMetric("Combo", "LabelOnCommand");
	};



	
	InitCommand = function(self)
		c = self:GetChildren();
		c.Number:visible(false);
		c.Label:visible(false);
	end;
	-- Milestones:
	-- 25,50,100,250,600 Multiples;
--[[ 		if (iCombo % 100) == 0 then
			c.OneHundredMilestone:playcommand("Milestone");
		elseif (iCombo % 250) == 0 then
			-- It should really be 1000 but thats slightly unattainable, since
			-- combo doesnt save over now.
			c.OneThousandMilestone:playcommand("Milestone");
		else
			return
		end; --]]
	ComboCommand=function(self, param)
		local iCombo = param.Misses or param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			c.Number:visible(false);
			c.Number:y(20);
			c.Label:visible(false);
			c.Label:y(15);
			c.Number:x(-6);
			c.Label:x(0);
			return;
		end

		c.Label:visible(false);

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );
		
		param.LabelZoom = scale( iCombo, 0, NumberMaxZoomAt, LabelMinZoom, LabelMaxZoom );
		param.LabelZoom = clamp( param.LabelZoom, LabelMinZoom, LabelMaxZoom );
		
		c.Number:visible(true);
		c.Label:visible(true);
		c.Number:settext( string.format("%i", iCombo) );
		-- FullCombo Rewards
		if param.Combo then
			(cmd(diffuse,Color("White");))(c.Label);
		else
			c.Label:visible(false);
		end

		c.Number:finishtweening();
		c.Label:finishtweening();
		-- Pulse
		Pulse( c.Number, param );
		PulseLabel( c.Label, param );
		-- Milestone Logic
	end;
};

return t;
