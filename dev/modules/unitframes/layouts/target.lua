local T, C, L, G = unpack(Tukui) 

local target = G.UnitFrames.Target
local adjustXY = 0

do
	-- kill
	target.panel:Kill()
	target.shadow:Kill()
	target:SetBackdrop(nil)
	
	-- setup
	T.UnitframePanels(target, "target")
	
	-- sizes
	target.Health:Height(29)
	target.Power:Height(3)
	target:Width(250)
	-- don't touch
	target:SetHeight(target.Health:GetHeight() + target.Power:GetHeight() + target.Panel:GetHeight() + 7)

	-- position
	target:ClearAllPoints()
	target:Point("TOP", UIParent, "BOTTOM", 330, 230+adjustXY)

	-- power bar
	target.Power:Point("TOPLEFT", target.Health, "BOTTOMLEFT", 0, -3)
	target.Power:Point("TOPRIGHT", target.Health, "BOTTOMRIGHT", 0, -3)

	-- health text
	target.Health.value = T.SetFontString(target.Panel, C.media.caith, 12)
	target.Health.value:Point("RIGHT", target.Panel, "RIGHT", -4, 0)

	-- target text
	target.Name:SetFont(C.media.caith, 12)
	
	-- combat feedback text
	target.CombatFeedbackText:SetFont(C.media.caith, 12, "THINOUTLINE")
	
	-- castbar
	target.Castbar:ClearAllPoints()
	target.Castbar:Point("CENTER", UIParent, "CENTER", 0, -200)
	target.Castbar:Height(T.buttonsize - 4)
	target.Castbar:Width(250)
	
	target.Castbar.button:ClearAllPoints()
	target.Castbar.button:Point("RIGHT", target.CastbarBG, "LEFT", -3, 0)
	
	target.Castbar.PostCastStart = CheckCast
	target.Castbar.PostChannelStart = CheckCast

	-- combo points
	target.ComboPointsBar:ClearAllPoints()
	target.ComboPointsBar:Point("BOTTOMLEFT", target, "TOPLEFT", 0, 7)
	target.ComboPointsBar:SetHeight(7)
	target.ComboPointsBar.PostUpdate = T.ComboPointsBarUpdate
	target.ComboPointsBar:Width(target:GetWidth())
	
	for i = 1, 5 do
		target.ComboPointsBar[i]:SetHeight(target.ComboPointsBar:GetHeight())
		target.ComboPointsBar[i]:SetStatusBarTexture(C.media.empath)
		
		if i == 1 then
			target.ComboPointsBar[i]:Width(target:GetWidth() / 5)
		else
			target.ComboPointsBar[i]:Width((target:GetWidth() / 5) - 1)
		end					
	end
	
	local ComboBG = CreateFrame("Frame", target:GetName().."_ComboBG", target.ComboPointsBar)
	ComboBG:SetFrameLevel(target.ComboPointsBar:GetFrameLevel() - 1)
	ComboBG:SetFrameStrata(target.ComboPointsBar:GetFrameStrata())
	ComboBG:Point("TOPLEFT", -2, 2)
	ComboBG:Point("BOTTOMRIGHT", 2, -2)
	ComboBG:SetTemplate("Default")
	ComboBG:CreateShadow()

	-- buffs
	target.Buffs:ClearAllPoints()
	target.Buffs:SetPoint("BOTTOMLEFT", target.Background, "TOPLEFT", 0, 3)
	target.Buffs:Height((target.Background:GetWidth() / 9) + 1)
	target.Buffs:Width(target.Background:GetWidth())
	target.Buffs.size = (target.Buffs:GetHeight() + .1)
	target.Buffs.spacing = 3
	target.Buffs.initialAnchor = "BOTTOMLEFT"
	target.Buffs.num = 8
	target.Buffs.numRow = 1
	target.Buffs.PostUpdate = T.UpdateTargetDebuffsHeader

	-- debuffs
	target.Debuffs:ClearAllPoints()
	target.Debuffs:SetPoint("BOTTOMLEFT", target.Buffs, "TOPLEFT", 0, 3)
	target.Debuffs:Height((target.Background:GetWidth() / 9) + 1)
	target.Debuffs:Width(target.Buffs:GetWidth())
	target.Debuffs.size = (target.Buffs.size)
	target.Debuffs.spacing = 3
	
		-- heal prediction
	if C.unitframes.healcomm then
		target.HealPrediction.myBar:SetStatusBarTexture(C.media.empath)
		target.HealPrediction.myBar:SetStatusBarColor(0, 1, 0, 0.25)

		target.HealPrediction.otherBar:SetStatusBarTexture(C.media.empath)
		target.HealPrediction.otherBar:SetStatusBarColor(1, 0, 0, 0.25)
	end
end
