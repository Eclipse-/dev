local T, C, L, G = unpack(Tukui) 

-- modify action bar
do
	local bar = TukuiBar1
	MultiBarBottomRight:SetParent(bar)

	for i=1, 12 do
		local b = G.ActionBars.Bar3["Button"..i]
		local b2 = G.ActionBars.Bar3["Button"..i-1]
		b:ClearAllPoints()
		
		if i == 1 then
			b:Point("TOPRIGHT", G.ActionBars.Bar2["Button1"], "TOPLEFT", -((T.buttonsize * 2) + (T.buttonspacing * 3)), 0)
		elseif i == 4 then
			b:SetPoint("TOPLEFT", G.ActionBars.Bar3["Button1"], "BOTTOMLEFT", 0, -T.buttonspacing)
		elseif i == 7 then
			b:SetPoint("TOPLEFT", G.ActionBars.Bar2["Button12"], "TOPRIGHT", T.buttonspacing, 0)
		elseif i == 10 then
			b:SetPoint("TOPLEFT", G.ActionBars.Bar3["Button7"], "BOTTOMLEFT", 0, -T.buttonspacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	end
end