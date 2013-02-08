local T, C, L, G = unpack(Tukui) 

local player = G.UnitFrames.Player
local adjustXY = 0

do
	-- kill
	player.panel:Kill()
	player.shadow:Kill()
	player:SetBackdrop(nil)
	if player.Experience then
		player.Experience:Kill()
	end
	if player.Reputation then
		player.Reputation:Kill()
	end
	
	-- setup
	T.UnitframePanels(player, "player")
	
	-- size
	player:Size(250, 57)
	
	-- position
	player:ClearAllPoints()
	player:Point("TOP", UIParent, "BOTTOM", -310, 230+adjustXY)
	
	-- power bar
	player.Power:Point("TOPLEFT", player.Health, "BOTTOMLEFT", 0, -3)
	player.Power:Point("TOPRIGHT", player.Health, "BOTTOMRIGHT", 0, -3)
	
	-- health text
	player.Health.value = T.SetFontString(player.Panel, C.media.caith, 12)
	player.Health.value:Point("RIGHT", player.Panel, "RIGHT", -4, 0)
	
	-- power text
	player.Power.value = T.SetFontString(player.Panel, C.media.caith, 12)
	player.Power.value:Point("LEFT", player.Panel, "LEFT", 4, 0)
	
	-- combat feedback text
	player.CombatFeedbackText:SetFont(C.media.caith, 12, "THINOUTLINE")
	
	-- castbar
	player.Castbar:ClearAllPoints()
	player.Castbar:Point("BOTTOM", UIParent, "BOTTOM", 0, 89)
	player.Castbar:Height(T.buttonsize - 4)
	player.Castbar:Width(350)
	
	player.Castbar.button:ClearAllPoints()
	player.Castbar.button:Point("RIGHT", player.CastbarBG, "LEFT", -3, 0)

	-- info
	player.FlashInfo.ManaLevel = T.SetFontString(player.Panel, C.media.caith, 12)
	player.FlashInfo.ManaLevel:ClearAllPoints()
	player.FlashInfo.ManaLevel:Point("CENTER", player.Panel, "CENTER", 0, 1)

	player.Status = T.SetFontString(player.Panel, C.media.caith, 12)
	player.Status:ClearAllPoints()
	player.Status:Point("CENTER", player.Panel, "CENTER", 0, 1)

	------ START CLASSES ------
	-- druid
	if T.myclass == "DRUID" then
		player.DruidManaText = T.SetFontString(player.Health, C.media.caith, 12)
		
		if player.DruidManaBackground then
			player.DruidManaBackground:Kill()
			player.DruidManaBackground:SetAlpha(0)
		end
		
		player.DruidMana:SetParent(player.Health)
		player.DruidMana:ClearAllPoints()
		player.DruidMana:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 5)
		player.DruidMana:Height(2)
		player.DruidMana:Width(player:GetWidth())
		
		local DruidManaBG = CreateFrame("Frame", player:GetName().."_DruidManaBG", player.DruidMana)
		DruidManaBG:SetFrameLevel(player.DruidMana:GetFrameLevel() - 1)
		DruidManaBG:SetFrameStrata(player.DruidMana:GetFrameStrata())
		DruidManaBG:Point("TOPLEFT", -2, 2)
		DruidManaBG:Point("BOTTOMRIGHT", 2, -2)
		DruidManaBG:SetTemplate("Default")
		DruidManaBG:CreateShadow()
		
		player.WildMushroom:ClearAllPoints()
		player.WildMushroom:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 5)
		player.WildMushroom:Height(5)
		player.WildMushroom:Width(player:GetWidth())
		player.WildMushroom:SetBackdrop(nil)
		
		local WildMushroomBG = CreateFrame("Frame", player:GetName().."_MushroomBG", player.WildMushroom)
		WildMushroomBG:SetFrameLevel(player.WildMushroom:GetFrameLevel() - 1)
		WildMushroomBG:SetFrameStrata(player.WildMushroom:GetFrameStrata())
		WildMushroomBG:Point("TOPLEFT", -2, 2)
		WildMushroomBG:Point("BOTTOMRIGHT", 2, -2)
		WildMushroomBG:SetTemplate("Default")
		WildMushroomBG:CreateShadow()
		
		for i = 1, 3 do
			player.WildMushroom[i]:Height(player.WildMushroom:GetHeight())
			player.WildMushroom[i]:SetStatusBarTexture(C.media.empath)
			player.WildMushroom[i]:SetStatusBarColor(.5, .9, .6)
			
			if i == 1 then
				player.WildMushroom[i]:Width((player:GetWidth() / 3) - 1)
				player.WildMushroom[i]:SetPoint("LEFT", player.WildMushroom, "LEFT", 0, 0)
			else
				player.WildMushroom[i]:Width((player:GetWidth() / 3))
				player.WildMushroom[i]:SetPoint("LEFT", player.WildMushroom[i-1], "RIGHT", 1, 0)
			end
			player.WildMushroom[i].bg = player.WildMushroom[i]:CreateTexture(nil, 'ARTWORK')
		end
		player.WildMushroom:SetScript("OnShow", T.UpdateMushroomVisibility)
		player.WildMushroom:SetScript("OnHide", T.UpdateMushroomVisibility)
	end	
	
	-- death knight
	if T.myclass == "DEATHKNIGHT" then
		player.Runes:Kill()
		
		player.Statue:ClearAllPoints()
		player.Statue:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 5)
		player.Statue:Height(3)
		player.Statue:Width(player:GetWidth())
		player.Statue:SetBackdrop(nil)
		player.Statue:SetStatusBarTexture(C.media.empath)
		player.Statue:SetStatusBarColor(.25, .65, .54)
		
		local RisenBG = CreateFrame("Frame", player:GetName().."_RisenBG", player.Statue)
		RisenBG:SetFrameLevel(player.Statue:GetFrameLevel() - 1)
		RisenBG:SetFrameStrata(player.Statue:GetFrameStrata())
		RisenBG:Point("TOPLEFT", -2, 2)
		RisenBG:Point("BOTTOMRIGHT", 2, -2)
		RisenBG:SetTemplate("Default")
		RisenBG:CreateShadow()
	end
	
	-- monk
	if T.myclass == "MONK" then	
		player.HarmonyBar:ClearAllPoints()
		player.HarmonyBar:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 5)
		player.HarmonyBar:Height(6)
		player.HarmonyBar:Width(player:GetWidth())
		player.HarmonyBar:SetBackdrop(nil)
		
		for i = 1, 5 do
			player.HarmonyBar[i]:Height(player.HarmonyBar:GetHeight())
			player.HarmonyBar[i]:SetStatusBarTexture(C.media.empath)
			player.HarmonyBar[i]:SetStatusBarColor(.8, .7, .3)

			if i == 1 then
				player.HarmonyBar[i]:Width((player:GetWidth() / 4) - 2)
				player.HarmonyBar[i]:SetPoint("LEFT", player.HarmonyBar, "LEFT", 0, 0)
			else
				player.HarmonyBar[i]:Width((player:GetWidth() / 4) - 1)
				player.HarmonyBar[i]:SetPoint("LEFT", player.HarmonyBar[i-1], "RIGHT", 1, 0)
			end
		end
		
		local HarmonyBG = CreateFrame("Frame", player:GetName().."_HarmonyBG", player.HarmonyBar)
		HarmonyBG:SetFrameLevel(player.HarmonyBar:GetFrameLevel() - 1)
		HarmonyBG:SetFrameStrata(player.HarmonyBar:GetFrameStrata())
		HarmonyBG:Point("TOPLEFT", -2, 2)
		HarmonyBG:Point("BOTTOMRIGHT", 2, -2)
		HarmonyBG:SetTemplate("Default")
		HarmonyBG:CreateShadow()
		
		player.Statue:ClearAllPoints()
		player.Statue:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 18)
		player.Statue:Height(3)
		player.Statue:Width(player:GetWidth())
		player.Statue:SetBackdrop(nil)
		player.Statue:SetStatusBarTexture(C.media.empath)
		player.Statue:SetStatusBarColor(.25, .65, .54)

		local StatueBG = CreateFrame("Frame", player:GetName().."_StatueBG", player.Statue)
		StatueBG:SetFrameLevel(player.Statue:GetFrameLevel() - 1)
		StatueBG:SetFrameStrata(player.Statue:GetFrameStrata())
		StatueBG:Point("TOPLEFT", -2, 2)
		StatueBG:Point("BOTTOMRIGHT", 2, -2)
		StatueBG:SetTemplate("Default")
		StatueBG:CreateShadow()		
	end
	
	-- priest
	if T.myclass == "PRIEST" then
		player.ShadowOrbsBar:ClearAllPoints()
		player.ShadowOrbsBar:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 5)
		player.ShadowOrbsBar:Height(6)
		player.ShadowOrbsBar:Width(player:GetWidth())
		player.ShadowOrbsBar:SetBackdrop(nil)
			
		for i = 1, 3 do
			player.ShadowOrbsBar[i]:Height(player.ShadowOrbsBar:GetHeight())
			player.ShadowOrbsBar[i]:SetStatusBarTexture(C.media.empath)

			if i == 1 then
				player.ShadowOrbsBar[i]:Width((player:GetWidth() / 3) - 1)
				player.ShadowOrbsBar[i]:SetPoint("LEFT", player.ShadowOrbsBar, "LEFT", 0, 0)
			else
				player.ShadowOrbsBar[i]:Width((player:GetWidth() / 3))
				player.ShadowOrbsBar[i]:SetPoint("LEFT", player.ShadowOrbsBar[i-1], "RIGHT", 1, 0)
			end
		end
			
		local ShadowOrsbsBG = CreateFrame("Frame", player:GetName().."_ShadowOrbsBG", player.ShadowOrbsBar)
		ShadowOrsbsBG:SetFrameLevel(player.ShadowOrbsBar:GetFrameLevel() - 1)
		ShadowOrsbsBG:SetFrameStrata(player.ShadowOrbsBar:GetFrameStrata())
		ShadowOrsbsBG:Point("TOPLEFT", -2, 2)
		ShadowOrsbsBG:Point("BOTTOMRIGHT", 2, -2)
		ShadowOrsbsBG:SetTemplate("Default")
		ShadowOrsbsBG:CreateShadow()
		
		player.Statue:ClearAllPoints()
		player.Statue:Point("BOTTOMLEFT", player.Background, "TOPLEFT", 2, 5)
		player.Statue:Height(3)
		player.Statue:Width(player:GetWidth())
		player.Statue:SetBackdrop(nil)
		player.Statue:SetStatusBarTexture(C.media.empath)
		player.Statue:SetStatusBarColor(.25, .65, .54)

		local StatueBG = CreateFrame("Frame", player:GetName().."_StatueBG", player.Statue)
		StatueBG:SetFrameLevel(player.Statue:GetFrameLevel() - 1)
		StatueBG:SetFrameStrata(player.Statue:GetFrameStrata())
		StatueBG:Point("TOPLEFT", -2, 2)
		StatueBG:Point("BOTTOMRIGHT", 2, -2)
		StatueBG:SetTemplate("Default")
		StatueBG:CreateShadow()		
	end
	------ END CLASSES ------
	
	-- heal prediction
	if C.unitframes.healcomm then
		player.HealPrediction.myBar:SetStatusBarTexture(C.media.empath)
		player.HealPrediction.myBar:SetStatusBarColor(0, 1, 0, 0.25)

		player.HealPrediction.otherBar:SetStatusBarTexture(C.media.empath)
		player.HealPrediction.otherBar:SetStatusBarColor(1, 0, 0, 0.25)
	end
end







































