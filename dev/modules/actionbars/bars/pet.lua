local T, C, L, G = unpack(Tukui) 

-- modify action bar
do
	local bar = TukuiPetBar

	bar:HookScript("OnEvent", function(self, event, unit)
		if event == "PLAYER_LOGIN" then
			for i = 1, 10 do
				local b = _G["PetActionButton"..i]
				local b2 = _G["PetActionButton"..i-1]
				b:ClearAllPoints()
				
				if i == 1 then
					b:SetPoint("TOPLEFT", bar, (T.buttonspacing + 1), (-T.buttonspacing - 1))
				else
					b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
				end
			end
		end
	end)
end