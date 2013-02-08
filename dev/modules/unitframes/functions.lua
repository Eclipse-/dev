local T, C, L, G = unpack(Tukui)

function T.UnitframePanels(self, unit)
	
	local frame = CreateFrame("Frame", self:GetName().."_Background", self)
	frame:SetFrameLevel(self.Health:GetFrameLevel() - 1)
	frame:SetFrameStrata(self.Health:GetFrameStrata())
	frame:Point("TOPLEFT", self.Health, -2, 2)
	if self.Power then
		frame:Point("BOTTOMRIGHT", self.Power, 2, -2)
	else
		frame:Point("BOTTOMRIGHT", self.Health, 2, -2)
	end
	frame:SetTemplate("Default")
	frame:CreateShadow()
	self.Background = frame
	
	if unit == "player" or unit =="target" then
		local spacer = CreateFrame("Frame", self:GetName().."_Spacer", self)
		spacer:SetFrameLevel(self.Health:GetFrameLevel() + 1)
		spacer:SetFrameStrata(self.Health:GetFrameStrata())
		spacer:Point("TOPLEFT", self.Health, "BOTTOMLEFT", -1, -1)
		spacer:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", 1, -1)
		spacer:Height(1)
		spacer:SetBackdrop({
			bgFile = C["media"].blank,
			insets = { left = 0, right = 0, top = 0, bottom = 0 }
		})
		spacer:SetBackdropColor(unpack(C["media"].bordercolor))
	end

	if unit == "player" or unit == "target" or unit == "pet" or unit == "targettarget" then
		local panel = CreateFrame("Frame", self:GetName().."_Panel", self)
		panel:Point("TOPLEFT", frame, "BOTTOMLEFT", 0, -3)
		panel:Point("TOPRIGHT", frame, "BOTTOMRIGHT", 0, -3)
		panel:Height(19)
		panel:SetTemplate("Default")
		panel:CreateShadow()
		self.Panel = panel
	end
	
	self.Health:SetStatusBarTexture(C.media.empath)
	
	if self.Power then
		self.Power:SetStatusBarTexture(C.media.empath)
	end
	
	if self.Castbar then
		local castbg = CreateFrame("Frame", self:GetName().."_CastBackground", self.Castbar)
		castbg:SetFrameLevel(self.Health:GetFrameLevel() - 1)
		castbg:SetFrameStrata(self.Health:GetFrameStrata())
		castbg:SetTemplate("Default")
		castbg:CreateShadow()
		castbg:Point("TOPLEFT", -2, 2)
		castbg:Point("BOTTOMRIGHT", 2, -2)
		self.CastbarBG = castbg
		
		self.Castbar.Time = T.SetFontString(self.Castbar, C.media.caith, 12)
		self.Castbar.Text:SetShadowOffset(1, -1)
		self.Castbar.Time:ClearAllPoints()
		self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)
		self.Castbar.Time:SetTextColor(1, 1, 1)

		self.Castbar.Text = T.SetFontString(self.Castbar, C.media.caith, 12)
		self.Castbar.Text:SetShadowOffset(1, -1)
		self.Castbar.Text:ClearAllPoints()
		self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
		self.Castbar.Text:SetTextColor(1, 1, 1)

		if self.Castbar.Icon then
			self.Castbar.button:Size(T.buttonsize)
		end
		
		self.Castbar:SetStatusBarTexture(C.media.empath)
	end
end


T.DruidBarDisplay = function(self, login)
	local eb = self.EclipseBar
	local m = self.WildMushroom
	local dm = self.DruidMana
	local shadow = self.shadow
	local bg = self.DruidManaBackground
	local flash = self.FlashInfo

	if login then
		dm:SetScript("OnUpdate", nil)
	end
	
	if dm and dm:IsShown() then
		shadow:Point("TOPLEFT", -4, 12)
		bg:SetAlpha(1)
	else
		flash:Show()
		shadow:Point("TOPLEFT", -4, 4)
		if bg then bg:SetAlpha(0) end
	end
		
	if (eb and eb:IsShown()) or (dm and dm:IsShown()) then
		if eb and eb:IsShown() then
			local txt = self.EclipseBar.Text
			txt:Show()
			flash:Hide()
		end
		shadow:Point("TOPLEFT", -4, 12)
		if bg then bg:SetAlpha(1) end
		
		-- mushroom
		if m and m:IsShown() then
			shadow:Point("TOPLEFT", -4, 21)
			m:ClearAllPoints()
			m:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 16)
		end
	else
		if eb then
			local txt = self.EclipseBar.Text
			txt:Hide()
		end
		flash:Show()
		shadow:Point("TOPLEFT", -4, 4)
		if bg then bg:SetAlpha(0) end
		
		-- mushroom
		if m and m:IsShown() then
			shadow:Point("TOPLEFT", -4, 12)
			m:ClearAllPoints()
			m:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
		end
	end
end

T.PostNamePosition = function(self)
	self.Name:ClearAllPoints()
	if (self.Power.value:GetText() and UnitIsEnemy("player", "target") and C["unitframes"].targetpowerpvponly == true) or (self.Power.value:GetText() and C["unitframes"].targetpowerpvponly == false) then
		self.Name:SetPoint("CENTER", self.Panel, "CENTER", 0, 0)
	else
		self.Power.value:SetAlpha(0)
		self.Name:SetPoint("LEFT", self.Panel, "LEFT", 4, 0)
	end
end

T.ComboPointsBarUpdate = function(self, parent, points)
	local b = parent.Buffs
		
	if T.myclass == "ROGUE" and C.unitframes.movecombobar then
		-- always show we this option enabled
		self:Show()
	else
		if points > 0 then
			if b then 
				b:ClearAllPoints() 
				b:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", -2, 19)
			end
		else
			if b then 
				b:ClearAllPoints() 
				b:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", -2, 5)
			end
		end
	end
end

T.UpdateTargetDebuffsHeader = function(self)
	local numBuffs = self.visibleBuffs
	local perRow = self.numRow
	local s = self.size
	local row = math.ceil((numBuffs / perRow))
	local p = self:GetParent()
	local h = p.Debuffs
	local y = s * row
	local addition = s
	
	if numBuffs == 0 then addition = 0 end
	h:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", (T.lowversion and 0) or -2, y + addition + 2)
end
