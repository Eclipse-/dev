local T, C, L, G = unpack(Tukui)

-- Modify Auras
do
	G.Auras.Buffs:ClearAllPoints()
	G.Auras.Buffs:SetPoint("TOPRIGHT", G.Maps.Minimap, "TOPLEFT", -5, 0)
	
	-- G.Auras.Debuffs:ClearAllPoints()
	-- G.Auras.Debuffs:SetPoint()
end