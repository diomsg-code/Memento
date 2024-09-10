local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
Memento = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

Memento.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
Memento.author = C_AddOns.GetAddOnMetadata(addonName, "Author")
Memento.gameVersion = GetBuildInfo()

-- Default
local defaults = {
    profile = {
        setting = {
            notification = true,
			debug = false
		},
		event = {
            achievement = {
                personal = {
                    active = true,
                    exist = false,
                    timer = 2,
                },
                guild = {
                    active = true,
                    timer = 2
                },
            },
            levelUp = {
                active = true,
                timer = 5
            }
		}
    }
}

-- Local functions
local function ShowScreenshotMessage(message)
    if Memento.db.profile.setting.notification then
        DEFAULT_CHAT_FRAME:AddMessage("|cnNORMAL_FONT_COLOR:" .. message .. "|r")
    end
end

local function ShowDebugMessage(message)
	if Memento.db.profile.setting.debug then
        DEFAULT_CHAT_FRAME:AddMessage("|cnWARNING_FONT_COLOR:Debug: " .. message .. "|r")
	end
end

-- Memento functions
function Memento:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("MementoDatabase", defaults, true)

    self:RegisterEvent(
        "ACHIEVEMENT_EARNED",
        function(_, achievementID, alreadyEarned)
            local isGuildAchievement = select(12, GetAchievementInfo(achievementID))

            if not isGuildAchievement then
                if self.db.profile.event.achievement.personal.active then
                    self:ScheduleTimer("TimerScreenshotPersonalAchievement", self.db.profile.event.achievement.personal.timer, achievementID, alreadyEarned)
                end
            else
                if self.db.profile.event.achievement.guild.active then
                    self:ScheduleTimer("TimerScreenshotGuildAchievement", self.db.profile.event.achievement.guild.timer, achievementID)
                end
            end
        end
    )
    
    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function(_, level)
            if self.db.profile.event.levelUp.active then
                self:ScheduleTimer("TimerScreenshotLevelUp", self.db.profile.event.levelUp.timer, level)
            end
        end
    )
end

function Memento:TimerScreenshotPersonalAchievement(achievementID, alreadyEarned)
    local name = select(2, GetAchievementInfo(achievementID))

    if not alreadyEarned then
        ShowScreenshotMessage(L["chat.event.achievement.personal.new"] .. name)
        Screenshot()
    elseif self.db.profile.event.achievement.personal.exist then
        ShowScreenshotMessage(L["chat.event.achievement.personal.exist"] .. name)
        Screenshot()
    else
        ShowDebugMessage(L["debug.event.achievement.personal.exist"] .. name)
    end
end

function Memento:TimerScreenshotGuildAchievement(achievementID)
    local name = select(2, GetAchievementInfo(achievementID))

    ShowScreenshotMessage(L["chat.event.achievement.guild.new"] .. name)
    Screenshot()
end

function Memento:TimerScreenshotLevelUp(level)
	ShowScreenshotMessage(L["chat.event.levelUp.new"] .. level)
	Screenshot()
end