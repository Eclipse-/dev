local T, C, L, G = unpack(Tukui) 

-- modify action bar
do
	local bar = TukuiBar5
	MultiBarRight:SetParent(bar)

	for i=1, 12 do
		local b = G.ActionBars.Bar5["Button"..i]
		local b2 = G.ActionBars.Bar5["Button"..i-1]
		b:ClearAllPoints()
		
		if i == 1 then
			b:SetPoint("TOPLEFT", bar, (T.buttonspacing + 1), (-T.buttonspacing - 1))
		else
			b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
		end
	end
end