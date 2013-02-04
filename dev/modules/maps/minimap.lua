local T, C, L, G = unpack(Tukui)

-- Modify Minimap
do
	G.Maps.Minimap:ClearAllPoints()
	G.Maps.Minimap:CreateShadow()
	G.Maps.Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -10, -10)
end