local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
Memento = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

Memento.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
Memento.author = C_AddOns.GetAddOnMetadata(addonName, "Author")
Memento.flavor = C_AddOns.GetAddOnMetadata(addonName, "X-Flavor")

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
            },
            death = {
                active = true,
                timer = 1
            }
		}
    }
}

local defaults_vanilla = {
    profile = {
        setting = {
            notification = true,
			debug = false
		},
		event = {
            levelUp = {
                active = true,
                timer = 5
            },
            death = {
                active = true,
                timer = 1
            }
		}
    }
}

local defaults_cata = {
    profile = {
        setting = {
            notification = true,
			debug = false
		},
		event = {
            levelUp = {
                active = true,
                timer = 5
            },
            death = {
                active = true,
                timer = 1
            }
		}
    }
}

-- Local functions
local function markWhiteFont(text)
	return WrapTextInColorCode(text, "FFFFFFFF")
end

local function markLightYellowFont(text)
	return WrapTextInColorCode(text, "FFFFFF99")
end

local function markOrangeFont(text)
	return WrapTextInColorCode(text, "FFFF8040")
end

local function printMessage(msg)
    if Memento.db.profile.setting.notification then
        DEFAULT_CHAT_FRAME:AddMessage(markLightYellowFont("Memento: ") .. markWhiteFont(msg))
    end
end

local function printDebug(msg)
    if Memento.db.profile.setting.debug then
        DEFAULT_CHAT_FRAME:AddMessage(markOrangeFont("Debug (Memento): " .. msg))
	end
end

-- Memento functions
function Memento:OnInitialize()
    if self.flavor == "Vanilla" then
        self.db = LibStub("AceDB-3.0"):New("MementoDatabase", defaults_vanilla, true)
        printDebug("Vanilla default options have been loaded.")
    elseif self.flavor == "Cata" then
        self.db = LibStub("AceDB-3.0"):New("MementoDatabase", defaults_cata, true)
        printDebug("Cata default options have been loaded.")
    else
        self.db = LibStub("AceDB-3.0"):New("MementoDatabase", defaults, true)
        printDebug("Retail default options have been loaded.")
    end

	self:RegisterChatCommand("memento", "SlashCommand")

    if self.flavor == "Retail" then
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

        printDebug("Event \"ACHIEVEMENT_EARNED\" registered. (Retail)")
    end
    
    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function(_, level)
            if self.db.profile.event.levelUp.active then
                self:ScheduleTimer("TimerScreenshotLevelUp", self.db.profile.event.levelUp.timer, level)
            end
        end
    )

    printDebug("Event \"PLAYER_LEVEL_UP\" registered.")

    self:RegisterEvent(
        "PLAYER_DEAD",
        function()
            if self.db.profile.event.death.active then
                self:ScheduleTimer("TimerScreenshotDeath", self.db.profile.event.death.timer)
            end
        end
    )

    printDebug("Event \"PLAYER_DEAD\" registered.")
    printDebug("Addon has been fully loaded.")
end

function Memento:TimerScreenshotPersonalAchievement(achievementID, alreadyEarned)
    local name = select(2, GetAchievementInfo(achievementID))

    if not alreadyEarned then
        printMessage(L["chat.event.achievement.personal.new"] .. name)
        Screenshot()
    elseif self.db.profile.event.achievement.personal.exist then
        printMessage(L["chat.event.achievement.personal.exist"] .. name)
        Screenshot()
    else
        printDebug("No screenshot has been taken as the achievement has already been reached by another character." .. name)
    end
end

function Memento:TimerScreenshotGuildAchievement(achievementID)
    local name = select(2, GetAchievementInfo(achievementID))

    printMessage(L["chat.event.achievement.guild.new"] .. name)
    Screenshot()
end

function Memento:TimerScreenshotLevelUp(level)
	printMessage(L["chat.event.levelUp.new"] .. level)
	Screenshot()
end

function Memento:TimerScreenshotDeath()
	printMessage(L["chat.event.death.new"])
	Screenshot()
end

function Memento:SlashCommand(msg)
	if not msg or msg:trim() == "" then
        Settings.OpenToCategory(addonName)
	else
        printDebug("No arguments will be accepted.")
	end
end