local T, C, L, G = unpack(Tukui)

-- minimap
do
	-- modify minimap
	G.Maps.Minimap:ClearAllPoints()
	G.Maps.Minimap:CreateShadow()
	G.Maps.Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -10, -10)
	G.Maps.Minimap:Size(180)
	
	-- setpoint() doesn't work..
	Minimap:Size(G.Maps.Minimap:GetSize())
	
	-- zone text
	G.Maps.Minimap.Zone.Text:ClearAllPoints()
	G.Maps.Minimap.Zone.Text:Point("CENTER", G.Maps.Minimap.Zone)
	G.Maps.Minimap.Zone.Text:SetFont(C.media.caith, 12)
	
	-- coord text
	G.Maps.Minimap.Coord.Text:ClearAllPoints()
	G.Maps.Minimap.Coord.Text:Point("CENTER", G.Maps.Minimap.Coord, 0, 1)
	G.Maps.Minimap.Coord.Text:SetFont(C.media.caith, 12)
end