local T, C, L, G = unpack(Tukui)

-- auras
do
	local frame = CreateFrame("Frame", "TukuiAuras")
	frame.content = {}

	local frames = {
		TukuiAurasPlayerBuffs,
		TukuiAurasPlayerDebuffs,
		TukuiAurasPlayerConsolidate,
	}

	local frameUpdate = function(self)
		for i = 1, self:GetNumChildren() do
			local child = select(i, self:GetChildren())
			local duration = child.Duration
			local count = child.Count
			
			-- create shadows
			if not child.shadow then
				child:CreateShadow("Default")
			end
			
			-- duration text
			if duration then
				duration:ClearAllPoints()
				duration:Point("TOP", child, "BOTTOM", 0, -2)
				duration:SetFont(C.media.caith, 12)
				duration:SetShadowOffset(1,-1)
			end
			
			-- stack text
			if count then
				count:ClearAllPoints()
				count:Point("BOTTOMRIGHT", -2, 3)
				count:SetFont(C.media.caith, 12)
				count:SetShadowOffset(1,-1)
			end
		end
	end

	for _, frame in pairs(frames) do
		frame:RegisterEvent("PLAYER_ENTERING_WORLD")
		frame:HookScript("OnAttributeChanged", frameUpdate)
		frame:HookScript("OnEvent", frameUpdate)
	end

	TukuiAurasPlayerBuffs:ClearAllPoints()
	TukuiAurasPlayerBuffs:Point("TOPRIGHT", G.Maps.Minimap, "TOPLEFT", -5, 0)
	TukuiAurasPlayerBuffs:Size(25) -- need config
end