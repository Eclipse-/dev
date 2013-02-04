local T, C, L, G = unpack(Tukui) 

-- chatframes
do	
	local function setUpChat(self, event, ...)
		-- modify channels
		ChatFrame_RemoveAllMessageGroups(ChatFrame4)
		ChatFrame_AddChannel(ChatFrame4, L.chat_trade)
		ChatFrame_AddChannel(ChatFrame4, L.chat_general)
		ChatFrame_AddChannel(ChatFrame4, L.chat_defense)
		ChatFrame_AddChannel(ChatFrame4, L.chat_recrutment)
		ChatFrame_AddChannel(ChatFrame4, L.chat_lfg)
		ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_XP_GAIN")
		ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_HONOR_GAIN")
		ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_FACTION_CHANGE")
		ChatFrame_AddMessageGroup(ChatFrame4, "LOOT")
		ChatFrame_AddMessageGroup(ChatFrame4, "MONEY")

		-- hide unused chat
		ChatFrame3:Hide()

		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			local chat = frame:GetName()
			local tab = _G[chat.."Tab"]

			-- move editbox
			_G[chat.."EditBox"]:ClearAllPoints()
			_G[chat.."EditBox"]:Point("TOPLEFT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"]:Point("BOTTOMRIGHT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"].backdrop:ClearAllPoints()
			_G[chat.."EditBox"].backdrop:Point("TOPLEFT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"].backdrop:Point("BOTTOMRIGHT", TukuiInfoLeft, 0, 0)
			_G[chat.."EditBox"].backdrop:SetBackdropBorderColor(1, 0, 0)

			-- tab text
			_G[chat.."TabText"]:Hide()
			tab:HookScript("OnEnter", function() _G[chat.."TabText"]:Show() end)
			tab:HookScript("OnLeave", function() _G[chat.."TabText"]:Hide() end)

			-- set positions
			if i == 1 then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMLEFT", 5, 5)
				frame:SetPoint("TOPRIGHT", TukuiChatBackgroundLeft, "TOPRIGHT", -5, -5)
			elseif i == 4 then
				frame:ClearAllPoints()
				frame:SetPoint("BOTTOMLEFT", TukuiChatBackgroundRight, "BOTTOMLEFT", 5, 5)
				frame:SetPoint("TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -5, -5)
				frame:SetJustifyH("LEFT")
			end

			-- set chat names
			if i == 1 then FCF_SetWindowName(frame, "G, S & W") end
			if i == 2 then FCF_SetWindowName(frame, "Combat Log") end
			if i == 4 then FCF_SetWindowName(frame, "Loot & Trade") end
		end
	end
	
	local frame = CreateFrame("frame", nil);
	frame:RegisterEvent("PLAYER_ENTERING_WORLD");
	frame:SetScript("OnEvent", setUpChat);
end