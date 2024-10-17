local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local Memento = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

Memento.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
Memento.author = C_AddOns.GetAddOnMetadata(addonName, "Author")
Memento.flavor = C_AddOns.GetAddOnMetadata(addonName, "X-Flavor")
Memento.buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate")
Memento.eMail = C_AddOns.GetAddOnMetadata(addonName, "X-E-Mail")
Memento.github = C_AddOns.GetAddOnMetadata(addonName, "X-Github")

Memento.gameVersion = GetBuildInfo()

---------------------
--- Main funtions ---
---------------------

function Memento:OnInitialize()
    self:SetupAddon()

    if self.flavor == "Cata" or self.flavor == "Retail" then
        self:RegisterEvent(
            "ACHIEVEMENT_EARNED",
            function(_, achievementID, alreadyEarned)
                self:PrintDebug("Event 'ACHIEVEMENT_EARNED' fired. Payload: achievementID=" .. achievementID .. ", alreadyEarned=" .. tostring(alreadyEarned))

                local isGuildAchievement = select(12, GetAchievementInfo(achievementID))

                if not isGuildAchievement then
                    if self.db.profile.events.achievement.personal.active then
                        self:ScheduleTimer("AchievementPersonalEventHandler", self.db.profile.events.achievement.personal.timer, achievementID, alreadyEarned)
                    end
                else
                    if self.db.profile.events.achievement.guild.active then
                        self:ScheduleTimer("AchievementGuildEventHandler", self.db.profile.events.achievement.guild.timer, achievementID)
                    end
                end
            end
        )

        self:PrintDebug("Event 'ACHIEVEMENT_EARNED' registered. (Retail / Cata)")
    end

    if self.flavor == "Retail" then
        self:RegisterEvent(
            "CRITERIA_EARNED",
            function(_, achievementID, description)
                self:PrintDebug("Event 'CRITERIA_EARNED' fired. Payload: achievementID=" .. tostring(achievementID) .. ", description=" .. tostring(description))

                if self.db.profile.events.achievement.criteria.active then
                    self:ScheduleTimer("CriteriaEventHandler", 2, achievementID, description)
                end
            end
        )

        self:PrintDebug("Event 'CRITERIA_EARNED' registered. (Retail)")
    end

    self:RegisterEvent(
        "ENCOUNTER_END",
        function(_, encounterID, encounterName, difficultyID, groupSize, success)
            self:PrintDebug("Event 'ENCOUNTER_END' fired. Payload: encounterID=" .. encounterID .. ", encounterName=" .. encounterName .. ", difficultyID=" .. difficultyID .. ", groupSize=" .. groupSize .. ", success=" .. success)

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

                self:ScheduleTimer("EncounterVictoryEventHandler", self.db.profile.events.encounter.victory.timer, encounterName, difficultyName, difficulty, encounterID)
            elseif (success == 0 and ((groupType == "party" and self.db.profile.events.encounter.wipe.party) or (groupType == "raid" and self.db.profile.events.encounter.wipe.raid) or (groupType == "scenario" and self.db.profile.events.encounter.wipe.scenario))) then
                self:ScheduleTimer("EncounterWipeEventHandler", self.db.profile.events.encounter.wipe.timer, encounterName, difficultyName)
            end
        end
    )

    self:PrintDebug("Event 'ENCOUNTER_END' registered.")

    self:RegisterEvent(
        "DUEL_FINISHED",
        function()
            self:PrintDebug("Event 'DUEL_FINISHED' fired. No payload.")

            if self.db.profile.events.duel.active then
                self:ScheduleTimer("PvPDuelEventHandler", self.db.profile.events.duel.timer)
            end
        end
    )

    self:PrintDebug("Event 'DUEL_FINISHED' registered.")

    if self.flavor == "Retail" then
        self:RegisterEvent(
            "PVP_MATCH_COMPLETE",
            function(_, winner, duration)
                self:PrintDebug("Event \"PVP_MATCH_COMPLETE\" fired. Payload: winner=" .. tostring(winner) .. ", duration=" .. tostring(duration))

                local isArena = C_PvP.IsArena()
                local isBattleground = C_PvP.IsBattleground()

                if self.db.profile.events.pvp.arena.active and isArena then
                    self:ScheduleTimer("PvPArenaEventHandler", self.db.profile.events.pvp.battleground.timer)
                elseif self.db.profile.events.pvp.battleground.active and isBattleground then
                    self:ScheduleTimer("PvPBattlegroundEventHandler", self.db.profile.events.pvp.battleground.timer)
                else
                    self:PrintDebug("Unknown PvP Event completed.")
                end
            end
        )

        self:PrintDebug("Event 'PVP_MATCH_COMPLETE' registered. (Retail)")
    end

    self:RegisterEvent(
        "PLAYER_LEVEL_UP",
        function(_, level)
            self:PrintDebug("Event 'PLAYER_LEVEL_UP' fired. Payload: level=" .. level)

            if self.db.profile.events.levelUp.active then
                self:ScheduleTimer("LevelUpEventHandler", self.db.profile.events.levelUp.timer, level)
            end
        end
    )

    self:PrintDebug("Event 'PLAYER_LEVEL_UP' registered.")

    self:RegisterEvent(
        "PLAYER_DEAD",
        function()
            self:PrintDebug("Event 'PLAYER_DEAD' fired. No payload.")

            if self.db.profile.events.death.active then
                self:ScheduleTimer("DeathEventHandler", self.db.profile.events.death.timer)
            end
        end
    )

    self:PrintDebug("Event 'PLAYER_DEAD' registered.")

    self:RegisterEvent(
        "PLAYER_LOGIN",
        function()
            self:PrintDebug("Event 'PLAYER_LOGIN' fired. No payload.")

            if self.db.profile.events.login.active then
                self:ScheduleTimer("LoginEventHandler", self.db.profile.events.login.timer)
            end
        end
    )

    self:PrintDebug("Event 'PLAYER_LOGIN' registered.")

    if self.db.profile.options.statistic then
        Memento:PrintStatistic()
    end

    self:PrintDebug("Addon fully loaded.")
end
