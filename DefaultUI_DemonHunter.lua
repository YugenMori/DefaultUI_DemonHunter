-- Author: Yugen
--
-- Supports any version of wow
--
-- Dark Minimalist UI for World of Warcraft
--------------------------------------------------------------
-- DefaultUI_DemonHunter
--------------------------------------------------------------
-- Init - Tables - Saves
local addonName, addonTable = ...
local L = LibStub("AceLocale-3.0"):GetLocale("DefaultUI_DemonHunter")
local GetWoWVersion = ((select(4, GetBuildInfo())))
--local texturepackCheck    = "1.0.1.7"
--local texturepackDate     = "26/11/20"
local f = CreateFrame("Frame", "DefaultUI_DemonHunter_Config", UIParent)
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
  character = UnitName("player").."-"..GetRealmName()
  -- Config/Panel
  if not DefaultUI_DemonHunter_Config then
    local DefaultUI_DemonHunter_Config = {}
  end
  -- Color Init
  if not COLOR_MY_UI then
      COLOR_MY_UI = {}
  end
  if not COLOR_MY_UI[character] then
      COLOR_MY_UI[character] = {}
  end
  if not COLOR_MY_UI[character].Color then
      COLOR_MY_UI[character].Color = { r = 1, g = 1, b = 1 }
  end
end)
local dialogFrameTexture 		= "Interface\\Addons\\DefaultUI_DemonHunter\\textures\\extra\\dialogFrameTexture"
local dialogFrameTextureBorder 	= "Interface\\DialogFrame\\UI-DialogBox-Background"
-- Fontfication
local function AbyssUI_Fontification(globalFont, subFont, damageFont)
local locale = GetLocale()
local fontName, fontHeight, fontFlags = MinimapZoneText:GetFont()
local mediaFolder = "Interface\\AddOns\\AbyssUI\\textures\\font\\"
  if (locale == "zhCN") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont     = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif (locale == "zhTW") then
    globalFont  = mediaFolder.."zhCN-TW\\senty.ttf"
    subFont     = mediaFolder.."zhCN-TW\\senty.ttf"
    damageFont  = mediaFolder.."zhCN-TW\\senty.ttf"
  elseif (locale == "ruRU") then
    globalFont  = mediaFolder.."ruRU\\dejavu.ttf"
    subFont     = mediaFolder.."ruRU\\dejavu.ttf"
    damageFont  = mediaFolder.."ruRU\\dejavu.ttf"
  elseif (locale == "koKR") then
    globalFont  = mediaFolder.."koKR\\dxlbab.ttf"
    subFont     = mediaFolder.."koKR\\dxlbab.ttf"
    damageFont  = mediaFolder.."koKR\\dxlbab.ttf"
  elseif (locale == "frFR" or locale == "deDE" or locale == "enGB" or locale == "enUS" or locale == "itIT" or
    locale == "esES" or locale == "esMX" or locale == "ptBR") then
    globalFont  = mediaFolder.."global.ttf"
    subFont     = mediaFolder.."npcfont.ttf"
    damageFont  = mediaFolder.."damagefont.ttf"
  else
    globalFont  = fontName
    subFont     = fontName
    damageFont  = fontName
  end
  return globalFont, subFont, damageFont
end
-- declarations
local globalFont, subFont, damageFont = AbyssUI_Fontification(globalFont, subFont, damageFont)

-- AbyssUIFirstFrame
local AbyssUIFirstFrame = CreateFrame("Frame", "AbyssUIFirstFrame", UIParent)
AbyssUIFirstFrame:Hide()
AbyssUIFirstFrame:SetWidth(GetScreenWidth())
AbyssUIFirstFrame:SetHeight(GetScreenHeight())
AbyssUIFirstFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUIFirstFrame:EnableMouse(true)
AbyssUIFirstFrame:SetFrameStrata("HIGH")
AbyssUIFirstFrame.text = AbyssUIFirstFrame.text or AbyssUIFirstFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUIFirstFrame.text:SetScale(5)
AbyssUIFirstFrame.text:SetAllPoints(true)
AbyssUIFirstFrame.text:SetJustifyH("CENTER")
AbyssUIFirstFrame.text:SetJustifyV("CENTER")
AbyssUIFirstFrame.text:SetText(L["Thank you for choosing Default|cff0d75d4UI|r!"])
----------------------------------------------------
local Subtittle = CreateFrame("Frame", "$parentSubtittle", AbyssUIFirstFrame)
Subtittle:SetWidth(GetScreenWidth())
Subtittle:SetHeight(GetScreenHeight())
Subtittle:SetPoint("CENTER", AbyssUIFirstFrame, "CENTER", 0, -50)
Subtittle:EnableMouse(false)
Subtittle:SetFrameStrata("HIGH")
Subtittle.text = Subtittle.text or Subtittle:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
Subtittle.text:SetScale(3)
Subtittle.text:SetAllPoints(true)
Subtittle.text:SetJustifyH("CENTER")
Subtittle.text:SetJustifyV("CENTER")
Subtittle.text:SetText(L["The improved World of Warcraft user interface."])
----------------------------------------------------
local AbyssUIBorder = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
--AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUIFirstFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUIFirstFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUIFirstFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUIFirstFrame)
AbyssUIFirstFrame.texture = Texture
----------------------------------------------------
local CloseButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
CloseButton:SetHeight(40)
CloseButton:SetWidth(40)
CloseButton:SetPoint("TOPRIGHT", AbyssUIFirstFrame, "TOPRIGHT", 0, 0)
CloseButton:SetText("x")
----------------------------------------------------
local BorderCloseButton = CloseButton:CreateTexture(nil, "ARTWORK")
BorderCloseButton:SetTexture(dialogFrameTextureBorder)
BorderCloseButton:SetAllPoints(CloseButton)
CloseButton:SetScript("OnClick", function()
	AbyssUIFirstFrame:Hide()
	AbyssUISecondFrame:Show()
end)
----------------------------------------------------
local FrameButton = CreateFrame("Button", "$parentFrameButton", AbyssUIFirstFrame, "UIPanelButtonTemplate")
FrameButton:SetHeight(GetScreenHeight())
FrameButton:SetWidth(GetScreenWidth())
FrameButton:SetPoint("CENTER", AbyssUIFirstFrame, "CENTER", 0, 0)
FrameButton:SetAlpha(0)
FrameButton:SetScript("OnClick", function()
	UIFrameFadeIn(AbyssUIFirstFrame, 1, 1, 0)
	C_Timer.After(1, function()
		AbyssUIFirstFrame:Hide()
		UIFrameFadeIn(AbyssUISecondFrame, 1, 0, 1)
	end)
end)
----------------------------------------------------
-- AbyssUISecondFrame
local AbyssUISecondFrame = CreateFrame("Frame", "AbyssUISecondFrame", UIParent)
AbyssUISecondFrame:Hide()
AbyssUISecondFrame:SetWidth(GetScreenWidth())
AbyssUISecondFrame:SetHeight(GetScreenHeight())
AbyssUISecondFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0)
AbyssUISecondFrame:EnableMouse(false)
AbyssUISecondFrame:SetFrameStrata("HIGH")
AbyssUISecondFrame.text = AbyssUISecondFrame.text or AbyssUISecondFrame:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
AbyssUISecondFrame.text:SetScale(3)
AbyssUISecondFrame.text:SetAllPoints()
AbyssUISecondFrame.text:SetText(L["Let's save the variables and prepare the interface for the first use.\n"
.."To do this, click on the screen or just reload the UI /reload."])
----------------------------------------------------
local AbyssUIBorder = AbyssUISecondFrame:CreateTexture(nil, "BACKGROUND")
AbyssUIBorder:SetTexture(dialogFrameTextureBorder)
AbyssUIBorder:SetPoint("TOPLEFT", -3, 3)
AbyssUIBorder:SetPoint("BOTTOMRIGHT", 3, -3)
--AbyssUIBorder:SetVertexColor(0.2, 0.2, 0.2, 0.6)
----------------------------------------------------
local BorderBody = AbyssUISecondFrame:CreateTexture(nil, "ARTWORK")
BorderBody:SetTexture(dialogFrameTextureBorder)
BorderBody:SetAllPoints(AbyssUISecondFrame)
BorderBody:SetVertexColor(0.34, 0.34, 0.34, 0.7)
----------------------------------------------------
local Texture = AbyssUISecondFrame:CreateTexture(nil, "BACKGROUND")
Texture:SetTexture(dialogFrameTextureBorder)
Texture:SetAllPoints(AbyssUISecondFrame)
AbyssUISecondFrame.texture = Texture
-- Close and reload
local f = CreateFrame("Frame", nil)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function() 
	local FrameButtonConfirm = CreateFrame("Button","$parentFrameButtonConfirm", AbyssUISecondFrame, "UIPanelButtonTemplate")
	FrameButtonConfirm:SetHeight(48)
	FrameButtonConfirm:SetWidth(120)
	FrameButtonConfirm:SetPoint("CENTER", AbyssUISecondFrame, "CENTER", 0, -80)
	FrameButtonConfirm.text = FrameButtonConfirm.text or FrameButtonConfirm:CreateFontString(nil, "ARTWORK", "QuestMapRewardsFont")
	FrameButtonConfirm.text:SetFont(globalFont, 14)
	FrameButtonConfirm.text:SetScale(1.4)
	FrameButtonConfirm.text:SetPoint("CENTER", FrameButtonConfirm, "CENTER", 0, 0)
	FrameButtonConfirm.text:SetText(L["Confirm"])
	FrameButtonConfirm:SetScript("OnClick", function()
		AbyssUISecondFrame:Hide()
		ReloadUI()
	end)
end)
local function AbyssUI_ColorizationFrameFunction(...)
	local v = ...
	if AbyssUIAddonSettings.UIVertexColorFrames01 == true then
		v:SetVertexColor(1, 1, 1)
	elseif AbyssUIAddonSettings.UIVertexColorFrames02 == true then
		v:SetVertexColor(.2, .2, .2)
	elseif AbyssUIAddonSettings.UIVertexColorFrames03 == true then
		v:SetVertexColor(182/255, 42/255, 37/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames04 == true then
		v:SetVertexColor(236/255, 193/255, 60/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames05 == true then
		v:SetVertexColor(196/255, 31/255, 59/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames06 == true then
		v:SetVertexColor(163/255, 48/255, 201/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames07 == true then
		v:SetVertexColor(252/255, 163/255, 85/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames08 == true then
		v:SetVertexColor(190/255, 221/255, 115/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames09 == true then
		v:SetVertexColor(64/255, 220/255, 255/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames10 == true then
		v:SetVertexColor(86/255, 255/255, 184/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames11 == true then
		v:SetVertexColor(255/255, 155/255, 195/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames12 == true then
		v:SetVertexColor(23/255, 28/255, 99/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames13 == true then
		v:SetVertexColor(255/255, 255/255, 0/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames14 == true then
		v:SetVertexColor(0/255, 112/255, 222/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames15 == true then
		v:SetVertexColor(135/255, 135/255, 237/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames16 == true then
		v:SetVertexColor(199/255, 156/255, 110/255)
	elseif AbyssUIAddonSettings.UIVertexColorFrames17 == true then
		v:SetVertexColor(51/255, 147/255, 127/255)
	elseif AbyssUIAddonSettings.UIVertexColorFramesColorPicker == true then
		local character = UnitName("player").."-"..GetRealmName()
		v:SetVertexColor(COLOR_MY_UI[character].Color.r, COLOR_MY_UI[character].Color.g, COLOR_MY_UI[character].Color.b)	
	else
		v:SetVertexColor(163/255, 48/255, 201/255)
	end
end
--
local BasicFrames = CreateFrame("Frame")
BasicFrames:RegisterEvent("ADDON_LOADED")
BasicFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "DefaultUI_DemonHunter") then
		for i, v in pairs({	
			PlayerFrameTexture,
			TargetFrameTextureFrameTexture,
			PetFrameTexture,
			PartyMemberFrame1Texture,
			PartyMemberFrame2Texture,
			PartyMemberFrame3Texture,
			PartyMemberFrame4Texture,
			PartyMemberFrame1PetFrameTexture,
			PartyMemberFrame2PetFrameTexture,
			PartyMemberFrame3PetFrameTexture,
			PartyMemberFrame4PetFrameTexture,
			FocusFrameTextureFrameTexture,
			TargetFrameToTTextureFrameTexture,
			FocusFrameToTTextureFrameTexture,
			BonusActionBarFrameTexture0,
			BonusActionBarFrameTexture1,
			BonusActionBarFrameTexture2,
			BonusActionBarFrameTexture3,
			BonusActionBarFrameTexture4,
			MainMenuBarTexture0,
			MainMenuBarTexture1,
			MainMenuBarTexture2,
			MainMenuBarTexture3,
			MainMenuMaxLevelBar0,
			MainMenuMaxLevelBar1,
			MainMenuMaxLevelBar2,
			MainMenuMaxLevelBar3,
			MainMenuBarTextureExtender,
			MinimapBorder,
			MinimapBorderTop,
			CastingBarFrameBorder,
			FocusFrameSpellBarBorder,
			TargetFrameSpellBarBorder,
			MiniMapTrackingButtonBorder,
			MiniMapLFGFrameBorder,
			MiniMapBattlefieldBorder,
		MiniMapMailBorder, }) do
			if (GetWoWVersion <= 90500) then
				MiniMapWorldMapButton:SetAlpha(0.3)
			end
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
		self:UnregisterEvent("ADDON_LOADED")
		BasicFrames:SetScript("OnEvent", nil)
	end
end)
-- Dark Unit Frames Exception
local DarkException = CreateFrame("Frame")
DarkException:RegisterEvent("ADDON_LOADED")
DarkException:SetScript("OnEvent", function(self, event, addon)
	if (addon == "DefaultUI_DemonHunter") then
		for i, v in pairs({
			PlayerFrameTexture,
			TargetFrameTextureFrameTexture,
			PetFrameTexture,
			PartyMemberFrame1Texture,
			PartyMemberFrame2Texture,
			PartyMemberFrame3Texture,
			PartyMemberFrame4Texture,
			PartyMemberFrame1PetFrameTexture,
			PartyMemberFrame2PetFrameTexture,
			PartyMemberFrame3PetFrameTexture,
			PartyMemberFrame4PetFrameTexture,
			FocusFrameTextureFrameTexture,
			TargetFrameToTTextureFrameTexture,
			FocusFrameToTTextureFrameTexture,
			MinimapBorder,
			MiniMapTrackingButtonBorder,
			MiniMapLFGFrameBorder,
			MiniMapBattlefieldBorder,
			MiniMapMailBorder,
		MiniMapBorderTop, }) do
			if AbyssUIAddonSettings ~= nil then
				if AbyssUIAddonSettings.KeepUnitDark == true then
					v:SetVertexColor(.4, .4, .4)
				elseif AbyssUIAddonSettings.KeepUnitBlizzard == true then
					v:SetVertexColor(1, 1, 1)
				else
					return nil
				end
			end
		end
		self:UnregisterEvent("ADDON_LOADED")
		DarkException:SetScript("OnEvent", nil)
	end
end)
-- Alpha extra frames
local SetAlphaFrames = CreateFrame("Frame")
SetAlphaFrames:RegisterEvent("ADDON_LOADED")
SetAlphaFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "DefaultUI_DemonHunter") then
			for i, v in pairs({
				PaperDollInnerBorderBottom,
				PaperDollInnerBorderBottom2,
				PaperDollInnerBorderLeft,
				PaperDollInnerBorderRight,
				PaperDollInnerBorderTop,
				PaperDollInnerBorderBottomLeft,
				PaperDollInnerBorderBottomRight,
				 }) do
				v:SetAlpha(0)
			end
			if (GetWoWVersion > 30600) then
				for i, v in pairs({
					RecruitAFriendFrame.RecruitList.ScrollFrameInset.NineSlice.BottomLeftCorner,
					RecruitAFriendFrame.RecruitList.ScrollFrameInset.NineSlice.BottomRightCorner,
					RecruitAFriendFrame.RecruitList.ScrollFrameInset.NineSlice.BottomEdge,
					RecruitAFriendFrame.RewardClaiming.Inset.NineSlice.BottomLeftCorner,
					RecruitAFriendFrame.RewardClaiming.Inset.NineSlice.BottomRightCorner,
					RecruitAFriendFrame.RewardClaiming.Inset.NineSlice.BottomEdge,
					 }) do
					v:SetAlpha(0)
				end
			end
			-- End
			self:UnregisterEvent("ADDON_LOADED")
			SetAlphaFrames:SetScript("OnEvent", nil)
		else
			return nil
		end
end)
-- SupportedAddons
--[[
local BagnonSupport = CreateFrame("Frame")
BagnonSupport:RegisterEvent("ADDON_LOADED")
BagnonSupport:SetScript("OnEvent", function(self, event, addon)
	if (addon == "Bagnon") then
		for i, v in pairs({
			BagnonInventoryFrame1.BottomEdge,
			BagnonInventoryFrame1.RightEdge,
			BagnonInventoryFrame1.LeftEdge,
			BagnonInventoryFrame1.TopEdge,
			BagnonInventoryFrame1.BottomEdge,
			BagnonInventoryFrame1.PortraitFrame,
			BagnonInventoryFrame1.TopRightCorner,
			BagnonInventoryFrame1.TopLeftCorner,
			BagnonInventoryFrame1.BottomLeftCorner,
			BagnonInventoryFrame1.BottomRightCorner,
			BagnonInventoryFrame1.Center,
		}) do
			AbyssUI_ColorizationFrameFunction(v)
		end
	end
end)
--]]
-- New Interface
local NewFrames = CreateFrame("Frame")
NewFrames:RegisterEvent("ADDON_LOADED")
NewFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "DefaultUI_DemonHunter") then
		for i, v in pairs({ 
			Boss1TargetFrameTextureFrameTexture,
			Boss2TargetFrameTextureFrameTexture,
			Boss3TargetFrameTextureFrameTexture,
			Boss4TargetFrameTextureFrameTexture,
			MirrorTimer1Border,
			MirrorTimer2Border,
			MirrorTimer3Border, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
		if (GetWoWVersion >= 30600 and GetWoWVersion <= 90500) then
			for i, v in pairs({ 
				MainMenuBarArtFrame.LeftEndCap,
				MainMenuBarArtFrame.RightEndCap,
				MainMenuBarArtFrameBackground.BackgroundSmall,
				MainMenuBarArtFrameBackground.BackgroundLarge, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
		else
			for i, v in pairs({ 
				MainMenuBarLeftEndCap,
				MainMenuBarRightEndCap,  }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
		end		
		----------------------------------------------------------------------
		-- Character
		if (GetWoWVersion > 30600) then
			for i, v in pairs({	
				CharacterFrame.NineSlice.RightEdge,
				CharacterFrame.NineSlice.LeftEdge,
				CharacterFrame.NineSlice.TopEdge,
				CharacterFrame.NineSlice.BottomEdge,
				CharacterFrame.NineSlice.PortraitFrame,
				CharacterFrame.NineSlice.TopRightCorner,
				CharacterFrame.NineSlice.TopLeftCorner,
				CharacterFrame.NineSlice.BottomLeftCorner,
				CharacterFrame.NineSlice.BottomRightCorner,
				CharacterFrameInset.NineSlice.BottomEdge,
				CharacterFrameInset.NineSlice.BottomLeftCorner,
				CharacterFrameInset.NineSlice.BottomRightCorner,
				CharacterFrameInsetRight.NineSlice.BottomEdge,
				CharacterFrameInsetRight.NineSlice.BottomLeftCorner,
				CharacterFrameInsetRight.NineSlice.BottomRightCorner,
				CharacterFrameTab1Left,
				CharacterFrameTab1LeftDisabled,
				CharacterFrameTab1Middle,
				CharacterFrameTab1MiddleDisabled,
				CharacterFrameTab1Right,
				CharacterFrameTab1RightDisabled,
				CharacterFrameTab2Left,
				CharacterFrameTab2LeftDisabled,
				CharacterFrameTab2Middle,
				CharacterFrameTab2MiddleDisabled,
				CharacterFrameTab2Right,
				CharacterFrameTab2RightDisabled,
				CharacterFrameTab3Left,
				CharacterFrameTab3LeftDisabled,
				CharacterFrameTab3Middle,
				CharacterFrameTab3MiddleDisabled,
				CharacterFrameTab3Right,
				CharacterFrameTab3RightDisabled,
				CharacterFrameTab4Left,
				CharacterFrameTab4LeftDisabled,
				CharacterFrameTab4Middle,
				CharacterFrameTab4MiddleDisabled,
				CharacterFrameTab4Right,
				CharacterFrameTab4RightDisabled,
				CharacterFrameTab5Left,
				CharacterFrameTab5LeftDisabled,
				CharacterFrameTab5Middle,
				CharacterFrameTab5MiddleDisabled,
				CharacterFrameTab5Right,
				CharacterFrameTab5RightDisabled,
				TokenFramePopup.Border.TopEdge,
				TokenFramePopup.Border.RightEdge,
				TokenFramePopup.Border.BottomEdge,
				TokenFramePopup.Border.LeftEdge,
				TokenFramePopup.Border.TopRightCorner,
				TokenFramePopup.Border.TopLeftCorner,
				TokenFramePopup.Border.BottomLeftCorner,
				TokenFramePopup.Border.BottomRightCorner,
				ReputationDetailFrame.Border.TopEdge,
				ReputationDetailFrame.Border.RightEdge,
				ReputationDetailFrame.Border.BottomEdge,
				ReputationDetailFrame.Border.LeftEdge,
				ReputationDetailFrame.Border.TopRightCorner,
				ReputationDetailFrame.Border.TopLeftCorner,
				ReputationDetailFrame.Border.BottomLeftCorner,
				ReputationDetailFrame.Border.BottomRightCorner,
				ReputationDetailCorner,
			ReputationDetailDivider, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						CharacterFrameInset.NineSlice,
						CharacterFrameInset.NineSlice.BottomLeftCorner,
						CharacterFrameInset.NineSlice.BottomRightCorner,
						CharacterFrameInset.NineSlice.BottomEdge,
						CharacterFrameInsetRight.NineSlice.BottomLeftCorner,
						CharacterFrameInsetRight.NineSlice.BottomRightCorner,
					CharacterFrameInsetRight.NineSlice.BottomEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- SpellBook
			for i, v in pairs({ 
				SpellBookFrame.NineSlice.TopEdge,
				SpellBookFrame.NineSlice.RightEdge,
				SpellBookFrame.NineSlice.LeftEdge,
				SpellBookFrame.NineSlice.TopEdge,
				SpellBookFrame.NineSlice.BottomEdge,
				SpellBookFrame.NineSlice.PortraitFrame,
				SpellBookFrame.NineSlice.TopRightCorner,
				SpellBookFrame.NineSlice.TopLeftCorner,
				SpellBookFrame.NineSlice.BottomLeftCorner,
				SpellBookFrame.NineSlice.BottomRightCorner,
				SpellBookFrameTabButton1Left,
				SpellBookFrameTabButton1LeftDisabled,
				SpellBookFrameTabButton1Middle,
				SpellBookFrameTabButton1MiddleDisabled,
				SpellBookFrameTabButton1Right,
				SpellBookFrameTabButton1RightDisabled,
				SpellBookFrameTabButton2Left,
				SpellBookFrameTabButton2LeftDisabled,
				SpellBookFrameTabButton2Middle,
				SpellBookFrameTabButton2MiddleDisabled,
				SpellBookFrameTabButton2Right,
			SpellBookFrameTabButton2RightDisabled, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						SpellBookFrameInset.NineSlice.BottomLeftCorner,
						SpellBookFrameInset.NineSlice.BottomRightCorner,
					SpellBookFrameInset.NineSlice.BottomEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- PvE/Pvp
			for i, v in pairs({ 
				PVEFrame.NineSlice.TopEdge,
				PVEFrame.NineSlice.TopRightCorner,
				PVEFrame.NineSlice.RightEdge,
				PVEFrame.NineSlice.LeftEdge,
				PVEFrame.NineSlice.BottomRightCorner,
				PVEFrame.NineSlice.BottomEdge,
				PVEFrame.NineSlice.BottomLeftCorner,
				PVEFrame.NineSlice.TopLeftCorner,
				PVEFrameTab1Left,
				PVEFrameTab1LeftDisabled,
				PVEFrameTab1Middle,
				PVEFrameTab1MiddleDisabled,
				PVEFrameTab1Right,
				PVEFrameTab1RightDisabled,
				PVEFrameTab2Left,
				PVEFrameTab2LeftDisabled,
				PVEFrameTab2Middle,
				PVEFrameTab2MiddleDisabled,
				PVEFrameTab2Right,
				PVEFrameTab2RightDisabled,
				PVEFrameTab3Left,
				PVEFrameTab3LeftDisabled,
				PVEFrameTab3Middle,
				PVEFrameTab3MiddleDisabled,
				PVEFrameTab3Right,
			PVEFrameTab3RightDisabled,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						PVEFrameLeftInset.NineSlice.BottomLeftCorner,
						PVEFrameLeftInset.NineSlice.BottomRightCorner,
						PVEFrameLeftInset.NineSlice.BottomEdge,
						PVEFrameLeftInset.NineSlice.LeftEdge,
						LFDParentFrameInset.NineSlice.BottomLeftCorner,
						LFDParentFrameInset.NineSlice.BottomRightCorner,
						LFDParentFrameInset.NineSlice.BottomEdge,
						LFDParentFrameInset.NineSlice.LeftEdge,
						RaidFinderFrameRoleInset.NineSlice.BottomLeftCorner,
						RaidFinderFrameRoleInset.NineSlice.BottomRightCorner,
						RaidFinderFrameRoleInset.NineSlice.BottomEdge,
						RaidFinderFrameRoleInset.NineSlice.LeftEdge,
						RaidFinderFrameBottomInset.NineSlice.BottomLeftCorner,
						RaidFinderFrameBottomInset.NineSlice.BottomRightCorner,
						RaidFinderFrameBottomInset.NineSlice.BottomEdge,
						RaidFinderFrameBottomInset.NineSlice.LeftEdge,
						LFGListFrame.CategorySelection.Inset.NineSlice.BottomLeftCorner,
						LFGListFrame.CategorySelection.Inset.NineSlice.BottomRightCorner,
						LFGListFrame.CategorySelection.Inset.NineSlice.BottomEdge,
						LFGListFrame.CategorySelection.Inset.NineSlice.LeftEdge,
						LFGListFrame.SearchPanel.ResultsInset.NineSlice.BottomLeftCorner,
						LFGListFrame.SearchPanel.ResultsInset.NineSlice.BottomRightCorner,
						LFGListFrame.SearchPanel.ResultsInset.NineSlice.BottomEdge,
					LFGListFrame.SearchPanel.ResultsInset.NineSlice.Left, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Friends
			for i, v in pairs({ 
				FriendsFrame.NineSlice.TopEdge,
				FriendsFrame.NineSlice.TopEdge,
				FriendsFrame.NineSlice.TopRightCorner,
				FriendsFrame.NineSlice.RightEdge,
				FriendsFrame.NineSlice.BottomRightCorner,
				FriendsFrame.NineSlice.BottomEdge,
				FriendsFrame.NineSlice.BottomLeftCorner,
				FriendsFrame.NineSlice.LeftEdge,
				FriendsFrame.NineSlice.TopLeftCorner,
				FriendsFrameInset.NineSlice.BottomEdge,
				FriendsFrameTab1Left,
				FriendsFrameTab1LeftDisabled,
				FriendsFrameTab1Middle,
				FriendsFrameTab1MiddleDisabled,
				FriendsFrameTab1Right,
				FriendsFrameTab1RightDisabled,
				FriendsFrameTab2Left,
				FriendsFrameTab2LeftDisabled,
				FriendsFrameTab2Middle,
				FriendsFrameTab2MiddleDisabled,
				FriendsFrameTab2Right,
				FriendsFrameTab2RightDisabled,
				FriendsFrameTab3Left,
				FriendsFrameTab3LeftDisabled,
				FriendsFrameTab3Middle,
				FriendsFrameTab3MiddleDisabled,
				FriendsFrameTab3Right,
				FriendsFrameTab3RightDisabled,
				FriendsFrameTab4Left,
				FriendsFrameTab4LeftDisabled,
				FriendsFrameTab4Middle,
				FriendsFrameTab4MiddleDisabled,
				FriendsFrameTab4Right,
				FriendsFrameTab4RightDisabled,
				FriendsFriendsFrame.Border.TopEdge,
				FriendsFriendsFrame.Border.RightEdge,
				FriendsFriendsFrame.Border.BottomEdge,
				FriendsFriendsFrame.Border.LeftEdge,
				FriendsFriendsFrame.Border.TopRightCorner,
				FriendsFriendsFrame.Border.TopLeftCorner,
				FriendsFriendsFrame.Border.BottomLeftCorner,
				FriendsFriendsFrame.Border.BottomRightCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.TopEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.RightEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.BottomEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.LeftEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.TopRightCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.TopLeftCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.Border.BottomLeftCorner,
			FriendsFrameBattlenetFrame.BroadcastFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						FriendsFrameInset.NineSlice,
						FriendsFrameInset.NineSlice.BottomLeftCorner,
						FriendsFrameInset.NineSlice.BottomRightCorner,
						FriendsFrameInset.NineSlice.BottomEdge,
						WhoFrameListInset.NineSlice.BottomLeftCorner,
						WhoFrameListInset.NineSlice.BottomRightCorner,
						WhoFrameListInset.NineSlice.BottomEdge,
						WhoFrameListInset.NineSlice.LeftEdge,
						WhoFrameEditBoxInset.NineSlice.BottomLeftCorner,
						WhoFrameEditBoxInset.NineSlice.BottomRightCorner,
					WhoFrameEditBoxInset.NineSlice.BottomEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Map
			for i, v in pairs({ 
				WorldMapFrame.BorderFrame.NineSlice.TopEdge,
				WorldMapFrame.BorderFrame.NineSlice.TopEdge,
				WorldMapFrame.BorderFrame.NineSlice.TopEdge,
				WorldMapFrame.BorderFrame.NineSlice.TopRightCorner,
				WorldMapFrame.BorderFrame.NineSlice.RightEdge,
				WorldMapFrame.BorderFrame.NineSlice.BottomRightCorner,
				WorldMapFrame.BorderFrame.NineSlice.BottomEdge,
				WorldMapFrame.BorderFrame.NineSlice.BottomLeftCorner,
				WorldMapFrame.BorderFrame.NineSlice.LeftEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopLeftCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- Channels
			for i, v in pairs({ 
				ChannelFrame.NineSlice.TopEdge,
				ChannelFrame.NineSlice.TopEdge,
				ChannelFrame.NineSlice.TopRightCorner,
				ChannelFrame.NineSlice.RightEdge,
				ChannelFrame.NineSlice.BottomRightCorner,
				ChannelFrame.NineSlice.BottomEdge,
				ChannelFrame.NineSlice.BottomLeftCorner,
				ChannelFrame.NineSlice.LeftEdge,
				ChannelFrame.NineSlice.TopLeftCorner,
				ChannelFrame.LeftInset.NineSlice.BottomEdge,
				ChannelFrame.LeftInset.NineSlice.BottomLeftCorner,
				ChannelFrame.LeftInset.NineSlice.BottomRightCorner,
				ChannelFrame.RightInset.NineSlice.BottomEdge,
				ChannelFrame.RightInset.NineSlice.BottomLeftCorner,
			ChannelFrame.RightInset.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						ChannelFrameInset.NineSlice,
						ChannelFrameInset.NineSlice.BottomLeftCorner,
						ChannelFrameInset.NineSlice.BottomRightCorner,
						ChannelFrameInset.NineSlice.BottomEdge,
					ChannelFrameInset.NineSlice.LeftEdge }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Chat
			for i, v in pairs({ 
				ChatFrame1EditBoxLeft,
				ChatFrame1EditBoxRight,
				ChatFrame1EditBoxMid,
				ChatFrame2EditBoxLeft,
				ChatFrame2EditBoxRight,
				ChatFrame2EditBoxMid,
				ChatFrame3EditBoxLeft,
				ChatFrame3EditBoxRight,
				ChatFrame3EditBoxMid,
				ChatFrame4EditBoxLeft,
				ChatFrame4EditBoxRight,
				ChatFrame4EditBoxMid,
				ChatFrame5EditBoxLeft,
				ChatFrame5EditBoxRight,
				ChatFrame5EditBoxMid,
				ChatFrame6EditBoxLeft,
				ChatFrame6EditBoxRight,
				ChatFrame6EditBoxMid,
				ChatFrame7EditBoxLeft,
				ChatFrame7EditBoxRight,
			ChatFrame7EditBoxMid,	}) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- StatusBar (ExpBar)
			for i, v in pairs({ 
				StatusTrackingBarManager.SingleBarLarge,
				StatusTrackingBarManager.SingleBarSmall,
				StatusTrackingBarManager.SingleBarLargeUpper,
			StatusTrackingBarManager.SingleBarSmallUpper,	}) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- Mail
			for i, v in pairs({ 
				MailFrame.NineSlice.TopEdge,
				MailFrame.NineSlice.TopRightCorner,
				MailFrame.NineSlice.RightEdge,
				MailFrame.NineSlice.BottomRightCorner,
				MailFrame.NineSlice.BottomEdge,
				MailFrame.NineSlice.BottomLeftCorner,
				MailFrame.NineSlice.LeftEdge,
				MailFrame.NineSlice.TopLeftCorner,
				MailFrameInset.NineSlice.BottomEdge,
				OpenMailFrame.NineSlice.TopEdge,
				OpenMailFrame.NineSlice.TopRightCorner,
				OpenMailFrame.NineSlice.RightEdge,
				OpenMailFrame.NineSlice.BottomRightCorner,
				OpenMailFrame.NineSlice.BottomEdge,
				OpenMailFrame.NineSlice.BottomLeftCorner,
				OpenMailFrame.NineSlice.LeftEdge,
				OpenMailFrame.NineSlice.TopLeftCorner,
				OpenMailFrame.NineSlice.BottomEdge,
				MailFrameTab1Left,
				MailFrameTab1LeftDisabled,
				MailFrameTab1Middle,
				MailFrameTab1MiddleDisabled,
				MailFrameTab1Right,
				MailFrameTab1RightDisabled,
				MailFrameTab2Left,
				MailFrameTab2LeftDisabled,
				MailFrameTab2Middle,
				MailFrameTab2MiddleDisabled,
				MailFrameTab2Right,
			MailFrameTab2RightDisabled,
				 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						MailFrameInset.NineSlice,
						MailFrameInset.NineSlice.BottomLeftCorner,
						MailFrameInset.NineSlice.BottomRightCorner,
						SendMailMoneyInset.NineSlice.BottomLeftCorner,
					SendMailMoneyInset.NineSlice.BottomRightCorner, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Merchant
			for i, v in pairs({ 
				MerchantFrame.NineSlice.TopEdge,
				MerchantFrame.NineSlice.RightEdge,
				MerchantFrame.NineSlice.BottomEdge,
				MerchantFrame.NineSlice.LeftEdge,
				MerchantFrame.NineSlice.TopRightCorner,
				MerchantFrame.NineSlice.TopLeftCorner,
				MerchantFrame.NineSlice.BottomLeftCorner,
				MerchantFrame.NineSlice.BottomRightCorner,
				MerchantFrameTab1Left,
				MerchantFrameTab1LeftDisabled,
				MerchantFrameTab1Middle,
				MerchantFrameTab1MiddleDisabled,
				MerchantFrameTab1Right,
				MerchantFrameTab1RightDisabled,
				MerchantFrameTab2Left,
				MerchantFrameTab2LeftDisabled,
				MerchantFrameTab2Middle,
				MerchantFrameTab2MiddleDisabled,
				MerchantFrameTab2Right,
				MerchantFrameTab2RightDisabled,
			StackSplitFrame.SingleItemSplitBackground, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						MerchantMoneyInset.NineSlice,
						MerchantMoneyInset.NineSlice.BottomLeftCorner,
						MerchantMoneyInset.NineSlice.BottomRightCorner,
						MerchantMoneyInset.NineSlice.BottomEdge,
						MerchantExtraCurrencyInset.NineSlice,
						MerchantExtraCurrencyInset.NineSlice.BottomLeftCorner,
						MerchantExtraCurrencyInset.NineSlice.BottomRightCorner,
						MerchantExtraCurrencyInset.NineSlice.BottomEdge,
						MerchantFrameInset.NineSlice,
						MerchantFrameInset.NineSlice.BottomLeftCorner,
						MerchantFrameInset.NineSlice.BottomRightCorner,
						MerchantFrameInset.NineSlice.BottomEdge,
					MerchantFrameInset.NineSlice.LeftEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Gossip (e.g NPC dialog frame and interactions)
			for i, v in pairs({ 
				GossipFrame.NineSlice.TopEdge,
				GossipFrame.NineSlice.RightEdge,
				GossipFrame.NineSlice.BottomEdge,
				GossipFrame.NineSlice.LeftEdge,
				GossipFrame.NineSlice.TopRightCorner,
				GossipFrame.NineSlice.TopLeftCorner,
				GossipFrame.NineSlice.BottomLeftCorner,
			GossipFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						GossipFrameInset.NineSlice,
						GossipFrameInset.NineSlice.BottomLeftCorner,
						GossipFrameInset.NineSlice.BottomRightCorner,
						GossipFrameInset.NineSlice.BottomEdge,
					GossipFrameInset.NineSlice.LeftEdge, }) do 
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Bank
			for i, v in pairs({ 
				BankFrame.NineSlice.TopEdge,
				BankFrame.NineSlice.RightEdge,
				BankFrame.NineSlice.BottomEdge,
				BankFrame.NineSlice.LeftEdge,
				BankFrame.NineSlice.TopRightCorner,
				BankFrame.NineSlice.TopLeftCorner,
				BankFrame.NineSlice.BottomLeftCorner,
				BankFrame.NineSlice.BottomRightCorner,
				BankFrameTab1Left,
				BankFrameTab1LeftDisabled,
				BankFrameTab1Middle,
				BankFrameTab1MiddleDisabled,
				BankFrameTab1Right,
				BankFrameTab1RightDisabled,
				BankFrameTab2Left,
				BankFrameTab2LeftDisabled,
				BankFrameTab2Middle,
				BankFrameTab2MiddleDisabled,
				BankFrameTab2Right,
			BankFrameTab2RightDisabled,
				}) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- Quest
			for i, v in pairs({ 
				QuestFrame.NineSlice.TopEdge,
				QuestFrame.NineSlice.RightEdge,
				QuestFrame.NineSlice.BottomEdge,
				QuestFrame.NineSlice.LeftEdge,
				QuestFrame.NineSlice.TopRightCorner,
				QuestFrame.NineSlice.TopLeftCorner,
				QuestFrame.NineSlice.BottomLeftCorner,
				QuestFrame.NineSlice.BottomRightCorner,
				QuestFrameInset.NineSlice.BottomEdge,
				QuestLogPopupDetailFrame.NineSlice.TopEdge,
				QuestLogPopupDetailFrame.NineSlice.RightEdge,
				QuestLogPopupDetailFrame.NineSlice.BottomEdge,
				QuestLogPopupDetailFrame.NineSlice.LeftEdge,
				QuestLogPopupDetailFrame.NineSlice.TopRightCorner,
				QuestLogPopupDetailFrame.NineSlice.TopLeftCorner,
				QuestLogPopupDetailFrame.NineSlice.BottomLeftCorner,
				QuestLogPopupDetailFrame.NineSlice.BottomRightCorner,
				QuestLogPopupDetailFrame.NineSlice.BottomEdge,
				QuestNPCModelTopBorder,
				QuestNPCModelRightBorder,
				QuestNPCModelTopRightCorner,
				QuestNPCModelBottomRightCorner,
				QuestNPCModelBottomBorder,
				QuestNPCModelBottomLeftCorner,
				QuestNPCModelLeftBorder,
				QuestNPCModelTopLeftCorner,
				QuestNPCModelTextTopBorder,
				QuestNPCModelTextRightBorder,
				QuestNPCModelTextTopRightCorner,
				QuestNPCModelTextBottomRightCorner,
				QuestNPCModelTextBottomBorder,
				QuestNPCModelTextBottomLeftCorner,
				QuestNPCModelTextLeftBorder,
			QuestNPCModelTextTopLeftCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						QuestFrameInset.NineSlice,
						QuestFrameInset.NineSlice.BottomLeftCorner,
						QuestFrameInset.NineSlice.BottomRightCorner,
						QuestFrameInset.NineSlice.BottomEdge,
					QuestFrameInset.NineSlice.LeftEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- Micro Menu and Bag Bar
			for i, v in pairs({ MicroButtonAndBagsBar.MicroBagBar, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- StanceBar
			for i, v in pairs({ 
				StanceBarLeft,
				StanceBarMiddle,
			StanceBarRight, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- DressUP
			for i, v in pairs({ 
				DressUpFrame.NineSlice.TopEdge,
				DressUpFrame.NineSlice.RightEdge,
				DressUpFrame.NineSlice.BottomEdge,
				DressUpFrame.NineSlice.LeftEdge,
				DressUpFrame.NineSlice.TopRightCorner,
				DressUpFrame.NineSlice.TopLeftCorner,
				DressUpFrame.NineSlice.BottomLeftCorner,
			DressUpFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						DressUpFrameInset.NineSlice,
						DressUpFrameInset.NineSlice.BottomLeftCorner,
						DressUpFrameInset.NineSlice.BottomRightCorner,
						DressUpFrameInset.NineSlice.BottomEdge,
					DressUpFrameInset.NineSlice.LeftEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- LootFrame
			for i, v in pairs({ 
				LootFrame.NineSlice.TopEdge,
				LootFrame.NineSlice.RightEdge,
				LootFrame.NineSlice.BottomEdge,
				LootFrame.NineSlice.LeftEdge,
				LootFrame.NineSlice.TopRightCorner,
				LootFrame.NineSlice.TopLeftCorner,
				LootFrame.NineSlice.BottomLeftCorner,
			LootFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					if (GetWoWVersion <= 90500) then
						for i, v in pairs({
							LootFrameInset.NineSlice,
							LootFrameInset.NineSlice.BottomLeftCorner,
							LootFrameInset.NineSlice.BottomRightCorner,
							LootFrameInset.NineSlice.BottomEdge,
						LootFrameInset.NineSlice.LeftEdge, }) do 
							v:SetAlpha(0)
						end
					end
				else
					return nil
				end
			end
			-- HelpFrame
			for i, v in pairs({ 
				HelpFrameTopBorder,
				HelpFrameRightBorder,
				HelpFrameTopRightCorner,
				HelpFrameBottomRightCorner,
				HelpFrameBottomBorder,
				HelpFrameBottomLeftCorner,
				HelpFrameLeftBorder,
				HelpFrameTopLeftCorner,
				HelpFrameVertDivTop,
				HelpFrameVertDivMiddle,
				HelpFrameVertDivBottom,
				HelpFrameHeaderTopBorder,
				HelpFrameHeaderTopRightCorner,
				HelpFrameHeaderRightBorder,
				HelpFrameHeaderBottomRightCorner,
				HelpFrameHeaderBottomBorder,
				HelpFrameHeaderBottomLeftCorner,
				HelpFrameHeaderLeftBorder,
				HelpFrameHeaderTopLeftCorner,
				HelpBrowser.BrowserInset.NineSlice.BottomEdge, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- ItemTextFrame
			for i, v in pairs({	
				ItemTextFrame.NineSlice.TopEdge,
				ItemTextFrame.NineSlice.RightEdge,
				ItemTextFrame.NineSlice.BottomEdge,
				ItemTextFrame.NineSlice.LeftEdge,
				ItemTextFrame.NineSlice.TopRightCorner,
				ItemTextFrame.NineSlice.TopLeftCorner,
				ItemTextFrame.NineSlice.BottomLeftCorner,
			ItemTextFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- PetitionFrame
			for i, v in pairs({	
				PetitionFrame.NineSlice.TopEdge,
				PetitionFrame.NineSlice.RightEdge,
				PetitionFrame.NineSlice.BottomEdge,
				PetitionFrame.NineSlice.LeftEdge,
				PetitionFrame.NineSlice.TopRightCorner,
				PetitionFrame.NineSlice.TopLeftCorner,
				PetitionFrame.NineSlice.BottomLeftCorner,
			PetitionFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- Guild Register Frame & Tabard Frame
			for i, v in pairs({	
				GuildRegistrarFrame.NineSlice.TopEdge,
				GuildRegistrarFrame.NineSlice.RightEdge,
				GuildRegistrarFrame.NineSlice.BottomEdge,
				GuildRegistrarFrame.NineSlice.LeftEdge,
				GuildRegistrarFrame.NineSlice.TopRightCorner,
				GuildRegistrarFrame.NineSlice.TopLeftCorner,
				GuildRegistrarFrame.NineSlice.BottomLeftCorner,
				GuildRegistrarFrame.NineSlice.BottomRightCorner,
				TabardFrame.NineSlice.TopEdge,
				TabardFrame.NineSlice.RightEdge,
				TabardFrame.NineSlice.BottomEdge,
				TabardFrame.NineSlice.LeftEdge,
				TabardFrame.NineSlice.TopRightCorner,
				TabardFrame.NineSlice.TopLeftCorner,
				TabardFrame.NineSlice.BottomLeftCorner,
			TabardFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end	
			-- GuildInviteFrame
			for i, v in pairs({	
				GuildInviteFrame.TopEdge,
				GuildInviteFrame.RightEdge,
				GuildInviteFrame.BottomEdge,
				GuildInviteFrame.LeftEdge,
				GuildInviteFrame.TopRightCorner,
				GuildInviteFrame.TopLeftCorner,
				GuildInviteFrame.BottomLeftCorner,
			GuildInviteFrame.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end	
			-- CastBarBorder
			if (GetWoWVersion <= 90500) then
				for i, v in pairs({	
					CastingBarFrame.Border,
					TargetFrameSpellBar.Border,
				TargetFrameSpellBar.BorderShield, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end	
			end
			-- GameMenu
			for i, v in pairs({	
				GameMenuFrame.Border.TopEdge,
				GameMenuFrame.Border.RightEdge,
				GameMenuFrame.Border.BottomEdge,
				GameMenuFrame.Border.LeftEdge,
				GameMenuFrame.Border.TopRightCorner,
				GameMenuFrame.Border.TopLeftCorner,
				GameMenuFrame.Border.BottomLeftCorner,
				GameMenuFrame.Border.BottomRightCorner,
				GameMenuFrame.Header.RightBG,
				GameMenuFrame.Header.CenterBG,
			GameMenuFrame.Header.LeftBG, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end	
			-- VideoOptions (System)
			if (GetWoWVersion <= 90500) then
				for i, v in pairs({	
					VideoOptionsFrame.Border.TopEdge,
					VideoOptionsFrame.Border.RightEdge,
					VideoOptionsFrame.Border.BottomEdge,
					VideoOptionsFrame.Border.LeftEdge,
					VideoOptionsFrame.Border.TopRightCorner,
					VideoOptionsFrame.Border.TopLeftCorner,
					VideoOptionsFrame.Border.BottomLeftCorner,
					VideoOptionsFrame.Border.BottomRightCorner,
					VideoOptionsFrame.Header.RightBG,
					VideoOptionsFrame.Header.CenterBG,
				VideoOptionsFrame.Header.LeftBG, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end	
			end
			-- InterfaceOptions (Interface)
			if (GetWoWVersion <= 90500) then
				for i, v in pairs({	
					InterfaceOptionsFrame.Border.TopEdge,
					InterfaceOptionsFrame.Border.RightEdge,
					InterfaceOptionsFrame.Border.BottomEdge,
					InterfaceOptionsFrame.Border.LeftEdge,
					InterfaceOptionsFrame.Border.TopRightCorner,
					InterfaceOptionsFrame.Border.TopLeftCorner,
					InterfaceOptionsFrame.Border.BottomLeftCorner,
					InterfaceOptionsFrame.Border.BottomRightCorner,
					InterfaceOptionsFrame.Header.RightBG,
					InterfaceOptionsFrame.Header.CenterBG,
				InterfaceOptionsFrame.Header.LeftBG, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end
			end
			-- AddonsList (Addons)
			for i, v in pairs({	
				AddonList.NineSlice.TopEdge,
				AddonList.NineSlice.RightEdge,
				AddonList.NineSlice.BottomEdge,
				AddonList.NineSlice.LeftEdge,
				AddonList.NineSlice.TopRightCorner,
				AddonList.NineSlice.TopLeftCorner,
				AddonList.NineSlice.BottomLeftCorner,
				AddonList.NineSlice.BottomRightCorner,
			AddonList.NineSlice.BottomEdge, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						AddonListInset.NineSlice,
						AddonListInset.NineSlice.BottomLeftCorner,
						AddonListInset.NineSlice.BottomRightCorner,
						AddonListInset.NineSlice.BottomEdge,
						AddonListInset.NineSlice.LeftEdge,
					}) do 
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
			-- StaticPopUp (LogoutFrame)
			for i, v in pairs({	
				StaticPopup1.Border.TopEdge,
				StaticPopup1.Border.RightEdge,
				StaticPopup1.Border.BottomEdge,
				StaticPopup1.Border.LeftEdge,
				StaticPopup1.Border.TopRightCorner,
				StaticPopup1.Border.TopLeftCorner,
				StaticPopup1.Border.BottomLeftCorner,
				StaticPopup1.Border.BottomRightCorner,
				StaticPopup2.Border.TopEdge,
				StaticPopup2.Border.RightEdge,
				StaticPopup2.Border.BottomEdge,
				StaticPopup2.Border.LeftEdge,
				StaticPopup2.Border.TopRightCorner,
				StaticPopup2.Border.TopLeftCorner,
				StaticPopup2.Border.BottomLeftCorner,
			StaticPopup2.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					if (not InCombatLockdown()) then
						AbyssUI_ColorizationFrameFunction(v)
					end
				else
					return nil
				end
			end
			-- CharacterSlowFrames
			for i, v in pairs({	
				CharacterWristSlotFrame,
				CharacterTabardSlotFrame,
				CharacterShirtSlotFrame,
				CharacterChestSlotFrame,
				CharacterBackSlotFrame,
				CharacterShoulderSlotFrame,
				CharacterNeckSlotFrame,
				CharacterHeadSlotFrame,
				CharacterHandsSlotFrame,
				CharacterWaistSlotFrame,
				CharacterLegsSlotFrame,
				CharacterFeetSlotFrame,
				CharacterFinger0SlotFrame,
				CharacterFinger1SlotFrame,
				CharacterTrinket0SlotFrame,
				CharacterTrinket1SlotFrame,
				CharacterMainHandSlotFrame,
			CharacterSecondaryHandSlotFrame, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end	
			-- LFDReadyCheckPopup
			for i, v in pairs({ 
				LFDReadyCheckPopup.Border.TopEdge,
				LFDReadyCheckPopup.Border.RightEdge,
				LFDReadyCheckPopup.Border.BottomEdge,
				LFDReadyCheckPopup.Border.LeftEdge,
				LFDReadyCheckPopup.Border.TopRightCorner,
				LFDReadyCheckPopup.Border.TopLeftCorner,
				LFDReadyCheckPopup.Border.BottomLeftCorner,
			LFDReadyCheckPopup.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- LFDRoleCheckPopup
			for i, v in pairs({ 
				LFDRoleCheckPopup.Border.TopEdge,
				LFDRoleCheckPopup.Border.RightEdge,
				LFDRoleCheckPopup.Border.BottomEdge,
				LFDRoleCheckPopup.Border.LeftEdge,
				LFDRoleCheckPopup.Border.TopRightCorner,
				LFDRoleCheckPopup.Border.TopLeftCorner,
				LFDRoleCheckPopup.Border.BottomLeftCorner,
			LFDRoleCheckPopup.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- PVPRoleCheckPopup
			for i, v in pairs({ 
				PVPRoleCheckPopup.Border.TopEdge,
				PVPRoleCheckPopup.Border.RightEdge,
				PVPRoleCheckPopup.Border.BottomEdge,
				PVPRoleCheckPopup.Border.LeftEdge,
				PVPRoleCheckPopup.Border.TopRightCorner,
				PVPRoleCheckPopup.Border.TopLeftCorner,
				PVPRoleCheckPopup.Border.BottomLeftCorner,
			PVPRoleCheckPopup.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- Areana/Bg EnemyFrame
			if GetWoWVersion > 11402 then
				for i, v in pairs({ 
					ArenaEnemyFrame1Texture,
					ArenaEnemyFrame1CastingBar,
					ArenaEnemyFrame1DropDown,
					ArenaEnemyFrame1ClassPortrait,
					ArenaEnemyFrame1PetFrame,
					ArenaEnemyFrame1SpecBorder,
					ArenaEnemyFrame2Texture,
					ArenaEnemyFrame2CastingBar,
					ArenaEnemyFrame2DropDown,
					ArenaEnemyFrame2ClassPortrait,
					ArenaEnemyFrame2PetFrame,
					ArenaEnemyFrame2SpecBorder,
					ArenaEnemyFrame3Texture,
					ArenaEnemyFrame3CastingBar,
					ArenaEnemyFrame3DropDown,
					ArenaEnemyFrame3ClassPortrait,
					ArenaEnemyFrame3PetFrame,
					ArenaEnemyFrame3SpecBorder,
					ArenaEnemyFrame4Texture,
					ArenaEnemyFrame4CastingBar,
					ArenaEnemyFrame4DropDown,
					ArenaEnemyFrame4ClassPortrait,
					ArenaEnemyFrame4PetFrame,
					ArenaEnemyFrame4SpecBorder,
					ArenaEnemyFrame5Texture,
					ArenaEnemyFrame5CastingBar,
					ArenaEnemyFrame5DropDown,
					ArenaEnemyFrame5ClassPortrait,
					ArenaEnemyFrame5PetFrame,
					ArenaEnemyFrame5SpecBorder, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end
			end
			-- RecruitAFriend
			for i, v in pairs({ 
				RecruitAFriendRecruitmentFrame.Border.TopEdge,
				RecruitAFriendRecruitmentFrame.Border.RightEdge,
				RecruitAFriendRecruitmentFrame.Border.BottomEdge,
				RecruitAFriendRecruitmentFrame.Border.LeftEdge,
				RecruitAFriendRecruitmentFrame.Border.TopRightCorner,
				RecruitAFriendRecruitmentFrame.Border.TopLeftCorner,
				RecruitAFriendRecruitmentFrame.Border.BottomLeftCorner,
				RecruitAFriendRecruitmentFrame.Border.BottomRightCorner,
				RecruitAFriendRewardsFrame.Border.TopEdge,
				RecruitAFriendRewardsFrame.Border.RightEdge,
				RecruitAFriendRewardsFrame.Border.BottomEdge,
				RecruitAFriendRewardsFrame.Border.LeftEdge,
				RecruitAFriendRewardsFrame.Border.TopRightCorner,
				RecruitAFriendRewardsFrame.Border.TopLeftCorner,
				RecruitAFriendRewardsFrame.Border.BottomLeftCorner,
			RecruitAFriendRewardsFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- LFGDiag
			for i, v in pairs({
				LFGDungeonReadyStatus.Border.TopEdge,
				LFGDungeonReadyStatus.Border.RightEdge,
				LFGDungeonReadyStatus.Border.BottomEdge,
				LFGDungeonReadyStatus.Border.LeftEdge,
				LFGDungeonReadyStatus.Border.TopRightCorner,
				LFGDungeonReadyStatus.Border.TopLeftCorner,
				LFGDungeonReadyStatus.Border.BottomLeftCorner,
			LFGDungeonReadyStatus.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- LFGInvitePopup
			for i, v in pairs({ 
				LFGInvitePopup.Border.TopEdge,
				LFGInvitePopup.Border.RightEdge,
				LFGInvitePopup.Border.BottomEdge,
				LFGInvitePopup.Border.LeftEdge,
				LFGInvitePopup.Border.TopRightCorner,
				LFGInvitePopup.Border.TopLeftCorner,
				LFGInvitePopup.Border.BottomLeftCorner,
			LFGInvitePopup.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- LFGListApplicationDialog
			for i, v in pairs({
				LFGListApplicationDialog.Border.TopEdge,
				LFGListApplicationDialog.Border.RightEdge,
				LFGListApplicationDialog.Border.BottomEdge,
				LFGListApplicationDialog.Border.LeftEdge,
				LFGListApplicationDialog.Border.TopRightCorner,
				LFGListApplicationDialog.Border.TopLeftCorner,
				LFGListApplicationDialog.Border.BottomLeftCorner,
			LFGListApplicationDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- LFGListInviteDialog
			for i, v in pairs({
				LFGListInviteDialog.Border.TopEdge,
				LFGListInviteDialog.Border.RightEdge,
				LFGListInviteDialog.Border.BottomEdge,
				LFGListInviteDialog.Border.LeftEdge,
				LFGListInviteDialog.Border.TopRightCorner,
				LFGListInviteDialog.Border.TopLeftCorner,
				LFGListInviteDialog.Border.BottomLeftCorner,
			LFGListInviteDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- LFDRoleCheckPopup
			for i, v in pairs({
				LFDRoleCheckPopup.Border.TopEdge,
				LFDRoleCheckPopup.Border.RightEdge,
				LFDRoleCheckPopup.Border.BottomEdge,
				LFDRoleCheckPopup.Border.LeftEdge,
				LFDRoleCheckPopup.Border.TopRightCorner,
				LFDRoleCheckPopup.Border.TopLeftCorner,
				LFDRoleCheckPopup.Border.BottomLeftCorner,
			LFDRoleCheckPopup.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- PVPReadyDialog
			for i, v in pairs({ 
				PVPReadyDialog.Border.TopEdge,
				PVPReadyDialog.Border.RightEdge,
				PVPReadyDialog.Border.BottomEdge,
				PVPReadyDialog.Border.LeftEdge,
				PVPReadyDialog.Border.TopRightCorner,
				PVPReadyDialog.Border.TopLeftCorner,
				PVPReadyDialog.Border.BottomLeftCorner,
			PVPReadyDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- DropDownList
			for i, v in pairs({ 
				DropDownList1Backdrop.TopEdge,
				DropDownList1Backdrop.RightEdge,
				DropDownList1Backdrop.BottomEdge,
				DropDownList1Backdrop.LeftEdge,
				DropDownList1Backdrop.TopRightCorner,
				DropDownList1Backdrop.TopLeftCorner,
				DropDownList1Backdrop.BottomLeftCorner,
				DropDownList1Backdrop.BottomRightCorner,
				DropDownList2Backdrop.TopEdge,
				DropDownList2Backdrop.RightEdge,
				DropDownList2Backdrop.BottomEdge,
				DropDownList2Backdrop.LeftEdge,
				DropDownList2Backdrop.TopRightCorner,
				DropDownList2Backdrop.TopLeftCorner,
				DropDownList2Backdrop.BottomLeftCorner,
				DropDownList2Backdrop.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- ChatConfigFrame
			for i, v in pairs({ 
				ChatConfigFrame.Header.CenterBG,
				ChatConfigFrame.Header.LeftBG,
				ChatConfigFrame.Header.RightBG,
				ChatConfigFrame.Border.TopEdge,
				ChatConfigFrame.Border.RightEdge,
				ChatConfigFrame.Border.BottomEdge,
				ChatConfigFrame.Border.LeftEdge,
				ChatConfigFrame.Border.TopRightCorner,
				ChatConfigFrame.Border.TopLeftCorner,
				ChatConfigFrame.Border.BottomLeftCorner,
			ChatConfigFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- CinematicFrameCloseDialog
			for i, v in pairs({
				CinematicFrameCloseDialog.Border.TopEdge,
				CinematicFrameCloseDialog.Border.RightEdge,
				CinematicFrameCloseDialog.Border.BottomEdge,
				CinematicFrameCloseDialog.Border.LeftEdge,
				CinematicFrameCloseDialog.Border.TopRightCorner,
				CinematicFrameCloseDialog.Border.TopLeftCorner,
				CinematicFrameCloseDialog.Border.BottomLeftCorner,
			CinematicFrameCloseDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- TradeFrame
			for i, v in pairs({
				TradeFrame.NineSlice.TopEdge,
				TradeFrame.NineSlice.RightEdge,
				TradeFrame.NineSlice.BottomEdge,
				TradeFrame.NineSlice.LeftEdge,
				TradeFrame.NineSlice.TopRightCorner,
				TradeFrame.NineSlice.TopLeftCorner,
				TradeFrame.NineSlice.BottomLeftCorner,
			TradeFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- ReportCheatingDialog
			for i, v in pairs({
				ReportCheatingDialog.Border.TopEdge,
				ReportCheatingDialog.Border.RightEdge,
				ReportCheatingDialog.Border.BottomEdge,
				ReportCheatingDialog.Border.LeftEdge,
				ReportCheatingDialog.Border.TopRightCorner,
				ReportCheatingDialog.Border.TopLeftCorner,
				ReportCheatingDialog.Border.BottomLeftCorner,
			ReportCheatingDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- PlayerReportFrame
			for i, v in pairs({
				ReportFrame.Border.TopEdge,
				ReportFrame.Border.RightEdge,
				ReportFrame.Border.BottomEdge,
				ReportFrame.Border.LeftEdge,
				ReportFrame.Border.TopRightCorner,
				ReportFrame.Border.TopLeftCorner,
				ReportFrame.Border.BottomLeftCorner,
			ReportFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- AddFriendFrame
			for i, v in pairs({
				AddFriendFrame.Border.TopEdge,
				AddFriendFrame.Border.RightEdge,
				AddFriendFrame.Border.BottomEdge,
				AddFriendFrame.Border.LeftEdge,
				AddFriendFrame.Border.TopRightCorner,
				AddFriendFrame.Border.TopLeftCorner,
				AddFriendFrame.Border.BottomLeftCorner,
			AddFriendFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- ArenaPrepFrame
			if GetWoWVersion > 11402 then
				for i, v in pairs({
					ArenaPrepFrame1CastingBar,
					ArenaPrepFrame1DropDown,
					ArenaPrepFrame1ClassPortrait,
					ArenaPrepFrame2CastingBar,
					ArenaPrepFrame2DropDown,
					ArenaPrepFrame2ClassPortrait,
					ArenaPrepFrame3CastingBar,
					ArenaPrepFrame3DropDown,
					ArenaPrepFrame3ClassPortrait,
					ArenaPrepFrame4CastingBar,
					ArenaPrepFrame4DropDown,
					ArenaPrepFrame4ClassPortrait,
					ArenaPrepFrame5CastingBar,
					ArenaPrepFrame5DropDown,
				ArenaPrepFrame5ClassPortrait, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end
			end
			-- AudioOptionsFrame
			if (GetWoWVersion <= 90500) then
				for i, v in pairs({
					AudioOptionsFrame.Header.CenterBG,
					AudioOptionsFrame.Header.LeftBG,
					AudioOptionsFrame.Header.RightBG,
					AudioOptionsFrame.Border.TopEdge,
					AudioOptionsFrame.Border.RightEdge,
					AudioOptionsFrame.Border.BottomEdge,
					AudioOptionsFrame.Border.LeftEdge,
					AudioOptionsFrame.Border.TopRightCorner,
					AudioOptionsFrame.Border.TopLeftCorner,
					AudioOptionsFrame.Border.BottomLeftCorner,
				AudioOptionsFrame.Border.BottomRightCorner, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end
			end
			-- ClubFinderReportFrame
			--[[
			for i, v in pairs({
				ClubFinderReportFrame.Border.TopEdge,
				ClubFinderReportFrame.Border.RightEdge,
				ClubFinderReportFrame.Border.BottomEdge,
				ClubFinderReportFrame.Border.LeftEdge,
				ClubFinderReportFrame.Border.TopRightCorner,
				ClubFinderReportFrame.Border.TopLeftCorner,
				ClubFinderReportFrame.Border.BottomLeftCorner,
			ClubFinderReportFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			--]]
			-- ColorPickerFrame
			for i, v in pairs({
				ColorPickerFrame.Header.CenterBG,
				ColorPickerFrame.Header.LeftBG,
				ColorPickerFrame.Header.RightBG,
				ColorPickerFrame.Border.TopEdge,
				ColorPickerFrame.Border.RightEdge,
				ColorPickerFrame.Border.BottomEdge,
				ColorPickerFrame.Border.LeftEdge,
				ColorPickerFrame.Border.TopRightCorner,
				ColorPickerFrame.Border.TopLeftCorner,
				ColorPickerFrame.Border.BottomLeftCorner,
			ColorPickerFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- FolderPicker
			if (GetWoWVersion <= 90500) then
				for i, v in pairs({
					FolderPicker.Header.CenterBG,
					FolderPicker.Header.LeftBG,
					FolderPicker.Header.RightBG,
					FolderPicker.Border.TopEdge,
					FolderPicker.Border.RightEdge,
					FolderPicker.Border.BottomEdge,
					FolderPicker.Border.LeftEdge,
					FolderPicker.Border.TopRightCorner,
					FolderPicker.Border.TopLeftCorner,
					FolderPicker.Border.BottomLeftCorner,
				FolderPicker.Border.BottomRightCorner, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end
			end
			-- LootHistoryFrame
			--[[
			for i, v in pairs({
				LootHistoryFrame.Divider,
				LootHistoryFrame.BorderRight,
				LootHistoryFrame.BorderBottom,
				LootHistoryFrame.BorderLeft,
				LootHistoryFrame.BorderTopRight,
				LootHistoryFrame.BorderTopLeft,
				LootHistoryFrame.BorderBottomLeft,
			LootHistoryFrame.BorderBottomRight, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			--]]
			-- ModelPreviewFrame
			for i, v in pairs({
				ModelPreviewFrame.NineSlice.TopEdge,
				ModelPreviewFrame.NineSlice.RightEdge,
				ModelPreviewFrame.NineSlice.BottomEdge,
				ModelPreviewFrame.NineSlice.LeftEdge,
				ModelPreviewFrame.NineSlice.TopRightCorner,
				ModelPreviewFrame.NineSlice.TopLeftCorner,
				ModelPreviewFrame.NineSlice.BottomLeftCorner,
			ModelPreviewFrame.NineSlice.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- OpacityFrame
			for i, v in pairs({
				OpacityFrame.Border.TopEdge,
				OpacityFrame.Border.RightEdge,
				OpacityFrame.Border.BottomEdge,
				OpacityFrame.Border.LeftEdge,
				OpacityFrame.Border.TopRightCorner,
				OpacityFrame.Border.TopLeftCorner,
				OpacityFrame.Border.BottomLeftCorner,
			OpacityFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- RaidBrowserFrame
			if (GetWoWVersion < 100100) then
				for i, v in pairs({
					RaidBrowserFrame.NineSlice.TopEdge,
					RaidBrowserFrame.NineSlice.RightEdge,
					RaidBrowserFrame.NineSlice.BottomEdge,
					RaidBrowserFrame.NineSlice.LeftEdge,
					RaidBrowserFrame.NineSlice.TopRightCorner,
					RaidBrowserFrame.NineSlice.TopLeftCorner,
					RaidBrowserFrame.NineSlice.BottomLeftCorner,
				RaidBrowserFrame.NineSlice.BottomRightCorner, }) do
					if AbyssUIAddonSettings ~= nil then
						AbyssUI_ColorizationFrameFunction(v)
					else
						return nil
					end
				end
			end
			-- RatingMenuFrame
			for i, v in pairs({
				RatingMenuFrame.Header.CenterBG,
				RatingMenuFrame.Header.LeftBG,
				RatingMenuFrame.Header.RightBG,
				RatingMenuFrame.Border.TopEdge,
				RatingMenuFrame.Border.RightEdge,
				RatingMenuFrame.Border.BottomEdge,
				RatingMenuFrame.Border.LeftEdge,
				RatingMenuFrame.Border.TopRightCorner,
				RatingMenuFrame.Border.TopLeftCorner,
				RatingMenuFrame.Border.BottomLeftCorner,
			RatingMenuFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- TicketStatusFrameButton
			for i, v in pairs({
				TicketStatusFrameButton.TopEdge,
				TicketStatusFrameButton.RightEdge,
				TicketStatusFrameButton.BottomEdge,
				TicketStatusFrameButton.LeftEdge,
				TicketStatusFrameButton.TopRightCorner,
				TicketStatusFrameButton.TopLeftCorner,
				TicketStatusFrameButton.BottomLeftCorner,
			TicketStatusFrameButton.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- VoiceChatChannelActivatedNotification
			for i, v in pairs({
				VoiceChatChannelActivatedNotification.TopEdge,
				VoiceChatChannelActivatedNotification.RightEdge,
				VoiceChatChannelActivatedNotification.BottomEdge,
				VoiceChatChannelActivatedNotification.LeftEdge,
				VoiceChatChannelActivatedNotification.TopRightCorner,
				VoiceChatChannelActivatedNotification.TopLeftCorner,
				VoiceChatChannelActivatedNotification.BottomLeftCorner,
			VoiceChatChannelActivatedNotification.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- VoiceChatPromptActivateChannel
			for i, v in pairs({
				VoiceChatPromptActivateChannel.TopEdge,
				VoiceChatPromptActivateChannel.RightEdge,
				VoiceChatPromptActivateChannel.BottomEdge,
				VoiceChatPromptActivateChannel.LeftEdge,
				VoiceChatPromptActivateChannel.TopRightCorner,
				VoiceChatPromptActivateChannel.TopLeftCorner,
				VoiceChatPromptActivateChannel.BottomLeftCorner,
			VoiceChatPromptActivateChannel.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- WardrobeOutfitEditFrame
			for i, v in pairs({
				WardrobeOutfitEditFrame.Border.TopEdge,
				WardrobeOutfitEditFrame.Border.RightEdge,
				WardrobeOutfitEditFrame.Border.BottomEdge,
				WardrobeOutfitEditFrame.Border.LeftEdge,
				WardrobeOutfitEditFrame.Border.TopRightCorner,
				WardrobeOutfitEditFrame.Border.TopLeftCorner,
				WardrobeOutfitEditFrame.Border.BottomLeftCorner,
			WardrobeOutfitEditFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- WardrobeOutfitFrame
			for i, v in pairs({
				WardrobeOutfitFrame.Border.TopEdge,
				WardrobeOutfitFrame.Border.RightEdge,
				WardrobeOutfitFrame.Border.BottomEdge,
				WardrobeOutfitFrame.Border.LeftEdge,
				WardrobeOutfitFrame.Border.TopRightCorner,
				WardrobeOutfitFrame.Border.TopLeftCorner,
				WardrobeOutfitFrame.Border.BottomLeftCorner,
			WardrobeOutfitFrame.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- QuestSessionManager.CheckStopDialog
			for i, v in pairs({
				QuestSessionManager.CheckStopDialog.Border.TopEdge,
				QuestSessionManager.CheckStopDialog.Border.RightEdge,
				QuestSessionManager.CheckStopDialog.Border.BottomEdge,
				QuestSessionManager.CheckStopDialog.Border.LeftEdge,
				QuestSessionManager.CheckStopDialog.Border.TopRightCorner,
				QuestSessionManager.CheckStopDialog.Border.TopLeftCorner,
				QuestSessionManager.CheckStopDialog.Border.BottomLeftCorner,
			QuestSessionManager.CheckStopDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- QuestSessionManager.StartDialog
			for i, v in pairs({
				QuestSessionManager.StartDialog.Border.TopEdge,
				QuestSessionManager.StartDialog.Border.RightEdge,
				QuestSessionManager.StartDialog.Border.BottomEdge,
				QuestSessionManager.StartDialog.Border.LeftEdge,
				QuestSessionManager.StartDialog.Border.TopRightCorner,
				QuestSessionManager.StartDialog.Border.TopLeftCorner,
				QuestSessionManager.StartDialog.Border.BottomLeftCorner,
			QuestSessionManager.StartDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- MovieFrame.CloseDialog
			for i, v in pairs({
				MovieFrame.CloseDialog.Border.TopEdge,
				MovieFrame.CloseDialog.Border.RightEdge,
				MovieFrame.CloseDialog.Border.BottomEdge,
				MovieFrame.CloseDialog.Border.LeftEdge,
				MovieFrame.CloseDialog.Border.TopRightCorner,
				MovieFrame.CloseDialog.Border.TopLeftCorner,
				MovieFrame.CloseDialog.Border.BottomLeftCorner,
			MovieFrame.CloseDialog.Border.BottomRightCorner, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				else
					return nil
				end
			end
			-- ContainerFrame1
			for i, v in pairs({ 
				ContainerFrame1Background1Slot,
				ContainerFrame1BackgroundBottom,
				ContainerFrame1BackgroundMiddle1,
				ContainerFrame1BackgroundMiddle2,
				ContainerFrame1BackgroundTop,
				ContainerFrame1BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame2
			for i, v in pairs({ 
				ContainerFrame2Background1Slot,
				ContainerFrame2BackgroundBottom,
				ContainerFrame2BackgroundMiddle1,
				ContainerFrame2BackgroundMiddle2,
				ContainerFrame2BackgroundTop,
				ContainerFrame2BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame3
			for i, v in pairs({ 
				ContainerFrame3Background1Slot,
				ContainerFrame3BackgroundBottom,
				ContainerFrame3BackgroundMiddle1,
				ContainerFrame3BackgroundMiddle2,
				ContainerFrame3BackgroundTop,
				ContainerFrame3BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame4
			for i, v in pairs({ 
				ContainerFrame4Background1Slot,
				ContainerFrame4BackgroundBottom,
				ContainerFrame4BackgroundMiddle1,
				ContainerFrame4BackgroundMiddle2,
				ContainerFrame4BackgroundTop,
				ContainerFrame4BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame5
			for i, v in pairs({ 
				ContainerFrame5Background1Slot,
				ContainerFrame5BackgroundBottom,
				ContainerFrame5BackgroundMiddle1,
				ContainerFrame5BackgroundMiddle2,
				ContainerFrame5BackgroundTop,
				ContainerFrame5BackgroundPortrait,
		 	 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
		end
		----------------------------------------------------------------------
		-- End
		self:UnregisterEvent("ADDON_LOADED")
		NewFrames:SetScript("OnEvent", nil)
	end
end)

----------------------------------------------------------------------
-------------- Frames that need a load to work properly --------------
----------------------------------------------------------------------
-- Specialization
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TalentUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			PlayerTalentFrame.NineSlice.TopEdge,
			PlayerTalentFrame.NineSlice.RightEdge,
			PlayerTalentFrame.NineSlice.BottomEdge,
			PlayerTalentFrame.NineSlice.LeftEdge,
			PlayerTalentFrame.NineSlice.TopRightCorner,
			PlayerTalentFrame.NineSlice.TopLeftCorner,
			PlayerTalentFrame.NineSlice.BottomLeftCorner,
			PlayerTalentFrame.NineSlice.BottomRightCorner,
			PlayerTalentFrameTab1Left,
			PlayerTalentFrameTab1LeftDisabled,
			PlayerTalentFrameTab1Middle,
			PlayerTalentFrameTab1MiddleDisabled,
			PlayerTalentFrameTab1Right,
			PlayerTalentFrameTab1RightDisabled,
			PlayerTalentFrameTab2Left,
			PlayerTalentFrameTab2LeftDisabled,
			PlayerTalentFrameTab2Middle,
			PlayerTalentFrameTab2MiddleDisabled,
			PlayerTalentFrameTab2Right,
			PlayerTalentFrameTab2RightDisabled,
			PlayerTalentFrameTab3Left,
			PlayerTalentFrameTab3LeftDisabled,
			PlayerTalentFrameTab3Middle,
			PlayerTalentFrameTab32MiddleDisabled,
			PlayerTalentFrameTab3Right,
		PlayerTalentFrameTab3RightDisabled, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					PlayerTalentFrameInset.NineSlice,
					PlayerTalentFrameInset.NineSlice.BottomLeftCorner,
					PlayerTalentFrameInset.NineSlice.BottomRightCorner,
					PlayerTalentFrameInset.NineSlice.BottomEdge,
					PlayerTalentFrameInset.NineSlice.LeftEdge,
				}) do
					v:SetAlpha(0)
				end
			end
		end
	end
end)
-- Collections
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			CollectionsJournal.NineSlice.TopEdge,
			CollectionsJournal.NineSlice.TopRightCorner,
			CollectionsJournal.NineSlice.RightEdge,
			CollectionsJournal.NineSlice.BottomRightCorner,
			CollectionsJournal.NineSlice.BottomEdge,
			CollectionsJournal.NineSlice.BottomLeftCorner,
			CollectionsJournal.NineSlice.LeftEdge,
			CollectionsJournal.NineSlice.TopLeftCorner,
			CollectionsJournalTab1Left,
			CollectionsJournalTab1LeftDisabled,
			CollectionsJournalTab1Middle,
			CollectionsJournalTab1MiddleDisabled,
			CollectionsJournalTab1Right,
			CollectionsJournalTab1RightDisabled,
			CollectionsJournalTab2Left,
			CollectionsJournalTab2LeftDisabled,
			CollectionsJournalTab2Middle,
			CollectionsJournalTab2MiddleDisabled,
			CollectionsJournalTab2Right,
			CollectionsJournalTab2RightDisabled,
			CollectionsJournalTab3Left,
			CollectionsJournalTab3LeftDisabled,
			CollectionsJournalTab3Middle,
			CollectionsJournalTab3MiddleDisabled,
			CollectionsJournalTab3Right,
			CollectionsJournalTab3RightDisabled,
			CollectionsJournalTab4Left,
			CollectionsJournalTab4LeftDisabled,
			CollectionsJournalTab4Middle,
			CollectionsJournalTab4MiddleDisabled,
			CollectionsJournalTab4Right,
			CollectionsJournalTab4RightDisabled,
			CollectionsJournalTab5Left,
			CollectionsJournalTab5LeftDisabled,
			CollectionsJournalTab5Middle,
			CollectionsJournalTab5MiddleDisabled,
			CollectionsJournalTab5Right,
			CollectionsJournalTab5RightDisabled,
		MountJournal.BottomLeftInset.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					MountJournal.LeftInset.NineSlice.BottomLeftCorner,
					MountJournal.LeftInset.NineSlice.BottomRightCorner,
					MountJournal.LeftInset.NineSlice.BottomEdge,
					MountJournal.LeftInset.NineSlice.LeftEdge,
					MountJournal.RightInset.NineSlice.BottomLeftCorner,
					MountJournal.RightInset.NineSlice.BottomRightCorner,
					MountJournal.RightInset.NineSlice.BottomEdge,
					MountJournal.RightInset.NineSlice.RightEdge,
					MountJournal.BottomLeftInset.NineSlice.BottomLeftCorner,
					MountJournal.BottomLeftInset.NineSlice.BottomRightCorner,
					MountJournal.BottomLeftInset.NineSlice.BottomEdge,
					MountJournal.BottomLeftInset.NineSlice.LeftEdge,
					PetJournalRightInset.NineSlice.BottomLeftCorner,
					PetJournalRightInset.NineSlice.BottomRightCorner,
					PetJournalRightInset.NineSlice.BottomEdge,
					PetJournalRightInset.NineSlice.RightEdge,
					PetJournalLeftInset.NineSlice.BottomLeftCorner,
					PetJournalLeftInset.NineSlice.BottomRightCorner,
					PetJournalLeftInset.NineSlice.BottomEdge,
					PetJournalLeftInset.NineSlice.LeftEdge,
					ToyBox.iconsFrame.NineSlice.BottomLeftCorner,
					ToyBox.iconsFrame.NineSlice.BottomRightCorner,
					ToyBox.iconsFrame.NineSlice.BottomEdge,
					ToyBox.iconsFrame.NineSlice.LeftEdge,
					HeirloomsJournal.iconsFrame.NineSlice.BottomLeftCorner,
					HeirloomsJournal.iconsFrame.NineSlice.BottomRightCorner,
					HeirloomsJournal.iconsFrame.NineSlice.BottomEdge,
				HeirloomsJournal.iconsFrame.NineSlice.LeftEdge,	}) do
					v:SetAlpha(0)
				end
			end
		end
	end
end)
-- AdventureGuide
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			EncounterJournal.NineSlice.TopEdge,
			EncounterJournal.NineSlice.RightEdge,
			EncounterJournal.NineSlice.BottomEdge,
			EncounterJournal.NineSlice.LeftEdge,
			EncounterJournal.NineSlice.TopRightCorner,
			EncounterJournal.NineSlice.TopLeftCorner,
			EncounterJournal.NineSlice.BottomLeftCorner,
		EncounterJournal.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					EncounterJournalInset.NineSlice,
					EncounterJournalInset.NineSlice.BottomLeftCorner,
					EncounterJournalInset.NineSlice.BottomRightCorner,
					EncounterJournalInset.NineSlice.BottomEdge,
				EncounterJournalInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			end
		end
	end
end)
-- Communities
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Communities" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			CommunitiesFrame.NineSlice.TopEdge,
			CommunitiesFrame.NineSlice.RightEdge,
			CommunitiesFrame.NineSlice.BottomEdge,
			CommunitiesFrame.NineSlice.LeftEdge,
			CommunitiesFrame.NineSlice.TopRightCorner,
			CommunitiesFrame.NineSlice.TopLeftCorner,
			CommunitiesFrame.NineSlice.BottomLeftCorner,
			CommunitiesFrame.NineSlice.BottomRightCorner,
			CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomEdge,
			CommunitiesFrame.GuildFinderFrame.InsetFrame.NineSlice.BottomEdge,
			CommunitiesFrame.GuildMemberDetailFrame.Border.TopEdge,
			CommunitiesFrame.GuildMemberDetailFrame.Border.RightEdge,
			CommunitiesFrame.GuildMemberDetailFrame.Border.BottomEdge,
			CommunitiesFrame.GuildMemberDetailFrame.Border.LeftEdge,
			CommunitiesFrame.GuildMemberDetailFrame.Border.TopRightCorner,
			CommunitiesFrame.GuildMemberDetailFrame.Border.TopLeftCorner,
			CommunitiesFrame.GuildMemberDetailFrame.Border.BottomLeftCorner,
			CommunitiesFrame.GuildMemberDetailFrame.Border.BottomRightCorner,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.TopEdge,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.RightEdge,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.LeftEdge,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.BottomEdge,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.TopRightCorner,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.TopLeftCorner,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.BottomLeftCorner,
			CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG.BottomRightCorner,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.TopEdge,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.RightEdge,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.LeftEdge,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.BottomEdge,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.TopRightCorner,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.TopLeftCorner,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.BottomLeftCorner,
			ClubFinderGuildFinderFrame.RequestToJoinFrame.BG.BottomRightCorner,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.TopEdge,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.RightEdge,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.LeftEdge,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.BottomEdge,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.TopRightCorner,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.TopLeftCorner,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.BottomLeftCorner,
			ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.BottomRightCorner,
			CommunitiesFrame.RecruitmentDialog.BG.TopEdge,
			CommunitiesFrame.RecruitmentDialog.BG.RightEdge,
			CommunitiesFrame.RecruitmentDialog.BG.LeftEdge,
			CommunitiesFrame.RecruitmentDialog.BG.BottomEdge,
			CommunitiesFrame.RecruitmentDialog.BG.TopRightCorner,
			CommunitiesFrame.RecruitmentDialog.BG.TopLeftCorner,
			CommunitiesFrame.RecruitmentDialog.BG.BottomLeftCorner,
		CommunitiesFrame.RecruitmentDialog.BG.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs ({
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomRightCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrame.GuildFinderFrame.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrame.GuildFinderFrame.InsetFrame.NineSlice.BottomRightCorner,
					CommunitiesFrame.GuildFinderFrame.InsetFrame.NineSlice.BottomEdge,
					ClubFinderGuildFinderFrame.DisabledFrame.NineSlice.BottomLeftCorner,
					ClubFinderGuildFinderFrame.DisabledFrame.NineSlice.BottomRightCorner,
					ClubFinderGuildFinderFrame.DisabledFrame.NineSlice.BottomEdge,
					ClubFinderGuildFinderFrame.InsetFrame.NineSlice.BottomEdge,
					ClubFinderCommunityAndGuildFinderFrame.InsetFrame.NineSlice.BottomLeftCorner,
					ClubFinderCommunityAndGuildFinderFrame.InsetFrame.NineSlice.BottomRightCorner,
					ClubFinderCommunityAndGuildFinderFrame.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomRightCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.BottomRightCorner,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrameInset.NineSlice,
					CommunitiesFrameInset.NineSlice.BottomLeftCorner,
					CommunitiesFrameInset.NineSlice.BottomRightCorner,
					CommunitiesFrameInset.NineSlice.BottomEdge,
				CommunitiesFrameInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- Macro
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			MacroFrame.NineSlice.TopEdge,
			MacroFrame.NineSlice.RightEdge,
			MacroFrame.NineSlice.BottomEdge,
			MacroFrame.NineSlice.LeftEdge,
			MacroFrame.NineSlice.TopRightCorner,
			MacroFrame.NineSlice.TopLeftCorner,
			MacroFrame.NineSlice.BottomLeftCorner,
		MacroFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					MacroFrameInset.NineSlice,
					MacroFrameInset.NineSlice.BottomLeftCorner,
					MacroFrameInset.NineSlice.BottomRightCorner,
					MacroFrameInset.NineSlice.BottomEdge,
				MacroFrameInset.NineSlice.Left, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- AuctionHouse
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionHouseUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			AuctionHouseFrame.NineSlice.TopEdge,
			AuctionHouseFrame.NineSlice.RightEdge,
			AuctionHouseFrame.NineSlice.BottomEdge,
			AuctionHouseFrame.NineSlice.LeftEdge,
			AuctionHouseFrame.NineSlice.TopRightCorner,
			AuctionHouseFrame.NineSlice.TopLeftCorner,
			AuctionHouseFrame.NineSlice.BottomLeftCorner,
			AuctionHouseFrame.NineSlice.BottomRightCorner,
			AuctionHouseFrame.NineSlice.BottomEdge,
			AuctionHouseFrameBuyTabLeft,
			AuctionHouseFrameBuyTabLeftDisabled,
			AuctionHouseFrameBuyTabMiddle,
			AuctionHouseFrameBuyTabMiddleDisabled,
			AuctionHouseFrameBuyTabRight,
			AuctionHouseFrameBuyTabRightDisabled,
			AuctionHouseFrameSellTabLeft,
			AuctionHouseFrameSellTabLeftDisabled,
			AuctionHouseFrameSellTabMiddle,
			AuctionHouseFrameSellTabMiddleDisabled,
			AuctionHouseFrameSellTabRight,
			AuctionHouseFrameSellTabRightDisabled,
			AuctionHouseFrameAuctionsTabLeft,
			AuctionHouseFrameAuctionsTabLeftDisabled,
			AuctionHouseFrameAuctionsTabMiddle,
			AuctionHouseFrameAuctionsTabMiddleDisabled,
			AuctionHouseFrameAuctionsTabRight,
			AuctionHouseFrameAuctionsTabRightDisabled,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.TopEdge,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.RightEdge,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomEdge,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.LeftEdge,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.TopRightCorner,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.TopLeftCorner,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomLeftCorner,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomRightCorner,
			AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomEdge,
			AuctionHouseFrame.BuyDialog.Border.TopEdge,
			AuctionHouseFrame.BuyDialog.Border.RightEdge,
			AuctionHouseFrame.BuyDialog.Border.BottomEdge,
			AuctionHouseFrame.BuyDialog.Border.LeftEdge,
			AuctionHouseFrame.BuyDialog.Border.TopRightCorner,
			AuctionHouseFrame.BuyDialog.Border.TopLeftCorner,
			AuctionHouseFrame.BuyDialog.Border.BottomLeftCorner,
			AuctionHouseFrame.BuyDialog.Border.BottomRightCorner,
		AuctionHouseFrame.BuyDialog.Border.BottomEdge, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					AuctionHouseFrame.CategoriesList.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.CategoriesList.NineSlice.BottomRightCorner,
					AuctionHouseFrame.CategoriesList.NineSlice.BottomEdge,
					AuctionHouseFrame.CategoriesList.NineSlice.LeftEdge,
					AuctionHouseFrame.ItemBuyFrame.ItemDisplay.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.ItemBuyFrame.ItemDisplay.NineSlice.BottomRightCorner,
					AuctionHouseFrame.ItemBuyFrame.ItemDisplay.NineSlice.BottomEdge,
					AuctionHouseFrame.ItemBuyFrame.ItemDisplay.NineSlice.LeftEdge,
					AuctionHouseFrame.ItemBuyFrame.ItemList.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.ItemBuyFrame.ItemList.NineSlice.BottomRightCorner,
					AuctionHouseFrame.ItemBuyFrame.ItemList.NineSlice.BottomEdge,
					AuctionHouseFrame.ItemBuyFrame.ItemList.NineSlice.LeftEdge,
					AuctionHouseFrame.ItemSellFrame.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.ItemSellFrame.NineSlice.BottomRightCorner,
					AuctionHouseFrame.ItemSellFrame.NineSlice.BottomEdge,
					AuctionHouseFrame.ItemSellFrame.NineSlice.LeftEdge,
					AuctionHouseFrame.ItemSellList.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.ItemSellList.NineSlice.BottomRightCorner,
					AuctionHouseFrame.ItemSellList.NineSlice.BottomEdge,
					AuctionHouseFrame.ItemSellList.NineSlice.LeftEdge,
					AuctionHouseFrameAuctionsFrame.SummaryList.NineSlice.BottomLeftCorner,
					AuctionHouseFrameAuctionsFrame.SummaryList.NineSlice.BottomRightCorner,
					AuctionHouseFrameAuctionsFrame.SummaryList.NineSlice.BottomEdge,
					AuctionHouseFrameAuctionsFrame.SummaryList.NineSlice.LeftEdge,
					AuctionHouseFrameAuctionsFrame.AllAuctionsList.NineSlice.BottomLeftCorner,
					AuctionHouseFrameAuctionsFrame.AllAuctionsList.NineSlice.BottomRightCorner,
					AuctionHouseFrameAuctionsFrame.AllAuctionsList.NineSlice.BottomEdge,
				AuctionHouseFrameAuctionsFrame.AllAuctionsList.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- FlightMap
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			FlightMapFrame.BorderFrame.NineSlice.TopEdge,
			FlightMapFrame.BorderFrame.NineSlice.RightEdge,
			FlightMapFrame.BorderFrame.NineSlice.BottomEdge,
			FlightMapFrame.BorderFrame.NineSlice.LeftEdge,
			FlightMapFrame.BorderFrame.NineSlice.TopRightCorner,
			FlightMapFrame.BorderFrame.NineSlice.TopLeftCorner,
			FlightMapFrame.BorderFrame.NineSlice.BottomLeftCorner,
		FlightMapFrame.BorderFrame.NineSlice.BottomRightCorner,	}) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- TradeSkill
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TradeSkillUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			TradeSkillFrame.NineSlice.TopEdge,
			TradeSkillFrame.NineSlice.RightEdge,
			TradeSkillFrame.NineSlice.BottomEdge,
			TradeSkillFrame.NineSlice.LeftEdge,
			TradeSkillFrame.NineSlice.TopRightCorner,
			TradeSkillFrame.NineSlice.TopLeftCorner,
			TradeSkillFrame.NineSlice.BottomLeftCorner,
		TradeSkillFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					TradeSkillFrame.RecipeInset.NineSlice,
					TradeSkillFrame.RecipeInset.NineSlice.BottomLeftCorner,
					TradeSkillFrame.RecipeInset.NineSlice.BottomRightCorner,
					TradeSkillFrame.RecipeInset.NineSlice.BottomEdge,
					TradeSkillFrame.RecipeInset.NineSlice.LeftEdge,
					TradeSkillFrame.DetailsInset.NineSlice,
					TradeSkillFrame.DetailsInset.NineSlice.BottomLeftCorner,
					TradeSkillFrame.DetailsInset.NineSlice.BottomRightCorner,
				TradeSkillFrame.DetailsInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- Inspect
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			InspectFrame.NineSlice.TopEdge,
			InspectFrame.NineSlice.RightEdge,
			InspectFrame.NineSlice.BottomEdge,
			InspectFrame.NineSlice.LeftEdge,
			InspectFrame.NineSlice.TopRightCorner,
			InspectFrame.NineSlice.TopLeftCorner,
			InspectFrame.NineSlice.BottomLeftCorner,
			InspectFrame.NineSlice.BottomRightCorner,
			InspectFrameInset.NineSlice.BottomEdge,
			InspectFrameTab1Left,
			InspectFrameTab1LeftDisabled,
			InspectFrameTab1Middle,
			InspectFrameTab1MiddleDisabled,
			InspectFrameTab1Right,
			InspectFrameTab1RightDisabled,
			InspectFrameTab2Left,
			InspectFrameTab2LeftDisabled,
			InspectFrameTab2Middle,
			InspectFrameTab2MiddleDisabled,
			InspectFrameTab2Right,
			InspectFrameTab2RightDisabled,
			InspectFrameTab3Left,
			InspectFrameTab3LeftDisabled,
			InspectFrameTab3Middle,
			InspectFrameTab3MiddleDisabled,
			InspectFrameTab3Right,
			InspectFrameTab3RightDisabled,
			InspectFrameTab4Left,
			InspectFrameTab4LeftDisabled,
			InspectFrameTab4Middle,
			InspectFrameTab4MiddleDisabled,
			InspectFrameTab4Right,
			InspectFrameTab4RightDisabled, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					InspectFrameInset.NineSlice,
					InspectFrameInset.NineSlice.BottomLeftCorner,
					InspectFrameInset.NineSlice.BottomRightCorner,
					InspectFrameInset.NineSlice.BottomEdge,
					InspectFrameInset.NineSlice.LeftEdge,
					InspectModelFrameBorderBottom,
					InspectModelFrameBorderBottom2,
					InspectModelFrameBorderLeft,
					InspectModelFrameBorderRight,
					InspectModelFrameBorderTop,
				}) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- Wardrobe/Transmogrify
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			WardrobeFrame.NineSlice.TopEdge,
			WardrobeFrame.NineSlice.RightEdge,
			WardrobeFrame.NineSlice.BottomEdge,
			WardrobeFrame.NineSlice.LeftEdge,
			WardrobeFrame.NineSlice.TopRightCorner,
			WardrobeFrame.NineSlice.TopLeftCorner,
			WardrobeFrame.NineSlice.BottomLeftCorner,
		WardrobeFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.BottomLeftCorner,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.BottomRightCorner,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.BottomEdge,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.LeftEdge,
					WardrobeTransmogFrame.Inset.NineSlice,
					WardrobeTransmogFrame.Inset.NineSlice.BottomLeftCorner,
					WardrobeTransmogFrame.Inset.NineSlice.BottomRightCorner,
					WardrobeTransmogFrame.Inset.NineSlice.BottomEdge,
				WardrobeTransmogFrame.Inset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- ClassTrainer/FlightMaster
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			ClassTrainerFrame.NineSlice.TopEdge,
			ClassTrainerFrame.NineSlice.RightEdge,
			ClassTrainerFrame.NineSlice.BottomEdge,
			ClassTrainerFrame.NineSlice.LeftEdge,
			ClassTrainerFrame.NineSlice.TopRightCorner,
			ClassTrainerFrame.NineSlice.TopLeftCorner,
			ClassTrainerFrame.NineSlice.BottomLeftCorner,
			ClassTrainerFrame.NineSlice.BottomRightCorner,
		ClassTrainerFrameInset.NineSlice.BottomEdge, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					ClassTrainerFrameInset.NineSlice,
					ClassTrainerFrameInset.NineSlice.BottomLeftCorner,
					ClassTrainerFrameInset.NineSlice.BottomRightCorner,
					ClassTrainerFrameInset.NineSlice.BottomEdge,
				ClassTrainerFrameInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- Achievement
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" and GetWoWVersion >= 30000 then
		for i, v in pairs({ 
			AchievementFrameHeaderRight,
			AchievementFrameHeaderLeft,
			AchievementFrameWoodBorderTopLeft,
			AchievementFrameWoodBorderBottomLeft,
			AchievementFrameWoodBorderTopRight,
			AchievementFrameWoodBorderBottomRight,
			AchievementFrameMetalBorderBottom,
			AchievementFrameMetalBorderBottomLeft,
			AchievementFrameMetalBorderBottomRight,
			AchievementFrameMetalBorderLeft,
			AchievementFrameMetalBorderRight,
			AchievementFrameMetalBorderTop,
			AchievementFrameMetalBorderTopLeft,
		AchievementFrameMetalBorderTopRight, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- Azerite
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.TopEdge,
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.RightEdge,
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.BottomEdge,
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.LeftEdge,
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.TopRightCorner,
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.TopLeftCorner,
			AzeriteEmpoweredItemUI.BorderFrame.NineSlice.BottomLeftCorner,
		AzeriteEmpoweredItemUI.BorderFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- AlliedRaces
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AlliedRacesUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			AlliedRacesFrame.NineSlice.TopEdge,
			AlliedRacesFrame.NineSlice.RightEdge,
			AlliedRacesFrame.NineSlice.BottomEdge,
			AlliedRacesFrame.NineSlice.LeftEdge,
			AlliedRacesFrame.NineSlice.TopRightCorner,
			AlliedRacesFrame.NineSlice.TopLeftCorner,
			AlliedRacesFrame.NineSlice.BottomLeftCorner,
		AlliedRacesFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					AlliedRacesFrameInset.NineSlice,
					AlliedRacesFrameInset.NineSlice.BottomLeftCorner,
					AlliedRacesFrameInset.NineSlice.BottomRightCorner,
					AlliedRacesFrameInset.NineSlice.BottomEdge,
				AlliedRacesFrameInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- Inslands
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_IslandsQueueUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			IslandsQueueFrame.NineSlice.TopEdge,
			IslandsQueueFrame.NineSlice.RightEdge,
			IslandsQueueFrame.NineSlice.BottomEdge,
			IslandsQueueFrame.NineSlice.LeftEdge,
			IslandsQueueFrame.NineSlice.TopRightCorner,
			IslandsQueueFrame.NineSlice.TopLeftCorner,
			IslandsQueueFrame.NineSlice.BottomLeftCorner,
			IslandsQueueFrame.NineSlice.BottomRightCorner,
		IslandsQueueFrame.ArtOverlayFrame.PortraitFrame, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- GarrisonCapacitive
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			GarrisonCapacitiveDisplayFrame.NineSlice.TopEdge,
			GarrisonCapacitiveDisplayFrame.NineSlice.RightEdge,
			GarrisonCapacitiveDisplayFrame.NineSlice.BottomEdge,
			GarrisonCapacitiveDisplayFrame.NineSlice.LeftEdge,
			GarrisonCapacitiveDisplayFrame.NineSlice.TopRightCorner,
			GarrisonCapacitiveDisplayFrame.NineSlice.TopLeftCorner,
			GarrisonCapacitiveDisplayFrame.NineSlice.BottomLeftCorner,
		GarrisonCapacitiveDisplayFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					GarrisonCapacitiveDisplayFrameInset.NineSlice,
					GarrisonCapacitiveDisplayFrameInset.NineSlice.BottomLeftCorner,
					GarrisonCapacitiveDisplayFrameInset.NineSlice.BottomRightCorner,
					GarrisonCapacitiveDisplayFrameInset.NineSlice.BottomEdge,
				GarrisonCapacitiveDisplayFrameInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- Calendar
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Calendar" and GetWoWVersion >= 30000 then
		for i, v in pairs({ 
			CalendarFrameTopMiddleTexture,
			CalendarFrameRightTopTexture,
			CalendarFrameRightMiddleTexture,
			CalendarFrameRightBottomTexture,
			CalendarFrameBottomRightTexture,
			CalendarFrameBottomMiddleTexture,
			CalendarFrameBottomLeftTexture,
			CalendarFrameLeftMiddleTexture,
			CalendarFrameLeftTopTexture,
			CalendarFrameLeftBottomTexture,
			CalendarFrameTopLeftTexture,
			CalendarFrameTopRightTexture,
			CalendarCreateEventFrame.Header.CenterBG,
			CalendarCreateEventFrame.Header.LeftBG,
			CalendarCreateEventFrame.Header.RightBG,
			CalendarCreateEventFrame.Border.TopEdge,
			CalendarCreateEventFrame.Border.RightEdge,
			CalendarCreateEventFrame.Border.BottomEdge,
			CalendarCreateEventFrame.Border.LeftEdge,
			CalendarCreateEventFrame.Border.TopRightCorner,
			CalendarCreateEventFrame.Border.TopLeftCorner,
			CalendarCreateEventFrame.Border.BottomLeftCorner,
			CalendarCreateEventFrame.Border.BottomRightCorner,
			CalendarViewHolidayFrame.Header.CenterBG,
			CalendarViewHolidayFrame.Header.LeftBG,
			CalendarViewHolidayFrame.Header.RightBG,
			CalendarViewHolidayFrame.Border.TopEdge,
			CalendarViewHolidayFrame.Border.RightEdge,
			CalendarViewHolidayFrame.Border.BottomEdge,
			CalendarViewHolidayFrame.Border.LeftEdge,
			CalendarViewHolidayFrame.Border.TopRightCorner,
			CalendarViewHolidayFrame.Border.TopLeftCorner,
			CalendarViewHolidayFrame.Border.BottomLeftCorner,
			CalendarViewHolidayFrame.Border.BottomRightCorner,
			CalendarEventPickerFrame.Header.CenterBG,
			CalendarEventPickerFrame.Header.LeftBG,
			CalendarEventPickerFrame.Header.RightBG,
			CalendarEventPickerFrame.Border.TopEdge,
			CalendarEventPickerFrame.Border.RightEdge,
			CalendarEventPickerFrame.Border.BottomEdge,
			CalendarEventPickerFrame.Border.LeftEdge,
			CalendarEventPickerFrame.Border.TopRightCorner,
			CalendarEventPickerFrame.Border.TopLeftCorner,
			CalendarEventPickerFrame.Border.BottomLeftCorner,
		CalendarEventPickerFrame.Border.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- AzeriteRespec
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteRespecUI" then
		for i, v in pairs({ 
			AzeriteRespecFrame.NineSlice.TopEdge,
			AzeriteRespecFrame.NineSlice.RightEdge,
			AzeriteRespecFrame.NineSlice.BottomEdge,
			AzeriteRespecFrame.NineSlice.LeftEdge,
			AzeriteRespecFrame.NineSlice.TopRightCorner,
			AzeriteRespecFrame.NineSlice.TopLeftCorner,
			AzeriteRespecFrame.NineSlice.BottomLeftCorner,
		AzeriteRespecFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- ScrappingMachineFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ScrappingMachineUI" then
		for i, v in pairs({ 
			ScrappingMachineFrame.NineSlice.TopEdge,
			ScrappingMachineFrame.NineSlice.RightEdge,
			ScrappingMachineFrame.NineSlice.BottomEdge,
			ScrappingMachineFrame.NineSlice.LeftEdge,
			ScrappingMachineFrame.NineSlice.TopRightCorner,
			ScrappingMachineFrame.NineSlice.TopLeftCorner,
			ScrappingMachineFrame.NineSlice.BottomLeftCorner,
		ScrappingMachineFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- TimeManagerFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" then
		if (GetWoWVersion > 30600) then
			for i, v in pairs({ 
				TimeManagerFrame.NineSlice.TopEdge,
				TimeManagerFrame.NineSlice.RightEdge,
				TimeManagerFrame.NineSlice.BottomEdge,
				TimeManagerFrame.NineSlice.LeftEdge,
				TimeManagerFrame.NineSlice.TopRightCorner,
				TimeManagerFrame.NineSlice.TopLeftCorner,
				TimeManagerFrame.NineSlice.BottomLeftCorner,
				TimeManagerFrame.NineSlice.BottomRightCorner,
				TimeManagerFrameInset.NineSlice.TopEdge,
				TimeManagerFrameInset.NineSlice.RightEdge,
				TimeManagerFrameInset.NineSlice.LeftEdge,
				TimeManagerFrameInset.NineSlice.TopRightCorner,
				TimeManagerFrameInset.NineSlice.TopLeftCorner,
				StopwatchFrameBackgroundLeft, }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
					for i, v in pairs({
						TimeManagerFrameInset.NineSlice,
						TimeManagerFrameInset.NineSlice.BottomLeftCorner,
						TimeManagerFrameInset.NineSlice.BottomRightCorner,
						TimeManagerFrameInset.NineSlice.BottomEdge,
					TimeManagerFrameInset.NineSlice.LeftEdge, }) do
						v:SetAlpha(0)
					end
				else
					return nil
				end
			end
		end
	end
end)
-- AzeriteEssenceUI
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteEssenceUI" then
		for i, v in pairs({ 
			AzeriteEssenceUI.NineSlice.TopEdge,
			AzeriteEssenceUI.NineSlice.RightEdge,
			AzeriteEssenceUI.NineSlice.BottomEdge,
			AzeriteEssenceUI.NineSlice.LeftEdge,
			AzeriteEssenceUI.NineSlice.TopRightCorner,
			AzeriteEssenceUI.NineSlice.TopLeftCorner,
			AzeriteEssenceUI.NineSlice.BottomLeftCorner,
		AzeriteEssenceUI.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- PvP UI
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			PVPQueueFrame.HonorInset.NineSlice,
			PVPQueueFrame.HonorInset.NineSlice.BottomLeftCorner,
			PVPQueueFrame.HonorInset.NineSlice.BottomRightCorner,
			PVPQueueFrame.HonorInset.NineSlice.BottomEdge,
			HonorFrame.Inset.NineSlice,
			HonorFrame.Inset.NineSlice.BottomLeftCorner,
			HonorFrame.Inset.NineSlice.BottomRightCorner,
			HonorFrame.Inset.NineSlice.BottomEdge,
			ConquestFrame.Inset.NineSlice,
			ConquestFrame.Inset.NineSlice.BottomLeftCorner,
			ConquestFrame.Inset.NineSlice.BottomRightCorner,
			ConquestFrame.Inset.NineSlice.BottomEdge,
			LFGListFrame.CategorySelection.Inset.NineSlice,
			LFGListFrame.CategorySelection.Inset.NineSlice.BottomLeftCorner,
			LFGListFrame.CategorySelection.Inset.NineSlice.BottomRightCorner,
		LFGListFrame.CategorySelection.Inset.NineSlice.BottomEdge, }) do
			v:SetAlpha(0)
		end
	end
end)
-- Challenges
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChallengesUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			ChallengesFrameInset.NineSlice,
			ChallengesFrameInset.NineSlice.BottomLeftCorner,
			ChallengesFrameInset.NineSlice.BottomRightCorner,
			ChallengesFrameInset.NineSlice.BottomEdge,
		ChallengesFrameInset.NineSlice.LeftEdge, }) do
			v:SetAlpha(0)
		end
	end
end)
-- Archaeology
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ArchaeologyUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			ArchaeologyFrame.NineSlice.TopEdge,
			ArchaeologyFrame.NineSlice.RightEdge,
			ArchaeologyFrame.NineSlice.BottomEdge,
			ArchaeologyFrame.NineSlice.LeftEdge,
			ArchaeologyFrame.NineSlice.TopRightCorner,
			ArchaeologyFrame.NineSlice.TopLeftCorner,
			ArchaeologyFrame.NineSlice.BottomLeftCorner,
		ArchaeologyFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
				for i, v in pairs({
					ArchaeologyFrameInset.NineSlice,
					ArchaeologyFrameInset.NineSlice.BottomLeftCorner,
					ArchaeologyFrameInset.NineSlice.BottomRightCorner,
					ArchaeologyFrameInset.NineSlice.BottomEdge,
				ArchaeologyFrameInset.NineSlice.LeftEdge, }) do
					v:SetAlpha(0)
				end
			else
				return nil
			end
		end
	end
end)
-- KeybindOptions (Keybind)
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BindingUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			KeyBindingFrame.BG.TopEdge,
			KeyBindingFrame.BG.RightEdge,
			KeyBindingFrame.BG.BottomEdge,
			KeyBindingFrame.BG.LeftEdge,
			KeyBindingFrame.BG.TopRightCorner,
			KeyBindingFrame.BG.TopLeftCorner,
			KeyBindingFrame.BG.BottomLeftCorner,
			KeyBindingFrame.BG.BottomRightCorner,
			KeyBindingFrame.Header.RightBG,
			KeyBindingFrame.Header.CenterBG,
		KeyBindingFrame.Header.LeftBG, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- OrderHallTalent
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_OrderHallUI" and GetWoWVersion > 30600 then
		for i, v in pairs({ 
			OrderHallTalentFrame.NineSlice.TopEdge,
			OrderHallTalentFrame.NineSlice.RightEdge,
			OrderHallTalentFrame.NineSlice.BottomEdge,
			OrderHallTalentFrame.NineSlice.LeftEdge,
			OrderHallTalentFrame.NineSlice.TopRightCorner,
			OrderHallTalentFrame.NineSlice.TopLeftCorner,
			OrderHallTalentFrame.NineSlice.BottomLeftCorner,
			OrderHallTalentFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- GarrisonRecruiterFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" and GetWoWVersion > 30600 then
		for i, v in pairs({
			GarrisonRecruiterFrame.NineSlice.TopEdge,
			GarrisonRecruiterFrame.NineSlice.RightEdge,
			GarrisonRecruiterFrame.NineSlice.BottomEdge,
			GarrisonRecruiterFrame.NineSlice.LeftEdge,
			GarrisonRecruiterFrame.NineSlice.TopRightCorner,
			GarrisonRecruiterFrame.NineSlice.TopLeftCorner,
			GarrisonRecruiterFrame.NineSlice.BottomLeftCorner,
			GarrisonRecruiterFrame.NineSlice.BottomRightCorner,
			GarrisonRecruitSelectFrame.TopBorder,
			GarrisonRecruitSelectFrame.RightBorder,
			GarrisonRecruitSelectFrame.TopRightCorner,
			GarrisonRecruitSelectFrame.BottomRightCorner,
			GarrisonRecruitSelectFrame.BottomBorder,
			GarrisonRecruitSelectFrame.BottomLeftCorner,
			GarrisonRecruitSelectFrame.LeftBorder,
		GarrisonRecruitSelectFrame.TopLeftCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- ChromieTimeFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChromieTimeUI" and GetWoWVersion > 30600 then
		for i, v in pairs({
			ChromieTimeFrame.NineSlice.TopEdge,
			ChromieTimeFrame.NineSlice.RightEdge,
			ChromieTimeFrame.NineSlice.BottomEdge,
			ChromieTimeFrame.NineSlice.LeftEdge,
			ChromieTimeFrame.NineSlice.TopRightCorner,
			ChromieTimeFrame.NineSlice.TopLeftCorner,
			ChromieTimeFrame.NineSlice.BottomLeftCorner,
		ChromieTimeFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- GuideFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_NewPlayerExperienceGuide" and GetWoWVersion > 30600 then
		for i, v in pairs({
			GuideFrame.NineSlice.TopEdge,
			GuideFrame.NineSlice.RightEdge,
			GuideFrame.NineSlice.BottomEdge,
			GuideFrame.NineSlice.LeftEdge,
			GuideFrame.NineSlice.TopRightCorner,
			GuideFrame.NineSlice.TopLeftCorner,
			GuideFrame.NineSlice.BottomLeftCorner,
		GuideFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- ItemSocketingFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemSocketingUI" and GetWoWVersion > 30600 then
		for i, v in pairs({
			ItemSocketingFrame.NineSlice.TopEdge,
			ItemSocketingFrame.NineSlice.RightEdge,
			ItemSocketingFrame.NineSlice.BottomEdge,
			ItemSocketingFrame.NineSlice.LeftEdge,
			ItemSocketingFrame.NineSlice.TopRightCorner,
			ItemSocketingFrame.NineSlice.TopLeftCorner,
			ItemSocketingFrame.NineSlice.BottomLeftCorner,
		ItemSocketingFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- ItemUpgrade
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemUpgradeUI" and GetWoWVersion > 30600 then
		for i, v in pairs({
			ItemUpgradeFrame.NineSlice.TopEdge,
			ItemUpgradeFrame.NineSlice.RightEdge,
			ItemUpgradeFrame.NineSlice.BottomEdge,
			ItemUpgradeFrame.NineSlice.LeftEdge,
			ItemUpgradeFrame.NineSlice.TopRightCorner,
			ItemUpgradeFrame.NineSlice.TopLeftCorner,
			ItemUpgradeFrame.NineSlice.BottomLeftCorner,
		ItemUpgradeFrame.NineSlice.BottomRightCorner, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- GameTooltip
if (GetWoWVersion <= 90500) then
	GameTooltip:HookScript("OnTooltipSetUnit", function(self, elapsed)
		for i, v in pairs({
			GameTooltip.BottomEdge,
			GameTooltip.TopEdge,
			GameTooltip.RightEdge,
			GameTooltip.BottomEdge,
			GameTooltip.LeftEdge,
			GameTooltip.TopRightCorner,
			GameTooltip.TopLeftCorner,
			GameTooltip.BottomLeftCorner,
			GameTooltip.BottomRightCorner,
		}) do
		 AbyssUI_ColorizationFrameFunction(v)
		end
	end)
elseif (GetWoWVersion >= 90500) then
	GameTooltip:HookScript("OnShow", function(self, elapsed)
		for i, v in pairs({
			GameTooltip.NineSlice.BottomEdge,
			GameTooltip.NineSlice.TopEdge,
			GameTooltip.NineSlice.RightEdge,
			GameTooltip.NineSlice.BottomEdge,
			GameTooltip.NineSlice.LeftEdge,
			GameTooltip.NineSlice.TopRightCorner,
			GameTooltip.NineSlice.TopLeftCorner,
			GameTooltip.NineSlice.BottomLeftCorner,
			GameTooltip.NineSlice.BottomRightCorner,
		}) do
		 AbyssUI_ColorizationFrameFunction(v)
		end
	end)
end
-- LFGDungeonReadyDialog
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, name)
	if GetWoWVersion > 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { LFGDungeonReadyDialog.Border:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
    for i, v in pairs ({
    	LFGDungeonReadyDialogYourRoleDescription,
    	LFGDungeonReadyDialogRoleLabel,
    	LFGDungeonReadyDialogLabel,
    }) do
    	v:SetVertexColor(219/255, 222/255, 231/255)
    end
	end
end)
--------------------------------------------------------------
-- UnitColor
local UnitColor
local function UnitColor(unit)
  if (AbyssUIAddonSettings.UnitFrameImproved == true) then
    local r, g, b, a
    if ((not UnitIsPlayer(unit)) and ((not UnitIsConnected(unit)) or (UnitIsDeadOrGhost(unit)))) then
      --Color it gray
      r, g, b, a = 0.5, 0.5, 0.5, 1
    elseif (UnitIsPlayer(unit)) then
      --Try to color it by class.
      local localizedClass, englishClass = UnitClass(unit)
      local classColor = RAID_CLASS_COLORS[englishClass]
      if (classColor and not AbyssUIAddonSettings.GreenHealth) then
        r, g, b, a = classColor.r, classColor.g, classColor.b, classColor.a
      else
        if (UnitIsFriend("player", unit)) then
          r, g, b, a = 0.0, 1.0, 0.0, 1
        else
          r, g, b, a = 1.0, 0.0, 0.0, 1
        end
      end
    else
      r, g, b, a = UnitSelectionColor(unit)
    end
    return r, g, b, a
  end
end
---------------------------- Classic Frames ----------------------------------
local ClassicFrames = CreateFrame("Frame")
ClassicFrames:RegisterEvent("ADDON_LOADED")
ClassicFrames:SetScript("OnEvent", function(self, event, addon)
	if (addon == "DefaultUI_DemonHunter") then
		if GetWoWVersion <= 30600 then
			-- General
			for i, v in pairs({ 
				MiniMapTrackingBorder,
				GameTimeTexture,
				MainMenuXPBarTexture0,
				MainMenuXPBarTexture1,
				MainMenuXPBarTexture2,
				MainMenuXPBarTexture3,
				ReputationWatchBar.StatusBar.WatchBarTexture0,
				ReputationWatchBar.StatusBar.WatchBarTexture1,
				ReputationWatchBar.StatusBar.WatchBarTexture2,
				ReputationWatchBar.StatusBar.WatchBarTexture3,
				ChatFrame1EditBoxLeft,
				ChatFrame1EditBoxMid,
				ChatFrame1EditBoxRight,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			--GameMenuFrame
			for i, v in pairs({ 
				GameMenuFrame.BottomEdge,
				GameMenuFrame.BottomLeftCorner,
				GameMenuFrame.BottomRightCorner,
				GameMenuFrame.Center,
				GameMenuFrame.LeftEdge,
				GameMenuFrame.RightEdge,
				GameMenuFrame.TopLeftCorner,
				GameMenuFrame.TopRightCorner,
				GameMenuFrameHeader,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					if GetWoWVersion > 10000 then
						AbyssUI_ColorizationFrameFunction(v)
					end
				end
			end
			-- HelpFrame
			for i, v in pairs({ 
				HelpFrameTopBorder,
				HelpFrameTopLeftCorner,
				HelpFrameTopRightCorner,
				HelpFrameBotLeftCorner,
				HelpFrameBotRightCorner,
				HelpFrameLeftBorder,
				HelpFrameRightBorder,
				HelpFrameBottomBorder,
				HelpFrameBtnCornerLeft,
				HelpFrameBtnCornerRight,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- InterfaceOptionsFrame
			for i, v in pairs({ 
				InterfaceOptionsFrame.BottomEdge,
				InterfaceOptionsFrame.BottomLeftCorner,
				InterfaceOptionsFrame.BottomRightCorner,
				InterfaceOptionsFrame.Center,
				InterfaceOptionsFrame.LeftEdge,
				InterfaceOptionsFrame.RightEdge,
				InterfaceOptionsFrame.TopEdge,
				InterfaceOptionsFrame.TopLeftCorner,
				InterfaceOptionsFrame.TopRightCorner,
				InterfaceOptionsFrameHeader,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- VideoOptionsFrame
			for i, v in pairs({ 
				VideoOptionsFrame.BottomEdge,
				VideoOptionsFrame.BottomLeftCorner,
				VideoOptionsFrame.BottomRightCorner,
				VideoOptionsFrame.Center,
				VideoOptionsFrame.LeftEdge,
				VideoOptionsFrame.RightEdge,
				VideoOptionsFrame.TopEdge,
				VideoOptionsFrame.TopLeftCorner,
				VideoOptionsFrame.TopRightCorner,
				VideoOptionsFrameHeader,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- AddonList
			for i, v in pairs({ 
				AddonListTopBorder,
				AddonListTopLeftCorner,
				AddonListTopRightCorner,
				AddonListBotLeftCorner,
				AddonListBotRightCorner,
				AddonListLeftBorder,
				AddonListRightBorder,
				AddonListBottomBorder,
				AddonListButtonBottomBorder,
				AddonListBtnCornerLeft,
				AddonListBtnCornerRight,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame1
			for i, v in pairs({ 
				ContainerFrame1Background1Slot,
				ContainerFrame1BackgroundBottom,
				ContainerFrame1BackgroundMiddle1,
				ContainerFrame1BackgroundMiddle2,
				ContainerFrame1BackgroundTop,
				ContainerFrame1BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame2
			for i, v in pairs({ 
				ContainerFrame2Background1Slot,
				ContainerFrame2BackgroundBottom,
				ContainerFrame2BackgroundMiddle1,
				ContainerFrame2BackgroundMiddle2,
				ContainerFrame2BackgroundTop,
				ContainerFrame2BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame3
			for i, v in pairs({ 
				ContainerFrame3Background1Slot,
				ContainerFrame3BackgroundBottom,
				ContainerFrame3BackgroundMiddle1,
				ContainerFrame3BackgroundMiddle2,
				ContainerFrame3BackgroundTop,
				ContainerFrame3BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame4
			for i, v in pairs({ 
				ContainerFrame4Background1Slot,
				ContainerFrame4BackgroundBottom,
				ContainerFrame4BackgroundMiddle1,
				ContainerFrame4BackgroundMiddle2,
				ContainerFrame4BackgroundTop,
				ContainerFrame4BackgroundPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- ContainerFrame5
			for i, v in pairs({ 
				ContainerFrame5Background1Slot,
				ContainerFrame5BackgroundBottom,
				ContainerFrame5BackgroundMiddle1,
				ContainerFrame5BackgroundMiddle2,
				ContainerFrame5BackgroundTop,
				ContainerFrame5BackgroundPortrait,
		 	 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- StaticPopUp ("LogoutFrame")
			for i, v in pairs({	
				StaticPopup1.BottomEdge,
				StaticPopup1.BottomLeftCorner,
				StaticPopup1.BottomRightCorner,
				StaticPopup1.Center,
				StaticPopup1.LeftEdge,
				StaticPopup1.RightEdge,
				StaticPopup1.TopEdge,
				StaticPopup1.TopLeftCorner,
				StaticPopup1.TopRightCorner,
				StaticPopup2.BottomEdge,
				StaticPopup2.BottomLeftCorner,
				StaticPopup2.BottomRightCorner,
				StaticPopup2.Center,
				StaticPopup2.LeftEdge,
				StaticPopup2.RightEdge,
				StaticPopup2.TopEdge,
				StaticPopup2.TopLeftCorner,
				StaticPopup2.TopRightCorner,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					if (not InCombatLockdown()) then
						AbyssUI_ColorizationFrameFunction(v)
					end
				end
			end
			-- FriendsFrame
			for i, v in pairs({ 
				FriendsFrameTopBorder,
				FriendsFrameTopLeftCorner,
				FriendsFrameTopRightCorner,
				FriendsFrameBotLeftCorner,
				FriendsFrameBotRightCorner,
				FriendsFrameLeftBorder,
				FriendsFrameRightBorder,
				FriendsFrameBottomBorder,
				FriendsFrameButtonBottomBorder,
				FriendsFrameBtnCornerLeft,
				FriendsFrameBtnCornerRight,
				FriendsFramePortraitFrame,
				FriendsFrameTab1Left,
				FriendsFrameTab1LeftDisabled,
				FriendsFrameTab1Middle,
				FriendsFrameTab1MiddleDisabled,
				FriendsFrameTab1Right,
				FriendsFrameTab1RightDisabled,
				FriendsFrameTab2Left,
				FriendsFrameTab2LeftDisabled,
				FriendsFrameTab2Middle,
				FriendsFrameTab2MiddleDisabled,
				FriendsFrameTab2Right,
				FriendsFrameTab2RightDisabled,
				FriendsFrameTab3Left,
				FriendsFrameTab3LeftDisabled,
				FriendsFrameTab3Middle,
				FriendsFrameTab3MiddleDisabled,
				FriendsFrameTab3Right,
				FriendsFrameTab3RightDisabled,
				FriendsFrameTab4Left,
				FriendsFrameTab4LeftDisabled,
				FriendsFrameTab4Middle,
				FriendsFrameTab4MiddleDisabled,
				FriendsFrameTab4Right,
				FriendsFrameTab4RightDisabled,
				FriendsFrameBattlenetFrame.BroadcastFrame.BottomEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.BottomLeftCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.BottomRightCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.Center,
				FriendsFrameBattlenetFrame.BroadcastFrame.LeftEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.RightEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.TopEdge,
				FriendsFrameBattlenetFrame.BroadcastFrame.TopLeftCorner,
				FriendsFrameBattlenetFrame.BroadcastFrame.TopRightCorner,
				DropDownList1Backdrop.BottomEdge,
				DropDownList1Backdrop.BottomLeftCorner,
				DropDownList1Backdrop.BottomRightCorner,
				DropDownList1Backdrop.Center,
				DropDownList1Backdrop.LeftEdge,
				DropDownList1Backdrop.RightEdge,
				DropDownList1Backdrop.TopEdge,
				DropDownList1Backdrop.TopLeftCorner,
				DropDownList1Backdrop.TopRightCorner,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- MerchantFrame
			for i, v in pairs({ 
				MerchantFrameTopBorder,
				MerchantFrameTopLeftCorner,
				MerchantFrameTopRightCorner,
				MerchantFrameBotLeftCorner,
				MerchantFrameBotRightCorner,
				MerchantFrameLeftBorder,
				MerchantFrameRightBorder,
				MerchantFrameBottomBorder,
				MerchantFrameButtonBottomBorder,
				MerchantFrameBtnCornerLeft,
				MerchantFrameBtnCornerRight,
				MerchantFramePortraitFrame,
				MerchantFrameTab1Left,
				MerchantFrameTab1LeftDisabled,
				MerchantFrameTab1Middle,
				MerchantFrameTab1MiddleDisabled,
				MerchantFrameTab1Right,
				MerchantFrameTab1RightDisabled,
				MerchantFrameTab2Left,
				MerchantFrameTab2LeftDisabled,
				MerchantFrameTab2Middle,
				MerchantFrameTab2MiddleDisabled,
				MerchantFrameTab2Right,
				MerchantFrameTab2RightDisabled,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- CharacterFrame
			for i, v in pairs({
				CharacterFrameTab1Left,
				CharacterFrameTab1LeftDisabled,
				CharacterFrameTab1Middle,
				CharacterFrameTab1MiddleDisabled,
				CharacterFrameTab1Right,
				CharacterFrameTab1RightDisabled,
				CharacterFrameTab2Left,
				CharacterFrameTab2LeftDisabled,
				CharacterFrameTab2Middle,
				CharacterFrameTab2MiddleDisabled,
				CharacterFrameTab2Right,
				CharacterFrameTab2RightDisabled,
				CharacterFrameTab3Left,
				CharacterFrameTab3LeftDisabled,
				CharacterFrameTab3Middle,
				CharacterFrameTab3MiddleDisabled,
				CharacterFrameTab3Right,
				CharacterFrameTab3RightDisabled,
				CharacterFrameTab4Left,
				CharacterFrameTab4LeftDisabled,
				CharacterFrameTab4Middle,
				CharacterFrameTab4MiddleDisabled,
				CharacterFrameTab4Right,
				CharacterFrameTab4RightDisabled,
				CharacterFrameTab5Left,
				CharacterFrameTab5LeftDisabled,
				CharacterFrameTab5Middle,
				CharacterFrameTab5MiddleDisabled,
				CharacterFrameTab5Right,
				CharacterFrameTab5RightDisabled,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- MailFrame
			for i, v in pairs({ 
				MailFrameTopBorder,
				MailFrameTopLeftCorner,
				MailFrameTopRightCorner,
				MailFrameBotLeftCorner,
				MailFrameBotRightCorner,
				MailFrameLeftBorder,
				MailFrameRightBorder,
				MailFrameBottomBorder,
				MailFrameButtonBottomBorder,
				MailFrameBtnCornerLeft,
				MailFrameBtnCornerRight,
				MailFramePortraitFrame,
				MailFrameTab1Left,
				MailFrameTab1LeftDisabled,
				MailFrameTab1Middle,
				MailFrameTab1MiddleDisabled,
				MailFrameTab1Right,
				MailFrameTab1RightDisabled,
				MailFrameTab2Left,
				MailFrameTab2LeftDisabled,
				MailFrameTab2Middle,
				MailFrameTab2MiddleDisabled,
				MailFrameTab2Right,
			MailFrameTab2RightDisabled,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
			-- TradeFrame
			for i, v in pairs({ 
				TradeFrameTopBorder,
				TradeFrameTopLeftCorner,
				TradeFrameTopRightCorner,
				TradeFrameBotLeftCorner,
				TradeFrameBotRightCorner,
				TradeFrameLeftBorder,
				TradeFrameRightBorder,
				TradeFrameBottomBorder,
				TradeFrameBtnCornerLeft,
				TradeFrameBtnCornerRight,
				TradeFramePlayerPortrait,
				TradeFrameRecipientPortrait,
			 }) do
				if AbyssUIAddonSettings ~= nil then
					AbyssUI_ColorizationFrameFunction(v)
				end
			end
		-- End
		else
			return nil
		end
	end		
end)
---------------------------- Classic Functions ----------------------------------
-- KeyBindingFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BindingUI" and GetWoWVersion == 20502 and GetWoWVersion >= 12000 then
		for i, v in pairs({
			KeyBindingFrame.BottomEdge,
			KeyBindingFrame.BottomLeftCorner,
			KeyBindingFrame.BottomRightCorner,
			KeyBindingFrame.Center,
			KeyBindingFrame.LeftEdge,
			KeyBindingFrame.RightEdge,
			KeyBindingFrame.TopEdge,
			KeyBindingFrame.TopLeftCorner,
			KeyBindingFrame.TopRightCorner,
			KeyBindingFrameHeader, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- MacroFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" and GetWoWVersion <= 30600 then
		for i, v in pairs({
			MacroFramePortraitFrame,
			MacroFrameTopBorder,
			MacroFrameTopLeftCorner,
			MacroFrameTopRightCorner,
			MacroFrameBotLeftCorner,
			MacroFrameBotRightCorner,
			MacroFrameLeftBorder,
			MacroFrameRightBorder,
			MacroFrameBottomBorder,
			MacroFrameButtonBottomBorder,
			MacroFrameBtnCornerLeft,
			MacroFrameBtnCornerRight, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- TimeManagerFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" and GetWoWVersion <= 30600 then
		for i, v in pairs({
			TimeManagerFrameTopBorder,
			TimeManagerFrameTopLeftCorner,
			TimeManagerFrameTopRightCorner,
			TimeManagerFrameBotLeftCorner,
			TimeManagerFrameBotRightCorner,
			TimeManagerFrameLeftBorder,
			TimeManagerFrameRightBorder,
			TimeManagerFrameBottomBorder,
			TimeManagerFrameButtonBottomBorder,
			TimeManagerFrameBtnCornerLeft,
			TimeManagerFrameBtnCornerRight,
			TimeManagerFramePortraitFrame, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- AuctionFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionUI" and GetWoWVersion <= 30600 then
		for i, v in pairs({
			AuctionFrameBot,
			AuctionFrameBotLeft,
			AuctionFrameBotRight,
			AuctionFrameTop,
			AuctionFrameTopLeft,
			AuctionFrameTopRight,
			AuctionFrameTab1Left,
			AuctionFrameTab1LeftDisabled,
			AuctionFrameTab1Middle,
			AuctionFrameTab1MiddleDisabled,
			AuctionFrameTab1Right,
			AuctionFrameTab1RightDisabled,
			AuctionFrameTab2Left,
			AuctionFrameTab2LeftDisabled,
			AuctionFrameTab2Middle,
			AuctionFrameTab2MiddleDisabled,
			AuctionFrameTab2Right,
			AuctionFrameTab2RightDisabled,
			AuctionFrameTab3Left,
			AuctionFrameTab3LeftDisabled,
			AuctionFrameTab3Middle,
			AuctionFrameTab3MiddleDisabled,
			AuctionFrameTab3Right,
			AuctionFrameTab3RightDisabled, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- PlayerTalentFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TalentUI" and GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { PlayerTalentFrame:GetRegions() }
	local ChildRegions2 = {PlayerTalentFrameTab1Left,
	PlayerTalentFrameTab1Middle,
	PlayerTalentFrameTab1Right,
	PlayerTalentFrameTab1LeftDisabled,
	PlayerTalentFrameTab1MiddleDisabled,
	PlayerTalentFrameTab1RightDisabled,
	PlayerTalentFrameTab2Left,
	PlayerTalentFrameTab2Middle,
	PlayerTalentFrameTab2Right,
	PlayerTalentFrameTab2LeftDisabled,
	PlayerTalentFrameTab2MiddleDisabled,
	PlayerTalentFrameTab2RightDisabled,
	PlayerTalentFrameTab3Left,
	PlayerTalentFrameTab3Middle,
	PlayerTalentFrameTab3Right,
	PlayerTalentFrameTab3LeftDisabled,
	PlayerTalentFrameTab3MiddleDisabled,
	PlayerTalentFrameTab3RightDisabled,
	PlayerTalentFrameTab4Left,
	PlayerTalentFrameTab4Middle,
	PlayerTalentFrameTab4Right,
	PlayerTalentFrameTab4LeftDisabled,
	PlayerTalentFrameTab4MiddleDisabled,
	PlayerTalentFrameTab4RightDisabled,
	PlayerTalentFramePointsBarBackground,
 }
    local fs = {}
		for k, v in pairs(ChildRegions) do
			AbyssUI_ColorizationFrameFunction(v)
		end
		for k , v in pairs(ChildRegions2) do 
			AbyssUI_ColorizationFrameFunction(v)
		end	
		PlayerTalentFramePortrait:SetVertexColor(1, 1, 1)
	end
end)
-- ClassTrainerFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" and GetWoWVersion == 20502 and GetWoWVersion >= 12000 then
		self:UnregisterAllEvents()
    local ChildRegions = { ClassTrainerFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
	end
end)
-- PaperDollFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { PaperDollFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- ReputationFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { ReputationFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- SkillFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { SkillFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- PVPFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 and GetWoWVersion >= 12000 then
    self:UnregisterAllEvents()
    local ChildRegions = { PVPFrame:GetRegions() }
	local ChildRegions2 = {	PVPParentFrameTab1Left,
	PVPParentFrameTab1Middle,
	PVPParentFrameTab1Right,
	PVPParentFrameTab1LeftDisabled,
	PVPParentFrameTab1MiddleDisabled,
	PVPParentFrameTab1RightDisabled,
	PVPParentFrameTab2Left,
	PVPParentFrameTab2Middle,
	PVPParentFrameTab2Right,
	PVPParentFrameTab2LeftDisabled,
	PVPParentFrameTab2MiddleDisabled,
	PVPParentFrameTab2RightDisabled, }
    local fs = {}
		for k, v in pairs(ChildRegions) do
			AbyssUI_ColorizationFrameFunction(v)
		end
		for k , v in pairs(ChildRegions2) do 
			AbyssUI_ColorizationFrameFunction(v)
		end	
		PVPFramePortrait:SetVertexColor(1, 1, 1)
  end
end)
-- HonorFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion ~= 20502 and GetWoWVersion <= 12000 then
    self:UnregisterAllEvents()
    local ChildRegions = { HonorFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- SpellBookFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { SpellBookFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
    for i, v in pairs({
    	SpellButton1SubSpellName,
    	SpellButton2SubSpellName,
    	SpellButton3SubSpellName,
    	SpellButton4SubSpellName,
    	SpellButton5SubSpellName,
    	SpellButton6SubSpellName,
    	SpellButton7SubSpellName,
    	SpellButton8SubSpellName,
    	SpellButton9SubSpellName,
    	SpellButton10SubSpellName,
    	SpellButton11SubSpellName,
    	SpellButton12SubSpellName,
    }) do
    	v:SetVertexColor(219/255, 222/255, 231/255)
    end
  end
end)
-- QuestLogFrame
--[[
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
		if (AbyssUIAddonSettings.ExtraFunctionDisableQuestFrame ~= true) then
	    self:UnregisterAllEvents()
	    local ChildRegions = { QuestLogFrame:GetRegions(), QuestFrameDetailPanel:GetRegions() }
	    local fs = {}
	    for k, v in pairs(ChildRegions) do
	    	AbyssUI_ColorizationFrameFunction(v)
	    end
	    for i, v in pairs({ 
	    	QuestLogQuestTitle,
	    	QuestLogObjective1,
	    	QuestLogObjective2,
	    	QuestLogObjectivesText,
	    	QuestLogDescriptionTitle,
	    	QuestLogQuestDescription,
	    }) do
	    	v:SetVertexColor(219/255, 222/255, 231/255)
	    end
	  end
  end
end)
--]]
--[[
-- QuestFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 and GetWoWVersion >= 12000 then
		if (AbyssUIAddonSettings.ExtraFunctionDisableQuestFrame ~= true) then
	    self:UnregisterAllEvents()
	    local ChildRegions = { 
	    	QuestFrame:GetRegions(), 
	    	QuestLogDetailFrame:GetRegions(),
	  		QuestFrameProgressPanel:GetRegions(),
	  		QuestFrameRewardPanel:GetRegions()
	  	}
	    local ScrollRegions = { 
	    	QuestDetailScrollFrame:GetRegions(),
	     	QuestDetailScrollChildFrame:GetRegions(), 
	    	QuestLogDetailScrollFrame:GetRegions(), 
	     	QuestLogDetailScrollChildFrame:GetRegions(), 
	     	QuestRewardScrollFrame:GetRegions(), 
	     	QuestRewardScrollChildFrame:GetRegions(), 
	   		QuestInfoRewardsFrame:GetRegions(),
	   		QuestProgressTitleText,
	   		QuestProgressText,
	   		QuestInfoRewardText,
	    }
	    local fs = {}
	    for k, v in pairs(ChildRegions) do
	    	AbyssUI_ColorizationFrameFunction(v)
	    end
	    for k, v in pairs(ScrollRegions) do
	    	v:SetVertexColor(219/255, 222/255, 231/255)
	    end
  	end
  end
end)
--]]
--[[
-- GossipFrameGreetingPanel
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { GossipFrameGreetingPanel:GetRegions() }
    local ScrollRegions = { 
    	GossipGreetingScrollFrame:GetRegions(), 
     	GossipGreetingScrollChildFrame:GetRegions(),  }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
    for k, v in pairs(ScrollRegions) do
    	v:SetVertexColor(219/255, 222/255, 231/255)
    end
  end
end)
--]]
-- BankFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { BankFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
    for i, v in pairs({
	    BankFrameTab1Left,
			BankFrameTab1LeftDisabled,
			BankFrameTab1Middle,
			BankFrameTab1MiddleDisabled,
			BankFrameTab1Right,
			BankFrameTab1RightDisabled,
			BankFrameTab2Left,
			BankFrameTab2LeftDisabled,
			BankFrameTab2Middle,
			BankFrameTab2MiddleDisabled,
			BankFrameTab2Right,
			BankFrameTab2RightDisabled, 
	 	}) do
	 		AbyssUI_ColorizationFrameFunction(v)
		end
  end
end)
-- TaxiFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { TaxiFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- TabardFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { TabardFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- WorldMapFrame.BorderFrame
local leatrix = IsAddOnLoaded("Leatrix_Maps")
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 then
		if (not leatrix) then
			self:UnregisterAllEvents()
			local ChildRegions = { WorldMapFrame.BorderFrame:GetRegions() }
			local ChildRegions2 = { WorldMapFrame.MiniBorderFrame:GetRegions() }
			local fs = {}
			for k, v in pairs(ChildRegions) do
				AbyssUI_ColorizationFrameFunction(v)
			end
			for k, v in pairs(ChildRegions2) do
				AbyssUI_ColorizationFrameFunction(v)
			end
	 	end
  	end
end)
-- LFGParentFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 20600 and GetWoWVersion >= 12000 then
    self:UnregisterAllEvents()
    local ChildRegions = { LFGParentFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
   	for i, v in pairs({
	    LFGParentFrameTab1Left,
			LFGParentFrameTab1LeftDisabled,
			LFGParentFrameTab1Middle,
			LFGParentFrameTab1MiddleDisabled,
			LFGParentFrameTab1Right,
			LFGParentFrameTab1RightDisabled,
			LFGParentFrameTab2Left,
			LFGParentFrameTab2LeftDisabled,
			LFGParentFrameTab2Middle,
			LFGParentFrameTab2MiddleDisabled,
			LFGParentFrameTab2Right,
			LFGParentFrameTab2RightDisabled, 
	 	}) do
	 		AbyssUI_ColorizationFrameFunction(v)
		end
  end
end)
-- PVEFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 and GetWoWVersion >= 12000 then
    self:UnregisterAllEvents()
    local ChildRegions = { PVEFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- ArenaFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion >= 20502 and GetWoWVersion < 90000 then
    self:UnregisterAllEvents()
    local ChildRegions = { ArenaFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- InterfaceOptionsFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 12000 then
    self:UnregisterAllEvents()
    local ChildRegions = { InterfaceOptionsFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- VideoOptionsFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 12000 then
    self:UnregisterAllEvents()
    local ChildRegions = { VideoOptionsFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- HonorFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30000 then
    self:UnregisterAllEvents()
    local ChildRegions = { HonorFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- PlayerTalentFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" and GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { InspectPaperDollFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
	end
end)
---------------------------- Classic Dynamically ----------------------------------
-- Clock
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, name)
	if GetWoWVersion <= 30600 then
		loaded = IsAddOnLoaded("Blizzard_TimeManager")
		if not loaded then
			LoadAddOn('Blizzard_TimeManager')
		end
		local showclock = true
		if (showclock and not AbyssUIAddonSettings.ExtraFunctionMinimapClock) then
			local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
			clockFrame:Hide()
			clockTime:Show()
			TimeManagerClockButton:SetPoint("BOTTOM", Minimap, 0, -6)
			TimeManagerClockButton:SetAlpha(0)
		elseif (showclock and AbyssUIAddonSettings.ExtraFunctionMinimapClock) then
			LoadAddOn('Blizzard_TimeManager')
			local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
			clockFrame:Hide()
			clockTime:Show()
			clockTime:SetFont(damageFont, 12, "THINOUTLINE")
			TimeManagerClockButton:SetPoint("BOTTOM", Minimap, 0, -6)
			TimeManagerClockButton:SetAlpha(1)
		else
			TimeManagerClockButton.Show = TimeManagerClockButton.Hide
			local region = TimeManagerClockButton:GetRegions()
			region:Hide()	
			TimeManagerClockButton:ClearAllPoints()	
			TimeManagerClockButton:Hide()	
		end
		-- Clock/Calendar Handler
		Minimap:HookScript("OnEnter", function()
		  TimeManagerClockButton:SetAlpha(1)
		end)
		Minimap:HookScript("OnLeave", function()
			if not AbyssUIAddonSettings.ExtraFunctionMinimapClock then
		  	TimeManagerClockButton:SetAlpha(0)
			end
		end)
	end
end)
-- KeyBindingFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BindingUI" and GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { KeyBindingFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
	end
end)
-- PlayerTalentFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TalentUI" and GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { PlayerTalentFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
	end
end)
--[[
local function ChatHiderFunc()
	-- Chat Hide Frame (needs to be here so the hide chat buttons works on this too)
	-- Thanks to Syncrow for part of this 
	local ChatHideFrame = CreateFrame("Button", "$parentChatHideFrame", UIParent)
	ChatHideFrame:SetSize(30, 30)
	ChatHideFrame.t = ChatHideFrame:CreateTexture(nil, "BORDER")
	ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
	ChatHideFrame.t:SetAllPoints(ChatHideFrame)
	ChatHideFrame:SetPoint("BOTTOM","ChatFrame1ButtonFrame","BOTTOM", 0, -35)
	if ( AbyssUIAddonSettings.FadeUI ~= true ) then
	  ChatHideFrame:Show()
	else
	  ChatHideFrame:Hide()
	end

	local ChatHide = false
	ChatHideFrame:SetScript("OnMouseDown", function(self, Button)
	  if ChatHide == false then
	    if Button == "LeftButton" then
	      ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Down.blp")
	    end
	  elseif ChatHide == true then
	    if Button == "LeftButton" then
	      ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Down.blp")
	    end
	  end
	end)

	ChatHideFrame:SetScript("OnMouseUp", function(self, Button)
	  if ChatHide == false then
	    if Button == "LeftButton" then
	      ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
	    end
	  elseif ChatHide == true then
	    if Button == "LeftButton" then
	      ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
	    end
	  end
	end)

	ChatHideFrame:SetScript("OnClick", function(self, Button)
	  if ChatHide == false then
	    ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Maximize-Up.blp")
	    GeneralDockManager:Hide()
	    ChatFrameMenuButton:Hide()
	    ChatFrameChannelButton:Hide()
	    ChatFrame1EditBox:Hide()
	    if GetWoWVersion > 30600 then
	  		QuickJoinToastButton:Hide()
				ChatFrameToggleVoiceDeafenButton.Icon:Hide()
	    	ChatFrameToggleVoiceMuteButton.Icon:Hide()
	    end

	    for i = 1, NUM_CHAT_WINDOWS do
	      _G["ChatFrame"..i..""]:SetAlpha(0)
	      _G["ChatFrame"..i.."ButtonFrame"]:Hide()
	      _G["ChatFrame"..i.."EditBox"]:SetAlpha(0)
	    end
	    ChatHide = true
	  elseif ChatHide == true then
	    ChatHideFrame.t:SetTexture("Interface\\CHATFRAME\\UI-ChatIcon-Minimize-Up.blp")
	    GeneralDockManager:Show()
	    ChatFrameMenuButton:Show()
	    ChatFrameChannelButton:Show()
	    ChatFrame1EditBox:Show()
	    if GetWoWVersion > 30600 then
	  		QuickJoinToastButton:Show()
				ChatFrameToggleVoiceDeafenButton.Icon:Show()
	    	ChatFrameToggleVoiceMuteButton.Icon:Show()
	    end

	    for i = 1 , NUM_CHAT_WINDOWS do
	      _G["ChatFrame"..i..""]:SetAlpha(1)
	      _G["ChatFrame"..i.."ButtonFrame"]:Show()
	      _G["ChatFrame"..i.."EditBox"]:SetAlpha(1)
	    end
	    ChatHide = false
	  end
	end)
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	ChatHiderFunc()
end)
--]]
---------------------------- LichKing Classic Modules ----------------------------------
-- GlyphFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GlyphUI" and GetWoWVersion <= 30600 then
    self:UnregisterAllEvents()
    local ChildRegions = { GlyphFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
	end
end)
-- PetPaperDollFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 and GetWoWVersion >= 30000  then
    self:UnregisterAllEvents()
    local ChildRegions = { PetPaperDollFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
-- CollectionsJournal
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		for i, v in pairs({ CollectionsJournalTopBorder,
			CollectionsJournalTopRightCorner,
			CollectionsJournalRightBorder,
			CollectionsJournalBotRightCorner,
			CollectionsJournalBtnCornerRight,
			CollectionsJournalBottomBorder,
			CollectionsJournalBotLeftCorner,
			CollectionsJournalBtnCornerLeft,
			CollectionsJournalLeftBorder,
			CollectionsJournalPortraitFrame, }) do
			if AbyssUIAddonSettings ~= nil then
				AbyssUI_ColorizationFrameFunction(v)
			else
				return nil
			end
		end
	end
end)
-- LFGFrame
--[[
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 and GetWoWVersion >= 12000 then
    local ChildRegions = { LFGListingFrame:GetRegions(), LFGBrowseFrame:GetRegions(), }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
    for i, v in pairs({
    	LFGListingFrameFrameBackgroundTop,
			LFGListingFrameFrameBackgroundBottom,
    }) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
--]]
--[[
-- GameTimeFrame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
	if GetWoWVersion <= 30600 and GetWoWVersion >= 30000  then
    self:UnregisterAllEvents()
    local ChildRegions = { GameTimeFrame:GetRegions() }
    local fs = {}
    for k, v in pairs(ChildRegions) do
    	AbyssUI_ColorizationFrameFunction(v)
    end
  end
end)
--]]
---------------------------- NewUI Frames ----------------------------------
local ClassicFrames = CreateFrame("Frame")
ClassicFrames:RegisterEvent("ADDON_LOADED")
ClassicFrames:SetScript("OnEvent", function(self, event, addon)
    if (addon == "DefaultUI_DemonHunter") then
        if GetWoWVersion >= 90500 then
            -- General
            for i, v in pairs({ 
                PlayerFrame.PlayerFrameContainer.FrameTexture,
                TargetFrame.TargetFrameContainer.FrameTexture,
                FocusFrame.TargetFrameContainer.FrameTexture,
                TargetFrameToT.FrameTexture,
                PlayerFrameAlternateManaBarBorder,
                PlayerFrameAlternateManaBarLeftBorder,
                PlayerFrameAlternateManaBarRightBorder,
                MinimapCompassTexture,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
             -- SettingsPanel
            for i, v in pairs({ 
                SettingsPanel.NineSlice.RightEdge,
                SettingsPanel.NineSlice.LeftEdge,
                SettingsPanel.NineSlice.TopEdge,
                SettingsPanel.NineSlice.BottomEdge,
                SettingsPanel.NineSlice.PortraitFrame,
                SettingsPanel.NineSlice.TopRightCorner,
                SettingsPanel.NineSlice.TopLeftCorner,
                SettingsPanel.NineSlice.BottomLeftCorner,
                SettingsPanel.NineSlice.BottomRightCorner,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- HelpFrame
            for i, v in pairs({ 
                HelpFrame.NineSlice.RightEdge,
                HelpFrame.NineSlice.LeftEdge,
                HelpFrame.NineSlice.TopEdge,
                HelpFrame.NineSlice.BottomEdge,
                HelpFrame.NineSlice.PortraitFrame,
                HelpFrame.NineSlice.TopRightCorner,
                HelpFrame.NineSlice.TopLeftCorner,
                HelpFrame.NineSlice.BottomLeftCorner,
                HelpFrame.NineSlice.BottomRightCorner,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- Action Bar
            for i, v in pairs({ 
                MainMenuBar.EndCaps.RightEndCap,
                MainMenuBar.EndCaps.LeftEndCap,
                MainMenuBar.BorderArt,
                MainStatusTrackingBarContainer.BarFrameTexture,
                ActionButton1NormalTexture,
                ActionButton2NormalTexture,
                ActionButton3NormalTexture,
                ActionButton4NormalTexture,
                ActionButton5NormalTexture,
                ActionButton6NormalTexture,
                ActionButton7NormalTexture,
                ActionButton8NormalTexture,
                ActionButton9NormalTexture,
                ActionButton10NormalTexture,
                ActionButton11NormalTexture,
                ActionButton12NormalTexture,
                ActionButton1.RightDivider,
                ActionButton2.RightDivider,
                ActionButton3.RightDivider,
                ActionButton4.RightDivider,
                ActionButton5.RightDivider,
                ActionButton6.RightDivider,
                ActionButton7.RightDivider,
                ActionButton8.RightDivider,
                ActionButton9.RightDivider,
                ActionButton10.RightDivider,
                ActionButton11.RightDivider,
                MultiBarLeftButton1NormalTexture,
                MultiBarLeftButton2NormalTexture,
                MultiBarLeftButton3NormalTexture,
                MultiBarLeftButton4NormalTexture,
                MultiBarLeftButton5NormalTexture,
                MultiBarLeftButton6NormalTexture,
                MultiBarLeftButton7NormalTexture,
                MultiBarLeftButton8NormalTexture,
                MultiBarLeftButton9NormalTexture,
                MultiBarLeftButton10NormalTexture,
                MultiBarLeftButton11NormalTexture,
                MultiBarLeftButton12NormalTexture,
                MultiBarRightButton1NormalTexture,
                MultiBarRightButton2NormalTexture,
                MultiBarRightButton3NormalTexture,
                MultiBarRightButton4NormalTexture,
                MultiBarRightButton5NormalTexture,
                MultiBarRightButton6NormalTexture,
                MultiBarRightButton7NormalTexture,
                MultiBarRightButton8NormalTexture,
                MultiBarRightButton9NormalTexture,
                MultiBarRightButton10NormalTexture,
                MultiBarRightButton11NormalTexture,
                MultiBarRightButton12NormalTexture,
                MultiBarBottomLeftButton1NormalTexture,
                MultiBarBottomLeftButton2NormalTexture,
                MultiBarBottomLeftButton3NormalTexture,
                MultiBarBottomLeftButton4NormalTexture,
                MultiBarBottomLeftButton5NormalTexture,
                MultiBarBottomLeftButton6NormalTexture,
                MultiBarBottomLeftButton7NormalTexture,
                MultiBarBottomLeftButton8NormalTexture,
                MultiBarBottomLeftButton9NormalTexture,
                MultiBarBottomLeftButton10NormalTexture,
                MultiBarBottomLeftButton11NormalTexture,
                MultiBarBottomLeftButton12NormalTexture,
                MultiBarBottomRightButton1NormalTexture,
                MultiBarBottomRightButton2NormalTexture,
                MultiBarBottomRightButton3NormalTexture,
                MultiBarBottomRightButton4NormalTexture,
                MultiBarBottomRightButton5NormalTexture,
                MultiBarBottomRightButton6NormalTexture,
                MultiBarBottomRightButton7NormalTexture,
                MultiBarBottomRightButton8NormalTexture,
                MultiBarBottomRightButton9NormalTexture,
                MultiBarBottomRightButton10NormalTexture,
                MultiBarBottomRightButton11NormalTexture,
                MultiBarBottomRightButton12NormalTexture,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            --[[
            -- ProfessionsFrame
            for i, v in pairs({ 
                ProfessionsFrame.NineSlice.TopEdge,
                ProfessionsFrame.NineSlice.RightEdge,
                ProfessionsFrame.NineSlice.BottomEdge,
                ProfessionsFrame.NineSlice.LeftEdge,
                ProfessionsFrame.NineSlice.TopRightCorner,
                ProfessionsFrame.NineSlice.TopLeftCorner,
                ProfessionsFrame.NineSlice.BottomLeftCorner,
                ProfessionsFrame.NineSlice.BottomRightCorner,
                ProfessionsFrame.CraftingPage.RankBar.Border,
                ProfessionsFrame.CraftingPage.SchematicForm.OutputIcon.IconBorder,
                DropDownList1MenuBackdrop.NineSlice.TopEdge,
                DropDownList1MenuBackdrop.NineSlice.RightEdge,
                DropDownList1MenuBackdrop.NineSlice.BottomEdge,
                DropDownList1MenuBackdrop.NineSlice.LeftEdge,
                DropDownList1MenuBackdrop.NineSlice.TopRightCorner,
                DropDownList1MenuBackdrop.NineSlice.TopLeftCorner,
                DropDownList1MenuBackdrop.NineSlice.BottomLeftCorner,
                DropDownList1MenuBackdrop.NineSlice.BottomRightCorner,
                DropDownList2MenuBackdrop.NineSlice.TopEdge,
                DropDownList2MenuBackdrop.NineSlice.RightEdge,
                DropDownList2MenuBackdrop.NineSlice.BottomEdge,
                DropDownList2MenuBackdrop.NineSlice.LeftEdge,
                DropDownList2MenuBackdrop.NineSlice.TopRightCorner,
                DropDownList2MenuBackdrop.NineSlice.TopLeftCorner,
                DropDownList2MenuBackdrop.NineSlice.BottomLeftCorner,
            DropDownList2MenuBackdrop.NineSlice.BottomRightCorner,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            --]]
            -- Bags
            for i, v in pairs({ 
                ContainerFrame1.NineSlice,
                ContainerFrame2.NineSlice,
                ContainerFrame3.NineSlice,
                ContainerFrame4.NineSlice,
                ContainerFrame5.NineSlice,
                ContainerFrame6.NineSlice,
                ContainerFrame7.NineSlice,
                ContainerFrame8.NineSlice,
                ContainerFrame9.NineSlice,
                ContainerFrame10.NineSlice,
                ContainerFrame11.NineSlice,
                ContainerFrame12.NineSlice,
                ContainerFrame13.NineSlice,
                ContainerFrameCombinedBags.NineSlice,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
            -- StatusTrackingBarManager
            for i, v in pairs({ 
                StatusTrackingBarManager.BottomBarFrameTexture,
                StatusTrackingBarManager.TopBarFrameTexture,
             }) do
                if AbyssUIAddonSettings ~= nil then
                    AbyssUI_ColorizationFrameFunction(v)
                end
            end
       -- End
        else
            return nil
        end
    end     
end)
---------------------------- NewUI Functions ----------------------------------
-- ClassTalentFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_ClassTalentUI" and GetWoWVersion >= 90500 then
    for i, v in pairs({ 
      ClassTalentFrame.NineSlice.RightEdge,
      ClassTalentFrame.NineSlice.LeftEdge,
      ClassTalentFrame.NineSlice.TopEdge,
      ClassTalentFrame.NineSlice.BottomEdge,
      ClassTalentFrame.NineSlice.PortraitFrame,
      ClassTalentFrame.NineSlice.TopRightCorner,
      ClassTalentFrame.NineSlice.TopLeftCorner,
      ClassTalentFrame.NineSlice.BottomLeftCorner,
      ClassTalentFrame.NineSlice.BottomRightCorner,
     }) do
      if AbyssUIAddonSettings ~= nil then
        AbyssUI_ColorizationFrameFunction(v)
      end
    end
  end
end)
-- ProfessionsFrame
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
  if name == "Blizzard_Professions" and GetWoWVersion >= 90500 then
    for i, v in pairs({ 
        ProfessionsFrame.NineSlice.TopEdge,
        ProfessionsFrame.NineSlice.RightEdge,
        ProfessionsFrame.NineSlice.BottomEdge,
        ProfessionsFrame.NineSlice.LeftEdge,
        ProfessionsFrame.NineSlice.TopRightCorner,
        ProfessionsFrame.NineSlice.TopLeftCorner,
        ProfessionsFrame.NineSlice.BottomLeftCorner,
        ProfessionsFrame.NineSlice.BottomRightCorner,
        ProfessionsFrame.CraftingPage.RankBar.Border,
        ProfessionsFrame.CraftingPage.SchematicForm.OutputIcon.IconBorder,
        DropDownList1MenuBackdrop.NineSlice.TopEdge,
        DropDownList1MenuBackdrop.NineSlice.RightEdge,
        DropDownList1MenuBackdrop.NineSlice.BottomEdge,
        DropDownList1MenuBackdrop.NineSlice.LeftEdge,
        DropDownList1MenuBackdrop.NineSlice.TopRightCorner,
        DropDownList1MenuBackdrop.NineSlice.TopLeftCorner,
        DropDownList1MenuBackdrop.NineSlice.BottomLeftCorner,
        DropDownList1MenuBackdrop.NineSlice.BottomRightCorner,
        DropDownList2MenuBackdrop.NineSlice.TopEdge,
        DropDownList2MenuBackdrop.NineSlice.RightEdge,
        DropDownList2MenuBackdrop.NineSlice.BottomEdge,
        DropDownList2MenuBackdrop.NineSlice.LeftEdge,
        DropDownList2MenuBackdrop.NineSlice.TopRightCorner,
        DropDownList2MenuBackdrop.NineSlice.TopLeftCorner,
        DropDownList2MenuBackdrop.NineSlice.BottomLeftCorner,
    DropDownList2MenuBackdrop.NineSlice.BottomRightCorner,
     }) do
      if AbyssUIAddonSettings ~= nil then
        AbyssUI_ColorizationFrameFunction(v)
      end
    end
  end
end)
-- End
-- Init
local f = CreateFrame("Frame")
f:SetSize(50, 50)
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
	character = UnitName("player").."-"..GetRealmName()
	if not AbyssUIAddonSettings then
    	AbyssUIAddonSettings = {}
  	end
  	if not AbyssUIAddonSettings[character] then
    	AbyssUIAddonSettings[character] = {}
  	end
end)
-- Start Function
local function AbyssUIStart()
	AbyssUIFirstFrame:Show()
end
--Save
local AbyssUISave = CreateFrame("Frame")
AbyssUISave:RegisterEvent("ADDON_LOADED")
AbyssUISave:RegisterEvent("PLAYER_LOGOUT")
AbyssUISave:SetScript("OnEvent", function(self, event, arg1)
	if (event == "ADDON_LOADED" and arg1 == "DefaultUI_DemonHunter") then
		if (AbyssUICount == nil) then
			AbyssUICount = 0
		end
		if (AbyssUIProfile == nil) then
			AbyssUICount = AbyssUICount + 1
			AbyssUIStart()
		else
			AbyssUIFirstFrame:Hide()
		end
	elseif (event == "PLAYER_LOGOUT") then
		AbyssUIProfile = time()
	else
		return nil
	end
end)
-- End
