local T, C, L, G = unpack(Tukui) 

-- modify action bar
do
	local bar = TukuiBar1
	MultiBarBottomLeft:SetParent(bar)

	for i=1, 12 do
		local b = G.ActionBars.Bar2["Button"..i]
		local b2 = G.ActionBars.Bar2["Button"..i-1]
		b:ClearAllPoints()
		
		
		if i == 1 then
			b:Point("TOPLEFT", bar, ((T.buttonsize * 3) + (T.buttonspacing * 4)), -T.buttonspacing)
		else
			b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
		end
	end
end