local addonName, Memento = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

-----------------------
--- Public funtions ---
-----------------------

function Memento:PrintMessage(msg)
    if self.db.profile.options.notification then
        DEFAULT_CHAT_FRAME:AddMessage(MementoMarkNormalFont("Memento: ") .. msg)
    end
end

function Memento:PrintDebug(msg)
    if self.db.profile.options.debug then
        local notfound = true
        
        for i = 1, NUM_CHAT_WINDOWS do 
            local name, _, _, _, _, _, shown, locked, docked, uni = GetChatWindowInfo(i)

            if name == addonName and docked ~= nil then
                _G['ChatFrame' .. i]:AddMessage(msg)
                notfound = false
                break
            end
        end

        if notfound then
            DEFAULT_CHAT_FRAME:AddMessage(MementoMarkOrangeFont("Memento (Debug): ") .. msg)
        end
	end
end

function Memento:PrintStatistic()
    if self.db.profile.options.notification then
        local msg = MementoMarkNormalFont("Memento: ") .. L["statistic.screenshots.description"] .. "\n"

        if Memento.flavor == "Retail" or Memento.flavor == "Cata" then
            msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.achievement.personal"] .. ": ") .. self.dbStatstic.global.events.achievement.personal.count .. " (" .. self.dbStatstic.char.events.achievement.personal.count .. ")\n"
        end

        if Memento.flavor == "Retail" then
            msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.achievement.criteria"] .. ": ") .. self.dbStatstic.global.events.achievement.criteria.count .. " (" .. self.dbStatstic.char.events.achievement.criteria.count .. ")\n"
        end

        if Memento.flavor == "Retail" or Memento.flavor == "Cata" then
            msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.achievement.guild"] .. ": ") .. self.dbStatstic.global.events.achievement.guild.count .. " (" .. self.dbStatstic.char.events.achievement.guild.count .. ")\n"
        end

        msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.encounter.victory"] .. ": ") .. self.dbStatstic.global.events.encounter.victory.count .. " (" .. self.dbStatstic.char.events.encounter.victory.count .. ")\n"
        msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.encounter.wipe"] .. ": ") .. self.dbStatstic.global.events.encounter.wipe.count .. " (" .. self.dbStatstic.char.events.encounter.wipe.count .. ")\n"
        msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.levelUp"] .. ": ") .. self.dbStatstic.global.events.levelUp.count .. " (" .. self.dbStatstic.char.events.levelUp.count .. ")\n"
        msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.death"] .. ": ") .. self.dbStatstic.global.events.death.count .. " (" .. self.dbStatstic.char.events.death.count .. ")\n"
        msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.duel"] .. ": ") .. self.dbStatstic.global.events.duel.count .. " (" .. self.dbStatstic.char.events.duel.count .. ")\n"
        msg = msg .. MementoMarkGoldFont(L["statistic.screenshots.login"] .. ": ") .. self.dbStatstic.global.events.login.count .. " (" .. self.dbStatstic.char.events.login.count
        DEFAULT_CHAT_FRAME:AddMessage(msg)
	end
end
