local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
Memento = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

Memento.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
Memento.author = C_AddOns.GetAddOnMetadata(addonName, "Author")
Memento.flavor = C_AddOns.GetAddOnMetadata(addonName, "X-Flavor")
Memento.buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate")

Memento.gameVersion = GetBuildInfo()

local mediaPath = "Interface\\AddOns\\" .. addonName .. "\\media\\"

local EVENT_ACHIEVEMENT_EARNED_PERSONAL = 1
local EVENT_ACHIEVEMENT_EARNED_GUILD = 2
local EVENT_ENCOUNTER_END_VICTORY = 3
local EVENT_ENCOUNTER_END_WIPE = 4
local EVENT_PLAYER_LEVEL_UP = 5
local EVENT_PLAYER_DEAD = 6
local EVENT_DUEL_FINISHED = 7
local EVENT_PLAYER_LOGIN = 8

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
                self:PrintDebug("Event \"ACHIEVEMENT_EARNED\" fired. Payload: achievementID=" .. achievementID .. ", alreadyEarned=" .. tostring(alreadyEarned))

                local isGuildAchievement = select(12, GetAchievementInfo(achievementID))

                if not isGuildAchievement then
                    if self.db.profile.events.achievement.personal.active then
                        self:ScheduleTimer("TimerScreenshotAchievementPersonal", self.db.profile.events.achievement.personal.timer, achievementID, alreadyEarned)
                    end
                else
                    if self.db.profile.events.achievement.guild.active then
                        self:ScheduleTimer("TimerScreenshotAchievementGuild", self.db.profile.events.achievement.guild.timer, achievementID)
                    end
                end
            end
        )

        self:PrintDebug("Event \"ACHIEVEMENT_EARNED\" registered. (Retail / Cata)")
    end

    self:RegisterEvent(
        "ENCOUNTER_END",
        function(_, encounterID, encounterName, difficultyID, groupSize, success)
            self:PrintDebug("Event \"ENCOUNTER_END\" fired. Payload: encounterID=" .. encounterID .. ", encounterName=" .. encounterName .. ", difficultyID=" .. difficultyID .. ", groupSize=" .. groupSize .. ", success=" .. success)

            local difficultyName, groupType = GetDifficultyInfo(difficultyID)
            local difficulty = "D" .. difficultyID

            if (success == 1 and ((groupType == "party" and self.db.profile.events.encounter.victory.party) or (groupType == "raid" and self.db.profile.events.encounter.victory.raid) or (groupType == "scenario" and self.db.profile.events.encounter.victory.scenario))) then 
                if (not Memento_DataBossKill[difficulty]) then 
                    Memento_DataBossKill[difficulty] = {}
                end

                if (Memento_DataBossKill[difficulty][encounterID] and self.db.profile.events.encounter.victory.first) then
                    self:PrintDebug("Encounter already killed and no screenshot requested.")
                    return
                end

                self:ScheduleTimer("TimerScreenshotEncounterVictory", self.db.profile.events.encounter.victory.timer, encounterName, difficultyName, difficulty, encounterID)
            elseif (success == 0 and ((groupType == "party" and self.db.profile.events.encounter.wipe.party) or (groupType == "raid" and self.db.profile.events.encounter.wipe.raid) or (groupType == "scenario" and self.db.profile.events.encounter.wipe.scenario))) then
                self:ScheduleTimer("TimerScreenshotEncounterWipe", self.db.profile.events.encounter.wipe.timer, encounterName, difficultyName)
            end
        end
    )

    self:PrintDebug("Event \"ENCOUNTER_END\" registered.")

    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function(_, level)
            self:PrintDebug("Event \"PLAYER_LEVEL_UP\" fired. Payload: level=" .. level)

            if self.db.profile.events.levelUp.active then
                self:ScheduleTimer("TimerScreenshotLevelUp", self.db.profile.events.levelUp.timer, level)
            end
        end
    )

    self:PrintDebug("Event \"PLAYER_LEVEL_UP\" registered.")

    self:RegisterEvent(
        "PLAYER_DEAD",
        function()
            self:PrintDebug("Event \"PLAYER_DEAD\" fired. No payload.")

            if self.db.profile.events.death.active then
                self:ScheduleTimer("TimerScreenshotDeath", self.db.profile.events.death.timer)
            end
        end
    )

    self:PrintDebug("Event \"PLAYER_DEAD\" registered.")

    self:RegisterEvent(
        "DUEL_FINISHED",
        function()
            self:PrintDebug("Event \"DUEL_FINISHED\" fired. No payload.")

            if self.db.profile.events.duel.active then
                self:ScheduleTimer("TimerScreenshotDuel", self.db.profile.events.duel.timer)
            end
        end
    )

    self:PrintDebug("Event \"DUEL_FINISHED\" registered.")

    self:RegisterEvent(
        "PLAYER_LOGIN",
        function()
            self:PrintDebug("Event \"PLAYER_LOGIN\" fired. No payload.")

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

function Memento:TimerScreenshotAchievementPersonal(achievementID, alreadyEarned)
    local name = select(2, GetAchievementInfo(achievementID))

    if not alreadyEarned then
        self:PrintMessage(L["chat.events.achievement.personal.new"] .. name)
        self:TakeScreenshot(EVENT_ACHIEVEMENT_EARNED_PERSONAL)
    elseif self.db.profile.events.achievement.personal.exist then
        self:PrintMessage(L["chat.events.achievement.personal.exist"] .. name)
        self:TakeScreenshot(EVENT_ACHIEVEMENT_EARNED_PERSONAL)
    else
        self:PrintDebug("No screenshot has been taken as the achievement has already been reached by another character: " .. name)
    end
end

function Memento:TimerScreenshotAchievementGuild(achievementID)
    local name = select(2, GetAchievementInfo(achievementID))

    self:PrintMessage(L["chat.events.achievement.guild.new"] .. name)
    self:TakeScreenshot(EVENT_ACHIEVEMENT_EARNED_GUILD)
end

function Memento:TimerScreenshotEncounterVictory(encounterName, difficultyName, difficulty, encounterID)
	self:PrintMessage(L["chat.events.encounter.victory.new"] .. encounterName .. " (" .. difficultyName .. ")")
    self:TakeScreenshot(EVENT_ENCOUNTER_END_VICTORY)

    Memento_DataBossKill[difficulty][encounterID] = true
end

function Memento:TimerScreenshotEncounterWipe(encounterName, difficultyName)
	self:PrintMessage(L["chat.events.encounter.wipe.new"] .. encounterName .. " (" .. difficultyName .. ")")
    self:TakeScreenshot(EVENT_ENCOUNTER_END_WIPE)
end

function Memento:TimerScreenshotLevelUp(level)
	self:PrintMessage(L["chat.events.levelUp.new"] .. level)
    self:TakeScreenshot(EVENT_PLAYER_LEVEL_UP)
end

function Memento:TimerScreenshotDeath()
	self:PrintMessage(L["chat.events.death.new"])
    self:TakeScreenshot(EVENT_PLAYER_DEAD)
end

function Memento:TimerScreenshotDuel()
	self:PrintMessage(L["chat.events.duel.new"])
    self:TakeScreenshot(EVENT_DUEL_FINISHED)
end

function Memento:TimerScreenshotLogin()
	self:PrintMessage(L["chat.events.login.new"])
    self:TakeScreenshot(EVENT_PLAYER_LOGIN)
end

function Memento:SlashCommand(msg)
	if not msg or msg:trim() == "" then
        Settings.OpenToCategory(addonName)
	else
        self:PrintDebug("No arguments will be accepted.")
	end
end
