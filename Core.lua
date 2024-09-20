local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
Memento = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

Memento.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
Memento.author = C_AddOns.GetAddOnMetadata(addonName, "Author")
Memento.flavor = C_AddOns.GetAddOnMetadata(addonName, "X-Flavor")
Memento.buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate")

Memento.gameVersion = GetBuildInfo()

local mediaPath = "Interface\\AddOns\\" .. addonName .. "\\media\\"

local EVENT_ACHIEVEMENT_PERSONAL = 1
local EVENT_ACHIEVEMENT_GUILD = 2
local EVENT_ENCOUNTER = 3
local EVENT_LEVEL_UP = 4
local EVENT_DEATH = 5
local EVENT_DUEL = 6
local EVENT_LOGIN = 7

-------------------------
--- Memento functions ---
-------------------------
function Memento:OnInitialize()
    self:SetupOptions()

    if (not Memento_DataBossKill) then
        Memento_DataBossKill = {}
    end

	self:RegisterChatCommand("memento", "SlashCommand")

    if self.flavor == "Retail" or self.flavor == "Cata" then
        self:RegisterEvent(
            "ACHIEVEMENT_EARNED",
            function(_, achievementID, alreadyEarned)
                local isGuildAchievement = select(12, GetAchievementInfo(achievementID))

                if not isGuildAchievement then
                    if self.db.profile.events.achievement.personal.active then
                        self:ScheduleTimer("TimerScreenshotPersonalAchievement", self.db.profile.events.achievement.personal.timer, achievementID, alreadyEarned)
                    end
                else
                    if self.db.profile.events.achievement.guild.active then
                        self:ScheduleTimer("TimerScreenshotGuildAchievement", self.db.profile.events.achievement.guild.timer, achievementID)
                    end
                end
            end
        )

        self:PrintDebug("Event \"ACHIEVEMENT_EARNED\" registered. (Retail / Cata)")
    end

    self:RegisterEvent(
        "ENCOUNTER_END",
        function(_, encounterID, encounterName, difficultyID, groupSize, success)
            self:PrintDebug("Event \"ENCOUNTER_END\" fired. encounterID=" .. encounterID .. ", encounterName=" .. encounterName .. ", difficultyID=" .. difficultyID .. ", groupSize=" .. groupSize .. ", success=" .. success)

            local difficultyName, groupType = GetDifficultyInfo(difficultyID)
            local difficulty = "D" .. difficultyID

            if (success == 1 and ((groupType == "party" and self.db.profile.events.encounter.party) or (groupType == "raid" and self.db.profile.events.encounter.raid) or (groupType == "scenario" and self.db.profile.events.encounter.scenario))) then 
                if (not Memento_DataBossKill[difficulty]) then 
                    Memento_DataBossKill[difficulty] = {}
                end

                if (Memento_DataBossKill[difficulty][encounterID] and self.db.profile.events.encounter.first) then
                    self:PrintDebug("Encounter already killed and no screenshot requested.")
                    return
                end

                self:ScheduleTimer("TimerScreenshotEncounter", self.db.profile.events.encounter.timer, encounterName, difficultyName, difficulty, encounterID)
            end
        end
    )

    self:PrintDebug("Event \"ENCOUNTER_END\" registered.")

    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function(_, level)
            if self.db.profile.events.levelUp.active then
                self:ScheduleTimer("TimerScreenshotLevelUp", self.db.profile.events.levelUp.timer, level)
            end
        end
    )

    self:PrintDebug("Event \"PLAYER_LEVEL_UP\" registered.")

    self:RegisterEvent(
        "PLAYER_DEAD",
        function()
            if self.db.profile.events.death.active then
                self:ScheduleTimer("TimerScreenshotDeath", self.db.profile.events.death.timer)
            end
        end
    )

    self:PrintDebug("Event \"PLAYER_DEAD\" registered.")

    self:RegisterEvent(
        "DUEL_FINISHED",
        function()
            if self.db.profile.events.duel.active then
                self:ScheduleTimer("TimerScreenshotDuel", self.db.profile.events.duel.timer)
            end
        end
    )

    self:PrintDebug("Event \"DUEL_FINISHED\" registered.")

    self:RegisterEvent(
        "PLAYER_LOGIN",
        function()
            if self.db.profile.events.login.active then
                self:ScheduleTimer("TimerScreenshotLogin", self.db.profile.events.login.timer)
            end
        end
    )

    self:PrintDebug("Event \"PLAYER_LOGIN\" registered.")

    if self.db.profile.options.statistic then
        Memento:PrintStatistic()
    end

    self:PrintDebug("Addon fully loaded.")
end

function Memento:TimerScreenshotPersonalAchievement(achievementID, alreadyEarned)
    local name = select(2, GetAchievementInfo(achievementID))

    if not alreadyEarned then
        self:PrintMessage(L["chat.events.achievement.personal.new"] .. name)
        self:TakeScreenshot(EVENT_ACHIEVEMENT_PERSONAL)
    elseif self.db.profile.events.achievement.personal.exist then
        self:PrintMessage(L["chat.events.achievement.personal.exist"] .. name)
        self:TakeScreenshot(EVENT_ACHIEVEMENT_PERSONAL)
    else
        self:PrintDebug("No screenshot has been taken as the achievement has already been reached by another character: " .. name)
    end
end

function Memento:TimerScreenshotGuildAchievement(achievementID)
    local name = select(2, GetAchievementInfo(achievementID))

    self:PrintMessage(L["chat.events.achievement.guild.new"] .. name)
    self:TakeScreenshot(EVENT_ACHIEVEMENT_GUILD)
end

function Memento:TimerScreenshotEncounter(encounterName, difficultyName, difficulty, encounterID)
	self:PrintMessage(L["chat.events.encounter.new"] .. encounterName .. " (" .. difficultyName .. ")")
    self:TakeScreenshot(EVENT_ENCOUNTER)

    Memento_DataBossKill[difficulty][encounterID] = true
end

function Memento:TimerScreenshotLevelUp(level)
	self:PrintMessage(L["chat.events.levelUp.new"] .. level)
    self:TakeScreenshot(EVENT_LEVEL_UP)
end

function Memento:TimerScreenshotDeath()
	self:PrintMessage(L["chat.events.death.new"])
    self:TakeScreenshot(EVENT_DEATH)
end

function Memento:TimerScreenshotDuel()
	self:PrintMessage(L["chat.events.duel.new"])
    self:TakeScreenshot(EVENT_DUEL)
end

function Memento:TimerScreenshotLogin()
	self:PrintMessage(L["chat.events.login.new"])
    self:TakeScreenshot(EVENT_LOGIN)
end

function Memento:SlashCommand(msg)
	if not msg or msg:trim() == "" then
        Settings.OpenToCategory(addonName)
	else
        self:PrintDebug("No arguments will be accepted.")
	end
end
