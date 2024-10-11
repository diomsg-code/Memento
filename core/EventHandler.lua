local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

------------------------
--- Public functions ---
------------------------

function Memento:AchievementPersonalEventHandler(achievementID, alreadyEarned)
    if not alreadyEarned then
        self:PrintMessage(L["chat.event.achievement.personal.new"]:format(GetAchievementLink(achievementID)))
        self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_EARNED_PERSONAL)
    elseif self.db.profile.events.achievement.personal.exist then
        self:PrintMessage(L["chat.event.achievement.personal.exist"]:format(GetAchievementLink(achievementID)))
        self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_EARNED_PERSONAL)
    else
        self:PrintDebug("No screenshot has been taken as the achievement ".. GetAchievementLink(achievementID) .. " has already been reached by another character")
    end
end

function Memento:CriteriaEventHandler(achievementID, description)
    self:PrintMessage(L["chat.event.achievement.criteria.new"]:format(GetAchievementLink(achievementID), description))
    self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_CRITERIA_EARNED)
end

function Memento:AchievementGuildEventHandler(achievementID)
    local name = select(2, GetAchievementInfo(achievementID))

    self:PrintMessage(L["chat.event.achievement.guild.new"]:format(name))
    self:TakeScreenshot(Memento.EVENT_ACHIEVEMENT_CRITERIA_EARNED)
end

function Memento:EncounterVictoryEventHandler(encounterName, difficultyName, difficulty, encounterID)
	self:PrintMessage(L["chat.event.encounter.victory.new"]:format(encounterName, difficultyName))
    self:TakeScreenshot(Memento.EVENT_ENCOUNTER_END_VICTORY)

    Memento_DataBossKill[difficulty][encounterID] = true
end

function Memento:EncounterWipeEventHandler(encounterName, difficultyName)
	self:PrintMessage(L["chat.event.encounter.wipe.new"]:format(encounterName, difficultyName))
    self:TakeScreenshot(Memento.EVENT_ENCOUNTER_END_WIPE)
end

function Memento:LevelUpEventHandler(level)
	self:PrintMessage(L["chat.event.levelUp.new"]:format(Memento_GetLevelUpLink(level)))
    self:TakeScreenshot(Memento.EVENT_PLAYER_LEVEL_UP)
end

function Memento:DeathEventHandler()
	self:PrintMessage(L["chat.event.death.new"])
    self:TakeScreenshot(Memento.EVENT_PLAYER_DEAD)
end

function Memento:DuelEventHandler()
	self:PrintMessage(L["chat.event.duel.new"])
    self:TakeScreenshot(Memento.EVENT_DUEL_FINISHED)
end

function Memento:LoginEventHandler()
	self:PrintMessage(L["chat.event.login.new"])
    self:TakeScreenshot(Memento.EVENT_PLAYER_LOGIN)
end
