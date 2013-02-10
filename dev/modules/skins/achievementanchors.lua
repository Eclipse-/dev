-- gtfo stupid frames

local AlertFrameHolder = CreateFrame("Frame", "AlertFrameHolder", UIParent)
AlertFrameHolder:SetWidth(180)
AlertFrameHolder:SetHeight(20)
AlertFrameHolder:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 300)
 
local POSITION, ANCHOR_POINT, YOFFSET = "BOTTOM", "TOP", 10
 
local function fixAnchors()
	if POSITION == 'TOP' then
		ANCHOR_POINT = 'BOTTOM'
		YOFFSET = -10
	else
		ANCHOR_POINT = 'TOP'
		YOFFSET = 10
	end
	
	AlertFrame:ClearAllPoints()
	AlertFrame:SetAllPoints(AlertFrameHolder)
 
	GroupLootContainer:ClearAllPoints()
	GroupLootContainer:SetPoint(POSITION, AlertFrame, ANCHOR_POINT)
	
	MissingLootFrame:ClearAllPoints()
	MissingLootFrame:SetPoint(POSITION, AlertFrame, ANCHOR_POINT)
	
	AlertFrame_FixAnchors()
end
hooksecurefunc("AlertFrame_FixAnchors", fixAnchors)
 
local function AlertFrame_SetLootWonAnchors(alertAnchor)
	for i=1, #LOOT_WON_ALERT_FRAMES do
		local frame = LOOT_WON_ALERT_FRAMES[i];
		if ( frame:IsShown() ) then
			frame:ClearAllPoints()
			frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
			alertAnchor = frame
		end
	end
end
hooksecurefunc("AlertFrame_SetLootWonAnchors", AlertFrame_SetLootWonAnchors)
 
local function AlertFrame_SetMoneyWonAnchors(alertAnchor)
	for i=1, #MONEY_WON_ALERT_FRAMES do
		local frame = MONEY_WON_ALERT_FRAMES[i];
		if ( frame:IsShown() ) then
			frame:ClearAllPoints()
			frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
			alertAnchor = frame
		end
	end
end
hooksecurefunc("AlertFrame_SetMoneyWonAnchors", AlertFrame_SetMoneyWonAnchors)
 
local function AlertFrame_SetAchievementAnchors(alertAnchor)
	if ( AchievementAlertFrame1 ) then
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			local frame = _G["AchievementAlertFrame"..i];
			if ( frame and frame:IsShown() ) then
				frame:ClearAllPoints()
				frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
				alertAnchor = frame
			end
		end
	end
end
hooksecurefunc("AlertFrame_SetAchievementAnchors", AlertFrame_SetAchievementAnchors)
 
local function AlertFrame_SetCriteriaAnchors(alertAnchor)
	if ( CriteriaAlertFrame1 ) then
		for i = 1, MAX_ACHIEVEMENT_ALERTS do
			local frame = _G["CriteriaAlertFrame"..i];
			if ( frame and frame:IsShown() ) then
				frame:ClearAllPoints()
				frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
				alertAnchor = frame
			end
		end
	end
end
hooksecurefunc("AlertFrame_SetCriteriaAnchors", AlertFrame_SetCriteriaAnchors)
 
local function AlertFrame_SetChallengeModeAnchors(alertAnchor)
	local frame = ChallengeModeAlertFrame1;
	if ( frame:IsShown() ) then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
	end
end
hooksecurefunc("AlertFrame_SetChallengeModeAnchors", AlertFrame_SetChallengeModeAnchors)
 
local function AlertFrame_SetDungeonCompletionAnchors(alertAnchor)
	local frame = DungeonCompletionAlertFrame1;
	if ( frame:IsShown() ) then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
	end
end
hooksecurefunc("AlertFrame_SetDungeonCompletionAnchors", AlertFrame_SetDungeonCompletionAnchors)
 
local function AlertFrame_SetScenarioAnchors(alertAnchor)
	local frame = ScenarioAlertFrame1;
	if ( frame:IsShown() ) then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
	end
end
hooksecurefunc("AlertFrame_SetScenarioAnchors", AlertFrame_SetScenarioAnchors)
 
local function AlertFrame_SetGuildChallengeAnchors(alertAnchor)
	local frame = GuildChallengeAlertFrame;
	if ( frame:IsShown() ) then
		frame:ClearAllPoints()
		frame:SetPoint(POSITION, alertAnchor, ANCHOR_POINT, 0, YOFFSET);
	end
end
hooksecurefunc("AlertFrame_SetGuildChallengeAnchors", AlertFrame_SetGuildChallengeAnchors)

-- testing
SlashCmdList.TEST_ACHIEVEMENT = function()
	PlaySound("LFG_Rewards")
	AchievementFrame_LoadUI()
	AchievementAlertFrame_ShowAlert(5780)
	AchievementAlertFrame_ShowAlert(5000)
	GuildChallengeAlertFrame_ShowAlert(3, 2, 5)
	ChallengeModeAlertFrame_ShowAlert()
	CriteriaAlertFrame_GetAlertFrame()
	AlertFrame_AnimateIn(CriteriaAlertFrame1)
	AlertFrame_AnimateIn(DungeonCompletionAlertFrame1)
	AlertFrame_AnimateIn(ScenarioAlertFrame1)
	AlertFrame_FixAnchors()
end
SLASH_TEST_ACHIEVEMENT1 = "/testalerts"
