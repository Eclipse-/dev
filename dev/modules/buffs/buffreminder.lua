-------------------------------------------------------------------------------------------
-- CHECK CONFIG HERE FOR ENABLING OR DISABLING THIS MODULE
-- TO BE ADDED!
-------------------------------------------------------------------------------------------

-- remove comment to disable module
--return

--------------------------------------------------------------------------------------------
-- Spells that should be shown with an icon in the middle of the screen when not buffed.
--------------------------------------------------------------------------------------------

SpellIDs = {
	PRIEST = {
		588, -- inner fire
		73413, -- inner will
	},
	MAGE = {
		7302, -- frost armor
		6117, -- mage armor
		30482, -- molten armor
	},
	WARLOCK = {
		28176, -- fel armor
		687, -- demon armor
	},
	WARRIOR = {
		6673, -- battle Shout
		57330, -- horn of Winter
	},
	DEATHKNIGHT = {
		57330, -- horn of Winter
		6673, -- battle Shout
	},
	MONK = {
		117667, -- Legacy of The Emperor
		20217, -- Blessing Of Kings
		90363, -- Embrace of the Shale Spider
		1126 -- Mark of The Wild
	}
}

-- Nasty stuff below. Don't touch.
local class = select(2, UnitClass("Player"))
local buffs = SpellIDs[class]
local sound

if (buffs and buffs[1]) then
	local function OnEvent(self, event)	
		if (event == "PLAYER_LOGIN" or event == "LEARNED_SPELL_IN_TAB") then
			for i, buff in pairs(buffs) do
				local name = GetSpellInfo(buff)
				local usable, nomana = IsUsableSpell(name)
				if (usable or nomana) then
					self.icon:SetTexture(select(3, GetSpellInfo(buff)))
					break
				end
			end
			if (not self.icon:GetTexture() and event == "PLAYER_LOGIN") then
				self:UnregisterAllEvents()
				self:RegisterEvent("LEARNED_SPELL_IN_TAB")
				return
			elseif (self.icon:GetTexture() and event == "LEARNED_SPELL_IN_TAB") then
				self:UnregisterAllEvents()
				self:RegisterEvent("UNIT_AURA")
				self:RegisterEvent("PLAYER_LOGIN")
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
				self:RegisterEvent("PLAYER_REGEN_DISABLED")
			end
		end
				
		if (UnitAffectingCombat("player") and not UnitInVehicle("player")) then
			for i, buff in pairs(buffs) do
				local name = GetSpellInfo(buff)
				if (name and UnitBuff("player", name)) then
					self:FadeOut()
					return
				end
			end
			self:FadeIn()
		else
			self:FadeOut()
		end
	end
	
	local frame = CreateFrame("Frame", _, UIParent)
	frame:SetTemplate("Default")
	frame:Size(60)
	frame:SetAlpha(1)
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
	frame:CreateShadow()
	
	frame.icon = frame:CreateTexture(nil, "OVERLAY")
	frame.icon:SetPoint("CENTER")
	frame.icon:SetTexCoord(.07, .93, .07, .93)
	frame.icon:Size(frame:GetSize() - 4)

	function frame:FadeIn()
		UIFrameFadeIn(self, (0.3 * (1-self:GetAlpha())), self:GetAlpha(), 1)
	end
	
	function frame:FadeOut()
		UIFrameFadeOut(self, (0.3 * (0+self:GetAlpha())), self:GetAlpha(), 0)
	end

	frame:RegisterEvent("UNIT_AURA")
	frame:RegisterEvent("PLAYER_LOGIN")
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
	frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
	frame:RegisterEvent("UNIT_EXITING_VEHICLE")
	frame:RegisterEvent("UNIT_EXITED_VEHICLE")
	
	frame:SetScript("OnEvent", OnEvent)
end