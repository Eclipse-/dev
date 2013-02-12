local T, C, L, G = unpack(Tukui)

if TukuiDataPerChar.layout == 0 then return end

do
	T.RaidFrameAttributes = function()
		return
		"TukuiRaid", nil, "solo,raid,party",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", 1,
		"initial-height", 1,
		"showParty", true,
		"showPlayer", true,
		-- "showSolo", true,
		"xoffset", T.Scale(3),
		"yOffset", T.Scale(-3),
		"point", "TOP",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", T.Scale(3),
		"columnAnchorPoint", "BOTTOM"
	end

	T.PostUpdateRaidUnit = function(self, unit)
		-- kill
		self.panel:Kill()
		self:SetBackdrop(nil)
		self.Name:Kill()
		self.ReadyCheck:Kill()
		self.Health.value:Kill()
		self.LFDRole:Kill()
		self.RaidIcon:Kill()
		self.Power:Kill()
		
		-- setup
		T.UnitframePanels(self, "raid")

		-- re-anchor
		self.Background:ClearAllPoints()
		self.Background:SetAllPoints(self)

		self.Health:ClearAllPoints()
		self.Health:Point("TOPLEFT", self.Background, "TOPLEFT", 2, -2)
		self.Health:Point("BOTTOMRIGHT", self.Background, "BOTTOMRIGHT", -2, 2)
		self.Health:SetOrientation("HORIZONTAL")

		-- sizes
		self.Health:Height(10)
		self:Width(98)
		-- don't touch
		self:SetHeight(self.Health:GetHeight() + self.Power:GetHeight() + 7)
		
		-- name
		local name = T.SetFontString(self.Health, C.media.caith, 12)
		name:SetPoint("LEFT", self.Health, "RIGHT", 5, 0) 
		self:Tag(name, "[Tukui:nameshort]")
		self.Name = name

		-- readycheck
		local ready = self.Health:CreateTexture(nil, "OVERLAY")
		ready:Height(13)
		ready:Width(13)
		ready:SetPoint("CENTER") 	
		self.ReadyCheck = ready
		
		-- role icon
		local role = self.Health:CreateTexture(nil, "OVERLAY")
		role:Point("LEFT", self.Health, "LEFT", 5, 0)
		role:Size(18)
		self.LFDRole = role
		
		-- raid marker
		local mark = self.Health:CreateTexture(nil, "OVERLAY")
		mark:Height(18)
		mark:Width(18)
		mark:SetPoint("CENTER", self, "TOP")
		self.RaidIcon = mark
		
		if (self.WeakenedSoul) then
			self.WeakenedSoul:Kill()
		end
	end
	
	local TukuiRaidPosition = CreateFrame( "Frame" )
	TukuiRaidPosition:RegisterEvent( "PLAYER_LOGIN" )
	TukuiRaidPosition:SetScript( "OnEvent", function( self, event )
		local raid = G.UnitFrames.RaidUnits
		local pets = G.UnitFrames.RaidPets
		
		raid:ClearAllPoints()
		raid:SetPoint( "LEFT", UIParent, "LEFT", 10, 0 )
	end)
end