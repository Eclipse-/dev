local T, C, L, G = unpack(Tukui) 

-- modify action bar
do
	local bar = TukuiBar1

	bar:HookScript("OnEvent", function(self, event, unit)
		if event == "PLAYER_ENTERING_WORLD" then
			for i = 1, 12 do
				local b = _G["ActionButton"..i]
				local b2 = _G["ActionButton"..i-1]
				b:ClearAllPoints()
				
				if i == 1 then
					b:SetPoint("BOTTOMLEFT", bar, ((T.buttonsize * 3) + (T.buttonspacing * 4)), T.buttonspacing)
				else
					b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
				end
			end
		end
	end)
end