local T, C, L, G = unpack(Tukui) 

-- chatframes
do	
	T.ChatSetup = function()
		FCF_ResetChatWindows()
		FCF_SetLocked(ChatFrame1, 1)
		FCF_DockFrame(ChatFrame2)
		FCF_SetLocked(ChatFrame2, 1)
		FCF_OpenNewWindow(L.chat_general)
		FCF_UnDockFrame(ChatFrame3)
		FCF_SetTabPosition(ChatFrame3, 0)
		
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			local id = frame:GetID()

			-- set default tukui font size
			FCF_SetChatWindowFontSize(nil, frame, 12)
			
			-- set the size of chat frames
			frame:Size(T.InfoLeftRightWidth + 1, 111)
			
			-- tell wow that we are using new size
			SetChatWindowSavedDimensions(id, T.Scale(T.InfoLeftRightWidth + 1), T.Scale(111))
			
			-- save new default position and dimension
			FCF_SavePositionAndDimensions(frame)
			
			-- temp setup
			if i == 1 then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMLEFT", 5, 5)
				frame:SetPoint("TOPRIGHT", TukuiChatBackgroundLeft, "TOPRIGHT", -5, -5)
			elseif i == 3 then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", TukuiChatBackgroundRight, "BOTTOMLEFT", 5, 5)
				frame:SetPoint("TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -5, -5)
				frame:SetJustifyH("LEFT")
			end

			-- set chat names
			if i == 1 then FCF_SetWindowName(frame, "G, S & W") end
			if i == 2 then FCF_SetWindowName(frame, "Combat Log") end
			if i == 3 then FCF_SetWindowName(frame, "Loot & Trade") end
			
			if T.SetDefaultChatPosition then
				T.SetDefaultChatPosition(frame)
			end
		end
		
		ChatFrame_RemoveAllMessageGroups(ChatFrame1)
		ChatFrame_RemoveChannel(ChatFrame1, L.chat_trade) -- erf, it seem we need to localize this now
		ChatFrame_RemoveChannel(ChatFrame1, L.chat_general) -- erf, it seem we need to localize this now
		ChatFrame_RemoveChannel(ChatFrame1, L.chat_defense) -- erf, it seem we need to localize this now
		ChatFrame_RemoveChannel(ChatFrame1, L.chat_recrutment) -- erf, it seem we need to localize this now
		ChatFrame_RemoveChannel(ChatFrame1, L.chat_lfg) -- erf, it seem we need to localize this now
		ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
		ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
		ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
		ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
		ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
		ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
		ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
		ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
		ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
		ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
		ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
		ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
		ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
		ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
		ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
		ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
		ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
		ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
		ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
		ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")
		ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
		ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
		ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
		ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
		ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
		ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
		ChatFrame_AddMessageGroup(ChatFrame1, "DND")
		ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
		ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
		ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
		ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")

		ChatFrame_RemoveAllMessageGroups(ChatFrame3)
		ChatFrame_AddChannel(ChatFrame3, L.chat_trade)
		ChatFrame_AddChannel(ChatFrame3, L.chat_general)
		ChatFrame_AddChannel(ChatFrame3, L.chat_defense)
		ChatFrame_AddChannel(ChatFrame3, L.chat_recrutment)
		ChatFrame_AddChannel(ChatFrame3, L.chat_lfg)
		ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
		ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_GUILD_XP_GAIN")
		ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
		ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
		ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
		ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
		ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
		ChatFrame_AddMessageGroup(ChatFrame3, "OPENING")
		ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")
		
		ToggleChatColorNamesByClassGroup(true, "SAY")
		ToggleChatColorNamesByClassGroup(true, "EMOTE")
		ToggleChatColorNamesByClassGroup(true, "YELL")
		ToggleChatColorNamesByClassGroup(true, "GUILD")
		ToggleChatColorNamesByClassGroup(true, "OFFICER")
		ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
		ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
		ToggleChatColorNamesByClassGroup(true, "WHISPER")
		ToggleChatColorNamesByClassGroup(true, "PARTY")
		ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
		ToggleChatColorNamesByClassGroup(true, "RAID")
		ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
		ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
		ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
		ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
		ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
		ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
		ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
		ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")
	end

	T.SetDefaultChatPosition = function(frame)
		if frame then
			local id = frame:GetID()
			local name = FCF_GetChatWindowInfo(id)
			
			-- lock them if unlocked
			if not frame.isLocked then FCF_SetLocked(frame, 1) end
		end
	end
	hooksecurefunc("FCF_RestorePositionAndDimensions", T.SetDefaultChatPosition)
	
	local function SetupStyle(self, event, ...)
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			local chat = frame:GetName()
			local tab = _G[chat.."Tab"]
		
			-- setup chat font
			_G[chat]:SetFont(C.media.caith, select(2, _G[chat]:GetFont()))

			-- move editbox			
			_G[chat.."EditBox"]:ClearAllPoints()
			_G[chat.."EditBox"]:SetFont(C.media.caith, 12)
			_G[chat.."EditBox"]:Point("TOPLEFT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"]:Point("BOTTOMRIGHT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"].backdrop:ClearAllPoints()
			_G[chat.."EditBox"].backdrop:Point("TOPLEFT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"].backdrop:Point("BOTTOMRIGHT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"].backdrop:SetBackdropBorderColor(1, 0, 0)

			-- tab text
			_G[chat.."TabText"]:Hide()
			_G[chat.."TabText"]:SetFont(C.media.caith, 10)
			tab:HookScript("OnEnter", function() _G[chat.."TabText"]:Show() end)
			tab:HookScript("OnLeave", function() _G[chat.."TabText"]:Hide() end)
			
			-- setup chat positions
			if i == 1 then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMLEFT", 5, 5)
				frame:SetPoint("TOPRIGHT", TukuiChatBackgroundLeft, "TOPRIGHT", -5, -5)
			elseif i == 3 then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", TukuiChatBackgroundRight, "BOTTOMLEFT", 5, 5)
				frame:SetPoint("TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -5, -5)
				frame:SetJustifyH("LEFT")
			end
		end
	end
	
	local function SetupChat(self)	
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			SetupStyle(frame)
			FCFTab_UpdateAlpha(frame)
		end
	end

	TukuiChat:RegisterEvent("ADDON_LOADED")
	TukuiChat:HookScript("OnEvent", function(self, event, addon)
		if addon == "Blizzard_CombatLog" then
			self:UnregisterEvent("ADDON_LOADED")
			SetupChat(self)
		end
	end)
end