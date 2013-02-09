local T, C, L, G = unpack(Tukui) 

local targettarget = G.UnitFrames.TargetTarget
local adjustXY = 0

do
	-- kill
	targettarget.panel:Kill()
	targettarget.shadow:Kill()
	targettarget:SetBackdrop(nil)
	
	-- setup
	T.UnitframePanels(targettarget, "targettarget")
	
	-- size
	targettarget:Size(129, 36)
	
	-- position
	targettarget:ClearAllPoints()
	targettarget:Point("TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -6+adjustXY)

	-- health bar
	targettarget.Health:Height(18)
	
	-- targettarget text
	targettarget.Name:ClearAllPoints()
	targettarget.Name:Point("CENTER", targettarget.Panel, "CENTER", 0, 0) 
	targettarget.Name:SetFont(C.media.caith, 12)
end
