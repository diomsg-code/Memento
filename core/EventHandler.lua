local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

------------------------
--- Public functions ---
------------------------

function Memento:TimerScreenshotAchievementPersonal(achievementID, alreadyEarned)
    local name = select(2, GetAchievementInfo(achievementID))

    if not alreadyEarned then
        self:PrintMessage(L["chat.events.achievement.personal.new"] .. name)
        self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_EARNED_PERSONAL)
    elseif self.db.profile.events.achievement.personal.exist then
        self:PrintMessage(L["chat.events.achievement.personal.exist"] .. name)
        self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_EARNED_PERSONAL)
    else
        self:PrintDebug("No screenshot has been taken as the achievement has already been reached by another character: " .. name)
    end
end

function Memento:TimerScreenshotAchievementGuild(achievementID)
    local name = select(2, GetAchievementInfo(achievementID))

    self:PrintMessage(L["chat.events.achievement.guild.new"] .. name)
    self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_EARNED_GUILD)
end

function Memento:TimerScreenshotEncounterVictory(encounterName, difficultyName, difficulty, encounterID)
	self:PrintMessage(L["chat.events.encounter.victory.new"] .. encounterName .. " (" .. difficultyName .. ")")
    self:TakeScreenshot(Memento.EVENT_ENCOUNTER_END_VICTORY)

    Memento_DataBossKill[difficulty][encounterID] = true
end

function Memento:TimerScreenshotEncounterWipe(encounterName, difficultyName)
	self:PrintMessage(L["chat.events.encounter.wipe.new"] .. encounterName .. " (" .. difficultyName .. ")")
    self:TakeScreenshot(Memento.EVENT_ENCOUNTER_END_WIPE)
end

function Memento:TimerScreenshotLevelUp(level)
	self:PrintMessage(L["chat.events.levelUp.new"] .. level)
    self:TakeScreenshot(Memento.EVENT_PLAYER_LEVEL_UP)
end

function Memento:TimerScreenshotDeath()
	self:PrintMessage(L["chat.events.death.new"])
    self:TakeScreenshot(Memento.EVENT_PLAYER_DEAD)
end

function Memento:TimerScreenshotDuel()
	self:PrintMessage(L["chat.events.duel.new"])
    self:TakeScreenshot(Memento.EVENT_DUEL_FINISHED)
end

function Memento:TimerScreenshotLogin()
	self:PrintMessage(L["chat.events.login.new"])
    self:TakeScreenshot(Memento.EVENT_PLAYER_LOGIN)
end
