local FadeApply = GetScreenAspectRatio() > 1.4
return Def.ActorFrame{
	LoadActor("../_mtrain bg"),
	Def.ActorFrame{
		OnCommand=function(self)
			self:CenterY():x( SCREEN_RIGHT-320 )

			local c = self:GetChildren()
			if FadeApply then
				c[""][1]:fadeleft( 0.2 ):cropleft(0.09)
				c[""][2]:fadeleft( 0.2 ):cropleft(0.09)
				c[""][3]:fadeleft( 0.05 )
			end
		end,
		Def.Sprite{
			Texture="hex1",
			OnCommand=function(self)
				self:glowshift():effectperiod(2):effectmagnitude(.5,.5,.5)
			end,
		},
		Def.Sprite{
			Texture="hex2",
			OnCommand=function(self)
				self:glowshift():y(-32):effectperiod(2):effectmagnitude(.5,.5,.5)
			end,
		},
		Def.Sprite{ Texture="optionsb" },
		Def.Sprite{
			Texture="cityscape",
			OnCommand=function(self) self:x(-130):zoom(.8) end
		},
		Def.Sprite{
			Texture="choices",
			OnCommand=function(self) self:x(190) end
		}
	}
}