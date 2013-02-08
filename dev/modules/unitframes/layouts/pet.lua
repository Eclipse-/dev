local T, C, L, G = unpack(Tukui) 

local pet = G.UnitFrames.Pet
local adjustXY = 0

do
	-- kill
	pet.panel:Kill()
	pet.shadow:Kill()
	pet:SetBackdrop(nil)
	
	-- setup
	T.UnitframePanels(pet, "pet")
	
	-- size
	pet:Size(129, 36)
	
	-- position
	pet:ClearAllPoints()
	pet:Point("TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", 0, -9+adjustXY)

	-- health bar
	pet.Health:Height(18)
	
	-- targettarget text
	pet.Name:ClearAllPoints()
	pet.Name:Point("CENTER", pet.Panel, "CENTER", 0, 0) 
	pet.Name:SetFont(C.media.caith, 12)
end
