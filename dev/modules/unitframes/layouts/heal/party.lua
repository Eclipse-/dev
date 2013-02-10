local T, C, L, G = unpack(Tukui)

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
		"yOffset", T.Scale(3),
		"point", "LEFT",
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", T.Scale(3),
		"columnAnchorPoint", "BOTTOM"
	end
	
	T.RaidFramePetAttributes = function()
		return
		"TukuiRaidPet", "SecureGroupPetHeaderTemplate", "solo,party,raid",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute("initial-width"))
			self:SetHeight(header:GetAttribute("initial-height"))
		]],
		"initial-width", 1,
		"initial-height", 1,
		"showPlayer", true,
		"showParty", true,
		"showRaid", true,
		-- "showSolo", true,
		"yOffset", T.Scale(-3),
		"xOffset", T.Scale(3),
		"point", "LEFT",
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
		
		-- setup
		T.UnitframePanels(self, "raid")
		
		-- re-anchor
		self.Background:ClearAllPoints()
		self.Background:SetAllPoints(self)

		self.Health:Point("TOPLEFT", self.Background, 2, -2)
		self.Health:Point("TOPRIGHT", self.Background, -2, -2)
		
		self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -3)
		self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -3)
		self.Power:Point("BOTTOMLEFT", self.Background, -2, 2)
		self.Power:Point("BOTTOMRIGHT", self.Background, 2, 2)
		
		-- sizes
		if unit:find("pet") then
			self.Health:Height(10)
		else
			self.Health:Height(50)
		end
		
		if unit:find("pet") then
			self.Power:Kill()
			self.Health:Point("BOTTOMRIGHT", self.Background, -2, 2)
		else
			self.Power:Height(1)
		end
		
		self:Width(80)
		-- don't touch
		self:SetHeight(self.Health:GetHeight() + self.Power:GetHeight() + 7)
		
		-- name
		local name = T.SetFontString(self.Health, C.media.caith, 12)
		if unit:find("pet") then
			name:SetPoint("CENTER", self.Health, "CENTER", 0, 0) 
		else
			name:SetPoint("CENTER", self.Health, "CENTER", 0, 16) 
		end
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
		role:Point("CENTER", self.Health, "CENTER", 0, -16)
		role:Size(18)
		self.LFDRole = role
		
		-- raid marker
		local mark = self.Health:CreateTexture(nil, "OVERLAY")
		mark:Height(18)
		mark:Width(18)
		mark:SetPoint("CENTER", self, "TOP")
		self.RaidIcon = mark

		if C.unitframes.healcomm then
			self.HealPrediction.myBar:SetPoint("BOTTOMLEFT", self.Health:GetStatusBarTexture(), "TOPLEFT", 0, 0)
			self.HealPrediction.myBar:SetPoint("BOTTOMRIGHT", self.Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
			self.HealPrediction.myBar:SetStatusBarTexture(C.media.empath)
			self.HealPrediction.myBar:SetStatusBarColor(0, 1, 0, 0.25)

			self.HealPrediction.otherBar:SetStatusBarTexture(C.media.empath)
			self.HealPrediction.otherBar:SetStatusBarColor(1, 0, 0, 0.25)
		end
		
		local debuffHighlight = self.Background:CreateTexture(nil, "OVERLAY")
		debuffHighlight:SetAllPoints()
		debuffHighlight:SetTexture(C.media.blank)
		debuffHighlight:SetBlendMode("DISABLE")
		debuffHighlight:SetVertexColor(0, 0, 0, 0)
		self.DebuffHighlight = debuffHighlight
		self.DebuffHighlightAlpha = 1
		self.DebuffHighlightFilter = true
		
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
		-- pets:ClearAllPoints()

		raid:SetPoint( "TOP", UIParent, "BOTTOM", 0, 230 )
		-- pets:SetPoint("LEFT", UIParent, "LEFT", -1000, 0)
		
		-- for i = 1, 5 do
			-- if i == 1 then
				
			-- else
			
			-- end
		-- end
	end)
	
	
end