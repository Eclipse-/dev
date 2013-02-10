local T, C, L, G = unpack(Tukui) 

do
	lootposition = function(self, event, autoloot)
		if(GetCVar("lootUnderMouse") == "1") then
			local x, y = GetCursorPosition()
			x = x / self:GetEffectiveScale()
			y = y / self:GetEffectiveScale()

			self:ClearAllPoints()
			self:Point("TOPLEFT", nil, "BOTTOMLEFT", x - 40, y + 20)
			self:GetCenter()
			self:Raise()
		else
			self:ClearAllPoints()
			self:SetUserPlaced(false)
			self:Point("CENTER", 400, 0)		
		end
	end
	hooksecurefunc(G.Loot.Frame, "LOOT_OPENED", lootposition)
end