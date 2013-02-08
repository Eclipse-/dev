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
	
	-- size
	target:Size(250, 57)

	-- position
	target:ClearAllPoints()
	target:Point("TOP", UIParent, "BOTTOM", 310, 230+adjustXY)

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
	
	-- combo points
	target.ComboPointsBar:ClearAllPoints()
	target.ComboPointsBar:Point("BOTTOMLEFT", target, "TOPLEFT", 0, 7)
	target.ComboPointsBar:SetHeight(7)
	target.ComboPointsBar.PostUpdate = T.ComboPointsBarUpdate
	
	for i = 1, 5 do
		target.ComboPointsBar[i]:SetHeight(target.ComboPointsBar:GetHeight())
		target.ComboPointsBar[i]:SetStatusBarTexture(C.media.empath)
	end
	
	local ComboBG = CreateFrame("Frame", _, target.ComboPointsBar)
	ComboBG:SetFrameLevel(target.ComboPointsBar:GetFrameLevel() - 1)
	ComboBG:SetFrameStrata(target.ComboPointsBar:GetFrameStrata())
	ComboBG:Point("TOPLEFT", -2, 2)
	ComboBG:Point("BOTTOMRIGHT", 2, -2)
	ComboBG:SetTemplate("Default")
	ComboBG:CreateShadow()

	-- buffs
	target.Buffs:ClearAllPoints()
	target.Buffs:SetPoint("BOTTOMLEFT", target.Background, "TOPLEFT", 0, 3)
	target.Buffs:Height(1)
	target.Buffs:Width(target.Background:GetWidth())
	target.Buffs.size = ((target.Background:GetWidth() / 8))
	target.Buffs.spacing = 3
	target.Buffs.initialAnchor = "BOTTOMLEFT"
	target.Buffs.num = 7
	target.Buffs.numRow = 1
	target.Buffs.PostUpdate = T.UpdateTargetDebuffsHeader

	-- debuffs
	target.Debuffs:Height(1)
	target.Debuffs.size = ((target.Background:GetWidth() / 8))	
end
