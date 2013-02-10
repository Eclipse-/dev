local T, C, L, G = unpack(Tukui) 

-- modify action buttons
do
	local function style(self)
		local name = self:GetName()
		local stack = _G[name.."Count"]
		local bind = _G[name.."HotKey"]
		local macro = _G[name.."Name"]

		-- stack text
		if stack then
			stack:ClearAllPoints()
			stack:Point("BOTTOMRIGHT", -1, 4)
			stack:SetFont(C.media.pixel, 10, "MONOCHROMEOUTLINE")
		end
		
		-- keybind text
		if bind then
			bind.ClearAllPoints = bind:ClearAllPoints()
			bind.SetPoint = bind:SetPoint("TOPRIGHT", -1, -2)
			bind:SetFont(C.media.pixel, 10, "MONOCHROMEOUTLINE")
		end
		
		-- macro text 
		if macro then
			macro:ClearAllPoints()
			macro:Point("BOTTOM", 0, 4)
			macro:SetFont(C.media.pixel, 10, "MONOCHROMEOUTLINE")
			macro:SetShadowOffset(0, 0)
		end
	end
	hooksecurefunc("ActionButton_Update", style)
	
	
	T.SHowHighlightActionButton = T.dummy
	T.HideHighlightActionButton = T.dummy
	
	hooksecurefunc("ActionButton_ShowOverlayGlow", T.ShowHighlightActionButton)
	hooksecurefunc("ActionButton_HideOverlayGlow", T.HideHighlightActionButton)

end